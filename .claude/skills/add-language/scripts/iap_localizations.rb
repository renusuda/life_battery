# Shows or creates the localizations of the in-app purchases, the
# subscription and its group through the App Store Connect API.
#
# Usage (from the repository root):
#   bundle exec ruby .claude/skills/add-language/scripts/iap_localizations.rb
#     Prints every product's localizations. Read-only.
#   bundle exec ruby .claude/skills/add-language/scripts/iap_localizations.rb <locale> <values.json>
#     Creates the missing <locale> localizations. Existing ones are skipped.
#
# values.json:
#   {
#     "premium_lifetime": { "name": "...", "description": "..." },
#     "premium_lifetime_support": { "name": "...", "description": "..." },
#     "premium_monthly": { "name": "...", "description": "..." },
#     "subscription_group": { "name": "..." }
#   }
#
# Credentials come from fastlane/.env (ASC_KEY_ID, ASC_ISSUER_ID, ASC_KEY_PATH).
require "json"
require "net/http"
require "spaceship"

BUNDLE_ID = "com.rururu.lifebt"
SUBSCRIPTION_GROUP = "Premium"

env = File.readlines(File.expand_path("fastlane/.env")).map(&:strip).reject { |l| l.empty? || l.start_with?("#") }
          .to_h { |l| k, v = l.split("=", 2); [k, v.to_s.delete_prefix('"').delete_suffix('"')] }
TOKEN = Spaceship::ConnectAPI::Token.create(
  key_id: env.fetch("ASC_KEY_ID"),
  issuer_id: env.fetch("ASC_ISSUER_ID"),
  filepath: File.expand_path(env.fetch("ASC_KEY_PATH"))
)

def request(method, path, body = nil)
  uri = URI("https://api.appstoreconnect.apple.com#{path}")
  req = (method == :get ? Net::HTTP::Get : Net::HTTP::Post).new(uri)
  req["Authorization"] = "Bearer #{TOKEN.text}"
  if body
    req["Content-Type"] = "application/json"
    req.body = JSON.generate(body)
  end
  res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(req) }
  raise "#{method.upcase} #{path} -> #{res.code} #{res.body[0, 500]}" unless res.is_a?(Net::HTTPSuccess)
  JSON.parse(res.body)
end

# Each target: [label, localization type, relationship, parent type, parent id, path listing its localizations]
app = request(:get, "/v1/apps?filter[bundleId]=#{BUNDLE_ID}")["data"].first
targets = []
request(:get, "/v1/apps/#{app['id']}/inAppPurchasesV2?limit=50")["data"].each do |iap|
  next if iap["attributes"]["state"] == "DEVELOPER_REMOVED_FROM_SALE"

  targets << [iap["attributes"]["productId"], "inAppPurchaseLocalizations", :inAppPurchaseV2, "inAppPurchases",
              iap["id"], "/v2/inAppPurchases/#{iap['id']}/inAppPurchaseLocalizations"]
end
group = request(:get, "/v1/apps/#{app['id']}/subscriptionGroups")["data"]
        .find { |g| g["attributes"]["referenceName"] == SUBSCRIPTION_GROUP }
targets << ["subscription_group", "subscriptionGroupLocalizations", :subscriptionGroup, "subscriptionGroups",
            group["id"], "/v1/subscriptionGroups/#{group['id']}/subscriptionGroupLocalizations"]
request(:get, "/v1/subscriptionGroups/#{group['id']}/subscriptions")["data"].each do |sub|
  targets << [sub["attributes"]["productId"], "subscriptionLocalizations", :subscription, "subscriptions",
              sub["id"], "/v1/subscriptions/#{sub['id']}/subscriptionLocalizations"]
end

locale, values_path = ARGV
values = values_path ? JSON.parse(File.read(values_path)) : {}
unknown = values.keys - targets.map(&:first)
abort "Unknown products in #{values_path}: #{unknown.join(', ')}" unless unknown.empty?

targets.each do |label, type, relationship, parent_type, parent_id, list_path|
  existing = request(:get, list_path)["data"]
  if locale.nil?
    puts label
    existing.each do |l|
      a = l["attributes"]
      puts "  #{a['locale']} [#{a['state']}] name=#{a['name'].inspect} description=#{a['description'].inspect}"
    end
  elsif !values.key?(label)
    puts "#{label}: no value for #{locale}, skipped"
  elsif existing.any? { |l| l["attributes"]["locale"] == locale }
    puts "#{label}: #{locale} already exists, skipped"
  else
    attributes = values[label].transform_values { |v| v.unicode_normalize(:nfc) }.merge("locale" => locale)
    body = { data: { type: type, attributes: attributes,
                     relationships: { relationship => { data: { type: parent_type, id: parent_id } } } } }
    created = request(:post, "/v1/#{type}", body)["data"]["attributes"]
    puts "#{label}: created #{created.slice('locale', 'name', 'description', 'state')}"
  end
end

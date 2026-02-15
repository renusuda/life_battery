import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), percentage: 100)
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
    let entry = entryFromUserDefaults()
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    let entry = entryFromUserDefaults()
    let timeline = Timeline(entries: [entry], policy: .atEnd)
    completion(timeline)
  }

  private func entryFromUserDefaults() -> SimpleEntry {
    let defaults = UserDefaults(suiteName: "group.com.rururu.lifebt")
    let percentage = defaults?.integer(forKey: "percentage") ?? 100
    return SimpleEntry(date: Date(), percentage: percentage)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let percentage: Int
}

func batteryColor(for percentage: Int) -> Color {
  if percentage > 50 {
    return Color(red: 16 / 255, green: 185 / 255, blue: 129 / 255)
  }
  if percentage >= 20 {
    return Color(red: 251 / 255, green: 191 / 255, blue: 36 / 255)
  }
  return Color(red: 244 / 255, green: 63 / 255, blue: 94 / 255)
}

struct LifeBatteryWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    VStack(spacing: 8) {
      Text(String(localized: "widget.titleLabel"))
        .font(.system(size: 12, weight: .bold))
        .textCase(.uppercase)
        .foregroundColor(.primary)

      HStack(spacing: 4) {
        ZStack {
          // Frame
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.primary, lineWidth: 4)

          // Filled bar (masked to percentage width)
          RoundedRectangle(cornerRadius: 12)
            .fill(batteryColor(for: entry.percentage))
            .padding(6)
            .mask(alignment: .leading) {
              GeometryReader { geo in
                let pct = CGFloat(max(min(entry.percentage, 100), 0))
                Rectangle()
                  .frame(width: geo.size.width * pct / 100)
              }
            }

          // Percentage text
          Text(verbatim: "\(entry.percentage)%")
            .font(.system(size: 26, weight: .bold, design: .rounded))
            .foregroundColor(.primary)
        }
        .frame(height: 56)

        // Battery knob
        UnevenRoundedRectangle(
          bottomTrailingRadius: 10,
          topTrailingRadius: 10
        )
        .fill(Color.primary)
        .frame(width: 10, height: 20)
      }
    }
    .padding(.horizontal, 4)
  }
}

struct LifeBatteryWidget: Widget {
  let kind: String = "LifeBatteryWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      if #available(iOS 17.0, *) {
        LifeBatteryWidgetEntryView(entry: entry)
          .containerBackground(.fill.tertiary, for: .widget)
      } else {
        LifeBatteryWidgetEntryView(entry: entry)
          .padding()
          .background()
      }
    }
    .configurationDisplayName(String(localized: "widget.displayName"))
    .description(String(localized: "widget.description"))
    .supportedFamilies([.systemSmall])
  }
}

#Preview(as: .systemSmall) {
  LifeBatteryWidget()
} timeline: {
  SimpleEntry(date: .now, percentage: 100)
  SimpleEntry(date: .now, percentage: 65)
  SimpleEntry(date: .now, percentage: 35)
  SimpleEntry(date: .now, percentage: 10)
  SimpleEntry(date: .now, percentage: 0)
}

import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:home_widget/home_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_battery/firebase_options.dart';
import 'package:life_battery/src/app.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set App Group ID for iOS widget data sharing
  await HomeWidget.setAppGroupId('group.com.rururu.lifebt');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const isAnalyticsDebug = bool.fromEnvironment('ANALYTICS_DEBUG');
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(
    !kDebugMode || isAnalyticsDebug,
  );

  // Send Flutter framework errors to Firebase Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Send asynchronous errors to Firebase Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    unawaited(
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
    );
    return true;
  };

  // Purchases are sold on the App Store only. The public SDK key is passed
  // with --dart-define so that no key lives in the repository; without it
  // the store is reported as unavailable.
  const revenueCatApiKey = String.fromEnvironment('REVENUECAT_IOS_API_KEY');
  if (defaultTargetPlatform == TargetPlatform.iOS &&
      revenueCatApiKey.isNotEmpty) {
    if (kDebugMode) {
      await Purchases.setLogLevel(LogLevel.debug);
    }
    await Purchases.configure(PurchasesConfiguration(revenueCatApiKey));
  }

  tz.initializeTimeZones();
  final currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone.identifier));

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

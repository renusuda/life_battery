import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:home_widget/home_widget.dart';
import 'package:life_battery/firebase_options.dart';
import 'package:life_battery/src/app.dart';
import 'package:life_battery/src/features/lifespan/data/local_notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set App Group ID for iOS widget data sharing
  await HomeWidget.setAppGroupId('group.com.rururu.lifebt');

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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

  tz.initializeTimeZones();
  final currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone.identifier));

  await LocalNotificationService.initialize();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

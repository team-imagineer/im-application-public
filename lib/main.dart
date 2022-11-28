import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flarelane_flutter/flarelane_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:im_application/presentation/init/init_screen.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:provider/provider.dart';

import 'di/provider_setup.dart';
import 'firebase_options.dart';
import 'ui/manager/theme_manager.dart';

Mixpanel? mixpanel;
FirebaseAnalytics? analytics;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  if (kDebugMode) {
    await _init();
  } else {
    runZonedGuarded<Future<void>>(
      () async {
        await _init(onLoad: () async {
          FlareLane.shared.initialize("****");

          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
          FlutterError.onError =
              FirebaseCrashlytics.instance.recordFlutterFatalError;
          analytics = FirebaseAnalytics.instance;

          _initMixpanel();
        });
      },
      (error, stack) => FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        fatal: true,
      ),
    );
  }
}

Future<void> _init({Function()? onLoad}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  KakaoSdk.init(nativeAppKey: '****');

  await onLoad?.call();

  runApp(
    MultiProvider(
      providers: await getProviders(),
      child: const MyApp(),
    ),
  );
}

Future<void> _initMixpanel() async {
  mixpanel = await Mixpanel.init("****",
      optOutTrackingDefault: false);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko')],
      locale: const Locale('ko'),
      theme: ThemeManager.getLightThemeData(),
      themeMode: ThemeMode.light,
      home: const InitScreen(),
      navigatorKey: navigatorKey,
    );
  }
}

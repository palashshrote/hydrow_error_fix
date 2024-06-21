import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'dart:async';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/*
import 'flutter_flow/flutter_flow_theme.dart';
import 'dart:math';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'flutter_flow/nav/nav.dart';
import 'package:workmanager/workmanager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
*/
void main() async {
  //This function (main) initializes flutter, Firebase integration, global state management, and error reporting in your Flutter application.
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  final appState =
      FFAppState(); // Initialize FFAppState for global state management

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     FlutterLocalNotificationsPlugin flip = FlutterLocalNotificationsPlugin();

//     // Android notification settings
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     // iOS notification settings
//     var iOSPlatformChannelSpecifics = DarwinNotificationDetails();

//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );

//     // Fetch data from Thingspeak
//     final response = await http.get(Uri.parse(
//         'https://api.thingspeak.com/channels/2086669/feeds.json?api_key=F0QFTNP2WB3II639&results=2'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final feeds = data['feeds'];
//       if (feeds.isNotEmpty) {
//         final value = feeds[0]['field6'];
//         await flip.show(
//           0,
//           'Field 6 Value',
//           'The value of field 6 is $value',
//           platformChannelSpecifics,
//           payload: 'Default_Sound',
//         );
//       }
//     }

//     return Future.value(true);
//   });
// }

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<HydrowFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);

    userStream = hydrowFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 3),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    // _timer.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hydrow',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

// Basic Checks
// 1. Edit Profile > Phone Number > Try to insert letters and click save changes (error message should be displayed)
// 2. Starr > Settings > Select Edit for any tank > Try to insert special characters in Name field and click save changes (error message should be displayed)
// 3. Starr > Settings > Select Edit for any tank > Try to insert number having more than 8 digits and click save changes (error message should be displayed in all fields)
// 4. Pravah > Settings > Select Edit for any meter > Try to insert special characters in Name field and click save changes (error message should be displayed)
// 5. Starr > Add Device > Scan QR-1 (error message should be displayed and should not be redirected to next page)
// 6. Starr > Add Device > Click cancel (error message should be displayed and should not be redirected to next page)
// 7. Starr > Add Device > Scan QR-3 (error message should be displayed and should not be redirected to next page)
// 8. Starr > Add Device > Scan QR-2 (should be redirected to next page) > select tank type > check all fields similar to test 2,3
// 9. Pravah > Add Device > Scan QR-1 (error message should be displayed and should not be redirected to next page)
// 10. Pravah > Add Device > Click cancel (error message should be displayed and should not be redirected to next page)
// 11. Pravah > Add Device > Scan QR-2 (error message should be displayed and should not be redirected to next page)
// 12. Pravah > Add Device > Scan QR-3 (should be redirected to next page) > select tank type > check all fields similar to test 4

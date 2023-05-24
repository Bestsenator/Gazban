import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gazban/Screens/Profile_Page/info_user.dart';
import 'package:provider/provider.dart';
import 'Screens/Home_Pages/add_notification.dart';
import 'Screens/Home_Pages/add_person.dart';
import 'Screens/Navigation/navigation.dart';
import 'Screens/Pup_Pages/notification.dart';
import 'Screens/Side_Pages/splash.dart';
import 'Screens/Home_Pages/home2.dart';
import 'Screens/Login_Pages/login.dart';
import 'Theme/theme_provider.dart';

// main app :
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyMaterialApp(),
    ),
  );
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          builder: EasyLoading.init(),
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('fa', 'IR'),
          ],
          locale: const Locale('fa', 'IR'),
          initialRoute: "/navigation",
          routes: {
            "/splash": (context) => const SplashScreen(),
            "/login": (context) => const LoginScreen(),
            "/home": (context) => const HomeScreen(),
            "/navigation": (context) => const Navigation(),
            "/infoUser": (context) => const InfoUserScreen(),
            "/notification": (context) => const NotificationScreen(),
            "/add_notification": (context) => const AddNotificationScreen(),
            "/add_person": (context) => const AddPersonScreen(),
            "/add_location": (context) => const AddPersonScreen(),

          },
        );
      },
    );
  }
}

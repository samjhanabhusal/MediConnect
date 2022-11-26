import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:luveen/common/widgets/bottom_bar.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/features/admin/screens/admin_screen.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/auth/services/auth_service.dart';
import 'package:luveen/providers/user_provider.dart';
import 'package:luveen/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_28c1ab91505943c8a6fb0b9507168c44",
        enabledDebugging: true,
        builder: (context, navKey) {
          return MaterialApp(
            navigatorKey: navKey,
            localizationsDelegates: const [KhaltiLocalizations.delegate],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            debugShowCheckedModeBanner: false,
            title: 'Luveen',
            theme: ThemeData(
              scaffoldBackgroundColor: GlobalVariables.backgroundColor,
              colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor,
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              useMaterial3: true, // can remove this line
            ),
            onGenerateRoute: (settings) => generateRoute(settings),
            home: SplashScreen(
                seconds: 2,
                navigateAfterSeconds:
                    Provider.of<UserProvider>(context).user.token.isNotEmpty
                        ? Provider.of<UserProvider>(context).user.type == 'user'
                            ? const BottomBar()
                            : const AdminScreen()
                        : const AuthScreen(),
                image: new Image.asset('assets/images/SplashScreenLogo.png'),
                photoSize: 150.0,
                backgroundColor: Colors.white,
                styleTextUnderTheLoader: new TextStyle(),
                loaderColor: Colors.green),
          );
        });
  }
}

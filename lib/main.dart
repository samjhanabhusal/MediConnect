// // import 'dart:html';

// import 'package:provider/provider.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:luveen/Services/chatStateServices.dart';
// import 'package:luveen/chat/Screens/HomeScreen.dart';
// import 'package:luveen/chat/Screens/Chatlist.dart';
// import 'package:luveen/common/widgets/bottom_bar.dart';
// import 'package:luveen/constants/global_variables.dart';
// import 'package:luveen/features/admin/screens/admin_screen.dart';
// import 'package:luveen/features/auth/screens/auth_screen.dart';
// import 'package:luveen/features/auth/services/auth_service.dart';
// import 'package:luveen/providers/user_provider.dart';
// import 'package:luveen/router.dart';
// import 'package:flutter/material.dart';
// // import 'package:luveen/store/reducer.dart';
// import 'package:redux_thunk/redux_thunk.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'package:redux/redux.dart';

// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(
//       create: (context) => UserProvider(),
//     ),
//   ], child: const MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final AuthService authService = AuthService();
//   // final ChatStateServices chatStateServices = ChatStateServices();
//   // final store = new Store(
//   //   reducers,
//   //   initialState: ChatState(
//   //     errMsg: "",
//   //     allUsers: [],
//   //     isAuthenticated: false,
//   //     activeUser: "",
//   //     activeRoom: "",
//   //     messages: [],
//   //     logLoading: null,
//   //     regLoading: null,
//   //   ),
//   //   middleware: [thunkMiddleware],
//   // );

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   authService.getUserData(context);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return KhaltiScope(
//         publicKey: "test_public_key_28c1ab91505943c8a6fb0b9507168c44",
//         enabledDebugging: true,
//         builder: (context, navKey) {
//           return MaterialApp(
//             navigatorKey: navKey,
//             localizationsDelegates: const [KhaltiLocalizations.delegate],
//             supportedLocales: const [
//               Locale('en', 'US'),
//               Locale('ne', 'NP'),
//             ],
//             debugShowCheckedModeBanner: false,
//             title: 'Luveen',
//             theme: ThemeData(
//               scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//               colorScheme: const ColorScheme.light(
//                 primary: GlobalVariables.secondaryColor,
//               ),
//               appBarTheme: const AppBarTheme(
//                 elevation: 0,
//                 iconTheme: IconThemeData(
//                   color: Colors.black,
//                 ),
//               ),
//               useMaterial3: true, // can remove this line
//             ),
//             onGenerateRoute: (settings) => generateRoute(settings),
// //             home: SplashScreen(
// //   seconds: 2,
// //   navigateAfterSeconds: Consumer<AuthProvider>(
// //     builder: (_, authProvider, __) {
// //       if (authProvider.isLoggedIn) {
// //         switch (authProvider.userType) {
// //           case 'user':
// //             return BottomBar();
// //           case 'doctor':
// //           case 'hospital':
// //           case 'admin':
// //             return AdminScreen();
// //           default:
// //             return AuthScreen();
// //         }
// //       } else {
// //         return AuthScreen();
// //       }
// //     },
// //   ),
// //   image: new Image.asset('assets/images/SplashScreenLogo.png'),
// //   photoSize: 150.0,
// //   backgroundColor: Colors.white,
// //   styleTextUnderTheLoader: new TextStyle(),
// //   loaderColor: Colors.green
// // ),









// home: SplashScreen(
//   seconds: 2,
// //  navigateAfterSeconds: () => getNextScreen(context),
//   // final user = context.watch<UserProvider>().user;

// // navigateAfterSeconds: Provider.of<UserProvider>(context).user.token.isNotEmpty
// //                         ? Provider.of<UserProvider>(context).user.role == 'user'
// //                             ? const BottomBar()
// //                             : const AdminScreen()
// //                         : const AuthScreen(),
// navigateAfterSeconds: Provider.of<UserProvider>(context).user.token.isNotEmpty
//                         ? Provider.of<UserProvider>(context).user.role == 'user'
//                             ? const BottomBar()
//                             : const AdminScreen()
//                         : const AuthScreen(),
// // ),


//                 image: new Image.asset('assets/images/SplashScreenLogo.png'),
//                 photoSize: 150.0,
//                 backgroundColor: Colors.white,
//                 styleTextUnderTheLoader: new TextStyle(),
//                 loaderColor: Colors.green),
//             // home: LoginScreen(),
//             // home: Homescreen(chatmodels: chatmodels, sourchat: sourchat),
//           );
//         });
//   }
  
  
//   Widget getNextScreen(BuildContext context) {
//   final user = context.watch<UserProvider>().user;
//   if (user.token.isNotEmpty) {
//     switch (user.role) {
//       case 'user':
//         return const BottomBar();
//       case 'doctor': return const AdminScreen();
//       case 'hospital': return const AdminScreen();
//       case 'admin':
//         return const AdminScreen();
//       default:
//         return const AuthScreen();
//     }
//   } else {
//     return const AuthScreen();
//   }
// }
// }
















import 'features/doctor/Screens/screens.dart';

import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:luveen/common/widgets/bottom_bar.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/features/admin/screens/admin_screen.dart';
import 'package:luveen/features/auth/screens/auth_screen.dart';
import 'package:luveen/features/auth/services/auth_service.dart';
import 'package:luveen/features/doctor/Screens/screens.dart';
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
            home: MySplashScreen(),
    );
  }
    );
}
}

class MySplashScreen extends StatelessWidget {
  Widget _getNavigateAfterSeconds(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final token = userProvider.user.token;
    final role = userProvider.user.role;
    
    if (token.isNotEmpty) {
      switch (role) { 
        case 'user':
          return BottomBar();
        case 'doctor':
          return DoctorScreen();
        case 'hospital':
             return AdminScreen();
        case 'admin':
          return AdminScreen();
      }
    }
    
    return AuthScreen();
  }
  
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: _getNavigateAfterSeconds(context),
      image: new Image.asset('assets/images/SplashScreenLogo.png'),
      photoSize: 150.0,
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      loaderColor: Colors.green,
    );
  }
}

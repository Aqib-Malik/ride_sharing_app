
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_app/views/home_screens/pages/start.dart';
import 'package:ride_share_app/views/splash_screen.dart';


void main () {
  runApp(const GetMaterialApp(
    home: 
    StartPage(),
    // Splashscreen(),
    debugShowCheckedModeBanner: false,
  ));
}
















// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ride_share_app/transition_route%20_observer.dart';
// import 'package:ride_share_app/views/dashboard.dart/dash_board_screen.dart';

// import 'views/auth_scree.dart/auth_screen.dart';

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(
//       systemNavigationBarColor:
//           SystemUiOverlayStyle.dark.systemNavigationBarColor,
//     ),
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Demo',
//       theme: ThemeData(
//         textSelectionTheme:
//             const TextSelectionThemeData(cursorColor: Colors.orange),
//         // fontFamily: 'SourceSansPro',
//         textTheme: TextTheme(
//           displaySmall: const TextStyle(
//             fontFamily: 'OpenSans',
//             fontSize: 45.0,
//             // fontWeight: FontWeight.w400,
//             color: Colors.orange,
//           ),
//           labelLarge: const TextStyle(
//             // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
//             fontFamily: 'OpenSans',
//           ),
//           bodySmall: TextStyle(
//             fontFamily: 'NotoSans',
//             fontSize: 12.0,
//             fontWeight: FontWeight.normal,
//             color: Colors.deepPurple[300],
//           ),
//           displayLarge: const TextStyle(fontFamily: 'Quicksand'),
//           displayMedium: const TextStyle(fontFamily: 'Quicksand'),
//           headlineMedium: const TextStyle(fontFamily: 'Quicksand'),
//           headlineSmall: const TextStyle(fontFamily: 'NotoSans'),
//           titleLarge: const TextStyle(fontFamily: 'NotoSans'),
//           titleMedium: const TextStyle(fontFamily: 'NotoSans'),
//           bodyLarge: const TextStyle(fontFamily: 'NotoSans'),
//           bodyMedium: const TextStyle(fontFamily: 'NotoSans'),
//           titleSmall: const TextStyle(fontFamily: 'NotoSans'),
//           labelSmall: const TextStyle(fontFamily: 'NotoSans'),
//         ),
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
//             .copyWith(secondary: Colors.orange),
//       ),
//       navigatorObservers: [TransitionRouteObserver()],
//       initialRoute: LoginScreen.routeName,
//       routes: {
//         LoginScreen.routeName: (context) => const LoginScreen(),
//         DashboardScreen.routeName: (context) => const DashboardScreen(),
//       },
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_firebase/register/Register.dart';
import 'package:task_firebase/provider/theme_provider.dart';
import 'package:task_firebase/remote/firebase/firebase_options.dart';

import 'style/theme.dart';
 import 'home/home_screen.dart';
import 'login/login.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (context) => themeProvider()..init(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    themeProvider provider=Provider.of<themeProvider>(context);
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lighttheme ,
     darkTheme: AppTheme.Darktheme,
     // darkTheme: AppTheme.darktheme,

       themeMode: provider.theme,


      routes: {

        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
      },
      initialRoute:  LoginScreen.routeName,

    );
  }
}


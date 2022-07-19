import 'package:flutter/material.dart';
import 'package:project_sredatochennost/pages/hello_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_sredatochennost/pages/registration/confirm_email.dart';
import 'package:project_sredatochennost/pages/registration/registration_page.dart';
import 'package:project_sredatochennost/pages/main_page.dart';
import 'package:project_sredatochennost/pages/loadings/splash_page.dart';

Future < void > main ( ) async {

  WidgetsFlutterBinding.ensureInitialized ( );

  await Supabase.initialize (

    url: 'https://wcborwripbdormtkgfzu.supabase.co',

    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndjYm9yd3JpcGJkb3JtdGtnZnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTc0NjM3MDAsImV4cCI6MTk3MzAzOTcwMH0.tmdD4tDq3Z-NyXZujZ1fJHx05xCcI36qLpwbV_S6ZfI',

    authCallbackUrlHostname: 'login-callback',

  );

  runApp (

      const MyApp ( ),

  );

}


final darkNotifier = ValueNotifier < bool > ( false );

class MyApp extends StatelessWidget {

  const MyApp ( { Key? key } ) : super ( key: key );

  @override
  Widget build ( BuildContext context ) {

    return ValueListenableBuilder < bool > (

        valueListenable: darkNotifier,

        builder: ( BuildContext context, bool isDark, Widget? child ) {

          return MaterialApp (

            title: 'Flutter Demo',

            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

            theme: ThemeData (

              colorScheme: const ColorScheme.light ( ).copyWith ( primary: Colors.green ),

            ),

            darkTheme: ThemeData (

              colorScheme: const ColorScheme.dark ( ),

            ),

            debugShowCheckedModeBanner: false,

            initialRoute: '/',

            routes: < String, WidgetBuilder > {

              '/': ( _ ) => const SplashPage ( ),

              '/hello': ( _ ) => const HelloPage ( ),

              '/confirmEmail': ( _ ) => const ConfirmEmailPage ( ),

              '/registration': ( _ ) => const RegistrationPage ( ),

              '/main': ( _ ) => const MainPage ( ),

            },

          );

        });

  }

}








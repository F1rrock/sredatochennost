import 'package:flutter/material.dart';
import 'package:project_sredatochennost/main.dart';
import 'package:project_sredatochennost/utils/constants.dart';

class MainPage extends StatefulWidget {

  const MainPage ( { Key? key } ) : super( key: key );

  @override
  State < MainPage > createState ( ) => _MainPageState ( );

}

class _MainPageState extends State < MainPage > {

  bool isDark = darkNotifier.value;

  @override
  Widget build ( BuildContext context ) {

    return SafeArea ( child: Scaffold (

      appBar: AppBar (

        centerTitle: true,

        title: Row (

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: < Widget > [

            IconButton (

              icon: const Icon ( Icons.menu ),

              onPressed: ( ) {

              },

            ),

            const Text ( 'main page' ),

            Row (

              children: < Widget > [

                IconButton (

                  onPressed: ( ) async {

                    setState ( ( ) {

                      isDark = ! isDark;

                    } );

                    darkNotifier.value = isDark;

                  },

                  tooltip: 'здесь можно сменить цветовую тему',

                  //icon: isDark ? Icon(Icons.nights_stay_sharp) : Icon(Icons.wb_sunny_outlined),

                  icon: Icon ( isDark ? Icons.nights_stay_sharp : Icons.wb_sunny_outlined ),

                ),

                IconButton (

                  icon: const Icon ( Icons.account_circle ),

                  onPressed: ( ) {

                    supabase.auth.signOut();

                    Navigator.of ( context )
                        .pushNamedAndRemoveUntil( '/', ( route ) => false );

                  },

                  tooltip: 'войти в свой аккаунт',

                ),

              ],

            )

          ],

        ),

      ),

      body: Container ( ),

    ), );

  }

}
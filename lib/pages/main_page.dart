import 'package:flutter/material.dart';
import 'package:project_sredatochennost/modules/txt_reader.dart';
import 'package:project_sredatochennost/main.dart';

class MainPage extends StatefulWidget {

  const MainPage ( { Key? key } ) : super ( key: key );

  @override
  State < MainPage > createState ( ) => _MainPageState ( );

}

class _MainPageState extends State < MainPage > {

  final TxtReader reader = TxtReader ( );

  static const Padding padding = Padding (

    padding: EdgeInsets.only ( top: 30 ),

  );

  @override
  void dispose() {

    // TODO: implement dispose

    darkNotifier.dispose();

    super.dispose();

  }

  @override
  Widget build ( BuildContext context ) {

    bool isDark = darkNotifier.value;

    return SafeArea ( child: Scaffold (

      appBar: AppBar (

        backgroundColor: isDark ? Colors.blueAccent : Colors.green,

        title: Row (

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: < Widget > [

            IconButton (

              icon: const Icon ( Icons.menu ),

              onPressed: ( ) {

                print ( 'menu' );

              },

            ),

            const Text ( "СРЕДАточенность" ),

            Row (

              children: < Widget > [

                IconButton (

                  onPressed: ( ) async {

                    isDark = ! isDark;

                    darkNotifier.value = isDark;

                  },

                  icon: const Icon (

                    Icons.wb_sunny_outlined,

                  ),

                  tooltip: 'здесь можно сменить цветовую тему',

                ),

                IconButton (

                  icon: const Icon ( Icons.account_circle ),

                  onPressed: ( ) {

                    print ( 'account' );

                  },

                  tooltip: 'войти в свой аккаунт',

                ),

              ],

            )

          ],

        ),

        centerTitle: true,

      ),

      body: SingleChildScrollView (

          child: Row (

            mainAxisAlignment: MainAxisAlignment.center,

            children: < Widget > [

              Column (

                mainAxisAlignment: MainAxisAlignment.center,

                children: < Widget > [

                  padding,

                  reader.read (

                    'lib/assets/about_us.txt',

                    context,

                  ),

                  padding,

                  ElevatedButton (

                    onPressed: ( ) {



                    },

                    style: ElevatedButton.styleFrom(

                      primary: Colors.green,

                      onPrimary: Colors.white,

                    ),

                    child: const Tooltip (

                      message: 'присоединяйтесь к семье средаточенность прямо сейчас',

                      child: Text ( 'зарегистрироваться сейчас' ),

                    ),

                  ),

                  padding,

                ],

              ),

            ],

        ),

      ),

    ), );

  }

}

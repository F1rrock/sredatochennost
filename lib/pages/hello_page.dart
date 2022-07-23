import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_sredatochennost/modules/txt_reader.dart';
import 'package:project_sredatochennost/main.dart';

class HelloPage extends StatefulWidget {

  const HelloPage ( { Key? key } ) : super ( key: key );

  @override
  State < HelloPage > createState ( ) => _HelloPageState ( );

}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  final TxtReader reader = TxtReader ( );

  static const Padding padding = Padding (

    padding: EdgeInsets.only ( top: 30 ),

  );

  @override
  Widget build(BuildContext context) {
    return Scrollbar(

        child: SingleChildScrollView (

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

                      if ( Platform.isAndroid || Platform.isIOS ) {

                        Navigator.of ( context ).pushNamed( '/confirmEmail' );

                      } else {



                      }

                    },

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

      );

    }

}


class _HelloPageState extends State < HelloPage > {

  @override
  void dispose() {

    // TODO: implement dispose

    darkNotifier.dispose();

    super.dispose();

  }

  @override
  Widget build ( BuildContext context ) {

    bool isDark = darkNotifier.value;

    return Container( color: Colors.greenAccent, child: SafeArea ( child: Scaffold (

      appBar: AppBar (

        title: Row (

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: < Widget > [

            IconButton (

              icon: const Icon ( Icons.menu ),

              onPressed: ( ) {

              },

            ),

            const Text ( "СРЕДАточенность" ),

            Row (

              children: < Widget > [

                IconButton (

                  onPressed: ( ) async {

                    setState ( ( ) {

                      isDark = !isDark;

                    } );

                    darkNotifier.value = isDark;

                  },

                  tooltip: 'здесь можно сменить цветовую тему',

                  icon: Icon ( isDark ? Icons.nights_stay_sharp : Icons.wb_sunny_outlined ),

                ),

                IconButton (

                  icon: const Icon ( Icons.account_circle ),

                  onPressed: ( ) {



                  },

                  tooltip: 'войти в свой аккаунт',

                ),

              ],

            )

          ],

        ),

        centerTitle: true,

      ),

      body: const HomeBody ( ),

    ), ), );

  }

}

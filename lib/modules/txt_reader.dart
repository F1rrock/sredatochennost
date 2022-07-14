import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:auto_size_text/auto_size_text.dart';


class TxtReader {

  Future < String > readForFuture ( String filePath ) async {

    return await rootBundle.loadString ( filePath );

  }

  Widget read ( String filePath, BuildContext context ) => FutureBuilder < String > (

      future: readForFuture ( filePath ),

      builder: ( context, snapshot ) {

        if ( snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done ) {

          return Container (

            constraints: BoxConstraints (

              maxWidth: MediaQuery.of ( context ).size.width / 6 * 5,

            ),

            child: AutoSizeText (

              snapshot.data!,

              textAlign: TextAlign.justify,

              style: TextStyle ( fontSize: MediaQuery.of ( context ).size.width / 28 ),

              maxFontSize: 30,

            ),

          );

        }

        return const CircularProgressIndicator ( );

      },

    );



}
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_sredatochennost/utils/constants.dart';

class AuthState < T extends StatefulWidget > extends SupabaseAuthState < T > {

  @override
  void onUnauthenticated ( ) {

    if ( mounted ) {

      print('kek3');

      Navigator.of ( context ).pushNamedAndRemoveUntil( '/hello', ( route ) => false );

    }else{
      print('kek4');
    }

  }

  @override
  void onAuthenticated ( Session session ) {

    if ( mounted ) {

      Navigator.of ( context )
          .pushNamedAndRemoveUntil( '/main', ( route ) => false );

    }

  }

  @override
  void onPasswordRecovery ( Session session ) { }

  @override
  void onErrorAuthenticating ( String message ) {

    context.showErrorSnackBar(message: message);

  }

}
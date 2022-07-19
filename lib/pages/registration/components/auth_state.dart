import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project_sredatochennost/utils/constants.dart';

class AuthState < T extends StatefulWidget > extends SupabaseAuthState < T > {

  @override
  void onUnauthenticated ( ) {

    if ( mounted ) {

      Navigator.of ( context ).pushNamedAndRemoveUntil( '/hello', ( route ) => false );

    }

  }

  @override
  void onAuthenticated ( Session session ) {

    if ( mounted ) {

      print(session);

      Navigator.of ( context )
          .pushNamedAndRemoveUntil( '/registration', ( route ) => false );

    }

  }

  @override
  void onPasswordRecovery ( Session session ) { }

  @override
  void onErrorAuthenticating ( String message ) {

    context.showErrorSnackBar(message: message);

  }

}
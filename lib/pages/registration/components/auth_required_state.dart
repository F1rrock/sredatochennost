import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRequiredState < T extends StatefulWidget >
    extends SupabaseAuthRequiredState < T > {

  /*@override
  void onAuthenticated ( ) {

    /// Users will be sent back to the LoginPage if they sign out.
    if ( mounted ) {

      print('unauth required mount');

      /// Users will be sent back to the LoginPage if they sign out.
      Navigator.of ( context ).pushNamedAndRemoveUntil ( '/hello', ( route ) => false );

    } else {

      print('unauth required not mount');

    }

  }*/

  @override
  void onUnauthenticated ( ) {

    /// Users will be sent back to the LoginPage if they sign out.
    if ( mounted ) {

      print('unauth required mount');

      /// Users will be sent back to the LoginPage if they sign out.
      Navigator.of ( context ).pushNamedAndRemoveUntil ( '/confirmEmail', ( route ) => false );

    } else {

      print('unauth required not mount');

    }

  }

}
import 'package:flutter/material.dart';
import 'package:project_sredatochennost/pages/registration/components/auth_state.dart';

class SplashPage extends StatefulWidget {

  const SplashPage ( { Key? key } ) : super ( key: key );

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState ( ) => _SplashPageState ( );
}

class _SplashPageState extends AuthState < SplashPage > {

  @override
  void initState ( ) {

    recoverSupabaseSession ( );

    super.initState ( );

  }

  @override
  Widget build ( BuildContext context ) {

    return const Scaffold (

      //body: Center ( child: CircularProgressIndicator ( ) ),

      body: Center ( child: Text ( 'kek' ) ),

    );

  }

}

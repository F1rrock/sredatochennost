import 'dart:io';
import 'package:flutter/cupertino.dart';
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

    return Scaffold (

      backgroundColor: Colors.white,

      body: Center (

        child: Platform.isAndroid
            ? const CircularProgressIndicator ( color: Colors.black, )
            : const CupertinoActivityIndicator ( color: Colors.black, ),

      ),

    );

  }

}

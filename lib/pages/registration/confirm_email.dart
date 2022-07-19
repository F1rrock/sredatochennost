// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, use_build_context_synchronously
// flutter run -d web-server --web-hostname localhost --web-port 3000

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:project_sredatochennost/pages/registration/components/auth_state.dart';
import 'package:project_sredatochennost/utils/constants.dart';

class ConfirmEmailPage extends StatefulWidget {

  const ConfirmEmailPage ( { Key? key } ) : super ( key: key );

  @override
  _ConfirmEmailPage createState ( ) => _ConfirmEmailPage ( );

}

class _ConfirmEmailPage extends AuthState < ConfirmEmailPage > {

  bool _isLoading = false;

  late final TextEditingController _emailController;


  Future < void > _signIn ( ) async {

    setState( ( ) {

      _isLoading = true;

    });

    final response = await supabase.auth.signIn (

        email: _emailController.text,

        options: AuthOptions (

            redirectTo: kIsWeb

                ? null

                : 'io.supabase.flutterquickstart://login-callback/'

        ),

    );

    final error = response.error;

    if ( error != null ) {

      context.showErrorSnackBar ( message: error.message );

    } else {

      context.showSnackBar ( message: 'проверьте почту на наличие ссылок для дальнейшей регистрации!' );

      _emailController.clear ( );

    }

    setState ( ( ) {

      _isLoading = false;

    } );

  }

  @override
  void initState ( ) {

    super.initState ( );

    _emailController = TextEditingController ( );

  }

  @override
  void dispose ( ) {

    _emailController.dispose ( );

    super.dispose ( );

  }

  @override
  Widget build ( BuildContext context ) {

    return Scaffold (

      appBar: AppBar ( title: const Text ( 'Вход' ) ),

      body: ListView (

        padding: const EdgeInsets.symmetric ( vertical: 18, horizontal: 12 ),

        children: < Widget > [

          const Text ( 'Для начала подтвердите свою почту' ),

          const SizedBox ( height: 18 ),

          TextFormField (

            controller: _emailController,

            keyboardType: TextInputType.emailAddress,

            decoration: const InputDecoration ( labelText: 'Ваша почта' ),

          ),

          const SizedBox ( height: 18 ),

          ElevatedButton (

            onPressed: _isLoading ? null : _signIn,

            child: Text( _isLoading ? 'Немного ожидания' : 'Подтвердить почту' ),

          ),

        ],

      ),

    );

  }

}
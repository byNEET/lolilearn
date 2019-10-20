import 'package:adminkursus/src/provider/userrepository.dart';
import 'package:adminkursus/src/ui/homsekrin.dart';
import 'package:adminkursus/src/ui/login/login.dart';
import 'package:adminkursus/src/ui/login/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
      builder: (context, UserRepository user, _) {
        switch (user.status) {
          case Status.Uninitialized:
            return Splash();
          case Status.Unauthenticated:
          case Status.Authenticating:
            return LoginPage();
          case Status.Authenticated:
            return HomSekrin();
          default:
          return Container();
        }
        
      },
    );
  }
}
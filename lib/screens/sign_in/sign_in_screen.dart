/*import 'package:shop_app/screens/home/home_screen.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';
import 'package:shop_app/global_cass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  _SingnInScreen createState() => _SingnInScreen();
}

class _SingnInScreen extends State<SignInScreen> {
  var email;
  GlobalState globalState = GlobalState.instance;
  bool isLog = false;
  FlutterAppAuth appauth = FlutterAppAuth();
  AuthorizationTokenResponse result;
  var logger = Logger();
  Future FlutterAppAutha() async {
    try {
      result = await appauth.authorizeAndExchangeCode(
        AuthorizationTokenRequest('8feeb625-6f5e-4c97-acae-cfc84f0f3001',
            'com.onmicrosoft.contosob2c.exampleapp://oauth/redirect',
            discoveryUrl:
                'https://doxcpranikal.b2clogin.com/doxcpranikal.onmicrosoft.com/v2.0/.well-known/openid-configuration?p=B2C_1_signupsigin1',
            //promptValues: [
            //'login'
            //],
            scopes: [
              'openid',
              'profile',
              'email',
              'offline_access',
              'https://doxcpranikal.onmicrosoft.com/local-webapi/local.read'
            ]),
      );

      print(result.idToken);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(result.idToken);
      List<dynamic> emails = decodedToken["emails"];
      globalState.email = emails[0];

      await Navigator.pushNamed(context, HomeScreen.routeName);
      // }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: new Text('$FlutterAppAutha()'),
        ),
      );
    }
  }
}
*/

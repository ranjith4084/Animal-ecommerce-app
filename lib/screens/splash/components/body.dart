/*import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';
import 'package:logger/logger.dart';
import 'package:shop_app/global_cass.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Pranikal, Let’s shop!",
      "image": "assets/images/pranikal_logo.png"
    },
    {
      "text": "We help people to make \ncomfort  your pets",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Sign In",
                      press: () {
                        FlutterAppAutha();
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';
import 'package:logger/logger.dart';
import 'package:shop_app/global_cass.dart';

Map<String, dynamic> decodedToken;
bool isLog = false;
FlutterAppAuth appauth = FlutterAppAuth();
AuthorizationTokenResponse result;
String _idToken;

String _refreshToken;
String _accessToken;

Map<String, dynamic> _jwt;
List<String> _scopes = ['openid'];

//var logger = Logger();
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email;
  GlobalState globalState = GlobalState.instance;

  Future FlutterAppAutha() async {
    try {
      result = await appauth.authorizeAndExchangeCode(
        AuthorizationTokenRequest('8feeb625-6f5e-4c97-acae-cfc84f0f3001',
            'com.onmicrosoft.contosob2c.exampleapp://oauth/redirect',
            discoveryUrl:
                'https://doxcpranikal.b2clogin.com/doxcpranikal.onmicrosoft.com/v2.0/.well-known/openid-configuration?p=B2C_1_signupsigin1',
            scopes: [
              'openid',
              'profile',
              'email',
              'offline_access',
              'https://doxcpranikal.onmicrosoft.com/local-webapi/local.read'
            ]),
      );
      if (result != null) {
        _processAuthTokenResponse(result);
      }
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

  void _processAuthTokenResponse(AuthorizationTokenResponse response) {
    setState(() {
      _accessToken = response.accessToken;
      _refreshToken = response.refreshToken;
      _idToken = response.idToken;
      //get individual claims from jwt token
      _jwt = parseJwt(response.idToken);
    });
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }
  }

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Pranikal, Let’s shop!",
      "image": "assets/images/pranikal_logo.png"
    },
    {
      "text": "We help people to make \ncomfort  your pets",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Sign In",
                      press: () {
                        FlutterAppAutha();
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

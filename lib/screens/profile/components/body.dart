import 'dart:io';
import 'package:shop_app/screens/splash/components/body.dart';
import 'package:shop_app/screens/favourite/favourite_screen.dart';
import 'package:shop_app/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:shop_app/global_cass.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

String _idToken;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalState globalState = GlobalState.instance;
  Future<void> logOut() async {
    try {
      //for some reason the API works differently on iOS and Android
      Map<String, String> additionalParameters;
      if (Platform.isAndroid) {
        //works on Android but is missing p parameter when redirected back to authorize on iOS
        additionalParameters = {
          "id_token_hint": _idToken,
          "post_logout_redirect_uri":
              "com.onmicrosoft.contosob2c.exampleapp://oauth/redirect",
        };
      } else if (Platform.isIOS) {
        //missing p parameter when redirected back to authorize on iOS so the below difference
        additionalParameters = {
          "id_token_hint": _idToken,
          "post_logout_redirect_uri":
              "com.onmicrosoft.contosob2c.exampleapp://oauth/redirect",
          'p': 'B2C_1_susi'
        };
      }
      var result = await appauth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          '8feeb625-6f5e-4c97-acae-cfc84f0f3001',
          'com.onmicrosoft.contosob2c.exampleapp://oauth/redirect',
          //promptValues: ['login'],
          discoveryUrl:
              'https://doxcpranikal.b2clogin.com/doxcpranikal.onmicrosoft.com/v2.0/.well-known/openid-configuration?p=B2C_1_signupsigin1',
          additionalParameters: additionalParameters,
          scopes: [
            'openid',
            'profile',
            'email',
            'offline_access',
            'https://doxcpranikal.onmicrosoft.com/local-webapi/local.read'
          ],
        ),
      );
      print(result);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        Container(child: Text(globalState.email)),
        SizedBox(height: 20),
        ProfileMenu(
          text: "Favourites",
          icon: "assets/icons/Heart Icon.svg",
          press: () {
            Navigator.pushNamed(context, FavouriteScreen.routeName);
          },
        ),
        ProfileMenu(
          text: "Notifications",
          icon: "assets/icons/Bell.svg",
          press: () {
            Navigator.pushNamed(context, NotificationScreen.routeName);
          },
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/Settings.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Help & Support Center",
          icon: "assets/icons/Question mark.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/Log out.svg",
          press: () async {
            await logOut();
            Navigator.pushNamed(context, SplashScreen.routeName);
          },
        ),
      ],
    );
  }
} /*import 'package:shop_app/screens/favourite/favourite_screen.dart';
import 'package:shop_app/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:shop_app/global_cass.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // ignore: non_constant_identifier_names
  Future api() async {
    try {
      String url =
          'https://doxcpranikal.b2clogin.com/doxcpranikal.onmicrosoft.com/b2c_1_signupsigin1/oauth2/v2.0/logout?post_logout_redirect_uri=com.onmicrosoft.contosob2c.exampleapp://oauth/redirect';
      var request = http.get(url);

      print(request);
      return request;
    } catch (e) {
      print(e.toString());
    }
  }

  GlobalState globalState = GlobalState.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        Container(child: Text(globalState.email)),
        SizedBox(height: 20),
        ProfileMenu(
          text: "Favourites",
          icon: "assets/icons/Heart Icon.svg",
          press: () {
            Navigator.pushNamed(context, FavouriteScreen.routeName);
          },
        ),
        ProfileMenu(
          text: "Notifications",
          icon: "assets/icons/Bell.svg",
          press: () {
            Navigator.pushNamed(context, NotificationScreen.routeName);
          },
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/Settings.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Help & Support Center",
          icon: "assets/icons/Question mark.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/Log out.svg",
          press: () async {
            await api();
            Navigator.pushNamed(context, SplashScreen.routeName);
          },
        ),
      ],
    );
  }
}
*/
//*-*--/-/-*/-//-/-/*-/-*/-/-/-/-/-/
/*import 'package:shop_app/screens/favourite/favourite_screen.dart';
import 'package:shop_app/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:shop_app/global_cass.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // ignore: non_constant_identifier_names

  GlobalState globalState = GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        Container(child: Text(globalState.email)),
        SizedBox(height: 20),
        ProfileMenu(
          text: "Favourites",
          icon: "assets/icons/Heart Icon.svg",
          press: () {
            Navigator.pushNamed(context, FavouriteScreen.routeName);
          },
        ),
        ProfileMenu(
          text: "Notifications",
          icon: "assets/icons/Bell.svg",
          press: () {
            Navigator.pushNamed(context, NotificationScreen.routeName);
          },
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/Settings.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Help & Support Center",
          icon: "assets/icons/Question mark.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/Log out.svg",
          press: () {
            Navigator.pushNamed(context, SplashScreen.routeName);
          },
        ),
      ],
    );
  }
}
*/

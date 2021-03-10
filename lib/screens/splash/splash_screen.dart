import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/components/body.dart';
import 'package:shop_app/size_config.dart';

/*Future<bool> _onBackPressed() {
  return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Do you really want to exit the app?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("No"),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              )) ??
      false;
}
*/
class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    //  return WillPopScope(
    //  onWillPop: _onBackPressed,
    // child:
    return Scaffold(
      body: Body(),
      // ),
    );
  }
}

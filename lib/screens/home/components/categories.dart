import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Food"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Supplies"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Toys"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Treats"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
/*import 'package:flutter/material.dart';
//import 'package:shop_app/json/hy.json';
import 'package:http/http.dart' as http;
import 'categorie_auto_genarated_model.dart';

class Categorys extends StatefulWidget {
  @override
  _CategorysState createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  final url = "https://doxcdev.pranikal.com/odata/Category";
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIzNDY3MjA2OC1iOTBhLTRjMzktOGM4Yi01ODMxNTRlZTE4ZGEiLCJFbWFpbCI6ImFkbWluQHlvdXJzdG9yZS5jb20iLCJleHAiOjE2MTUwMjg0NDh9.x6NYxFFCcO6TkR1X5p25UC7u9ygEeaCwq6O0xK9BLgQ";
  Future requestData() async {
    try {
      print('testing');
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("${response.body}");

      Welcome emp = welcomeFromJson(response.body);

      return emp;
    } catch (e) {
      print(e.toString());
    }
  }

  bool isDataLoaded = false;

  Welcome welcome;
  @override
  void initState() {
    StoreApi();
  }

  StoreApi() async {
    welcome = await requestData();
    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isDataLoaded
        ? Container(
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CategoryCard(
                  name: welcome.value[index].name,
                  pictureId: welcome.value[index].pictureId,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: welcome.value.length,
            ))
        : Text("");
  }
}

class CategoryCard extends StatelessWidget {
  String name;
  String pictureId;

  CategoryCard({this.name, this.pictureId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 30,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: Text("ID"), //child: SvgPicture.asset(
                //"assets/icons/FlashIcon.svg",
                //  fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15,
              ),
              Text(name),
            ],
          ),
        ));
  }
}
*/

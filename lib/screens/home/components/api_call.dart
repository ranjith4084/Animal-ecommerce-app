/*import 'package:http/http.dart' as http;
import 'categorie_auto_genarated_model.dart';

var fulldata;

class ApiService {
  final url = "https://doxcdev.pranikal.com/odata/Category";
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIwZjc0ZGY1Yy01YjIxLTRiZTctYTQwNC1hZjljYzY3YWY2M2UiLCJFbWFpbCI6ImFkbWluQHlvdXJzdG9yZS5jb20iLCJleHAiOjE2MTQ5MTczODZ9.JokbcQfWObcxZ4tu-aqx9F-fikwtWW17l_-EGRBcyEo";

  requestData() async {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    //var fulldata = responce.body;
    fulldata = response.body;
    Welcome emp = welcomeFromJson(fulldata);

    return emp;
  }
}

final $apiService = ApiService();
*/

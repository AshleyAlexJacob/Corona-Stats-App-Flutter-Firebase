import 'package:http/http.dart' as http;
import 'dart:convert';

class CoronaStats{
String data;

Future<dynamic>fetchData(String url)async{
  http.Response response = await http.get(url);
  if(response.statusCode==200){
    data=response.body;
    var who=jsonDecode(data);
    return who;
  }
  else{
    return null;
  }
}

}
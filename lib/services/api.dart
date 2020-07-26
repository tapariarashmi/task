import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  String url = 'https://reqres.in/api/users?page=2';
  Future getData()async{
    http.Response response = await http.get(url); 
    if(response.statusCode == 200){
      print('triggered');
      String data = response.body;
      return jsonDecode(data);
      
    }
    else{
      print(response.statusCode);
    }
  }

}
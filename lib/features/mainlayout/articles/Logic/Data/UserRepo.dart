import 'dart:convert';

import 'package:fitness_app/features/mainlayout/articles/Logic/Data/News_Responses.dart';
import 'package:http/http.dart' as http;

class Userrepo {
  Future<NewsResponses?>fetchData()async{
    Uri uri= Uri.parse
      ("https://newsapi.org/v2/top-headlines?country=us&apiKey=b22c7ddc9750423fb10c90125c2cd85d&category=health");
    final responses= await http.get(uri);
    if(responses.statusCode==200){
      final data = jsonDecode(responses.body);
      return NewsResponses.fromJson(data);
    }else {
      throw Exception("Error in fetching Data");
    }
  }
}
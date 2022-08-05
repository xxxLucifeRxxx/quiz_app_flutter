import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/questions.dart';
import '../models/quiz.dart';

const baseUrl = 'https://opentdb.com/api.php';

class MyApi {

  Future<List<Questions>?> getQuestions(int categories, String difficulty) async {
    final response = await http.get(Uri.parse('$baseUrl?&amount=10&category=$categories&difficulty=$difficulty&type=multiple'));
    if(response.statusCode == 200){
      final Quiz quiz;
      final decRes = jsonDecode(response.body);
      quiz = Quiz.fromJson(decRes);
      return quiz.results;
    }
    else{
      return null;
    }
  }
}

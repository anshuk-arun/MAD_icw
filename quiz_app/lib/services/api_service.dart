import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question.dart';

class ApiService {
  // (an unimplemented function)
  // Store the Categories fetched by O(n) API call in Future<List<String>
  // Store the time the api call was done.
  // If the api call was over 24 hours ago, use a new api call. Else, use the stored categories. optional parameter (-f) to force fetch


  static Future<List<Question>> fetchQuestions({int amount = 15, int category = 9, String difficulty = "easy", String type = "multiple"}) async {
    final response = await http.get(
      Uri.parse(
          'https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=$type'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Question> questions = (data['results'] as List)
          .map((questionData) => Question.fromJson(questionData))
          .toList();
      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }
  

  // get Category Names from TDB
  static Future<List<dynamic>> getCategories() async{
    final response = await http.get(
      Uri.parse(
        'https://opentdb.com/api_category.php'),
    );
    
    if (response.statusCode == 200){
      final data = json.decode(response.body);
      List<dynamic> dbCategories = (data['trivia_categories'] as List);//.map((catData) => ApiService.fromJson(catData)).toList();
      return dbCategories;
    } else {
      throw Exception('Failed to get categories');
    }
    
  }

  /*
  // get Category Names from JSON
  static Map<dynamic, dynamic> fromJson(Map<String, dynamic> json) {
  // Decode options by combining incorrect answers with the correct answer and shuffling them.
    List<String> catData = List<String>.from(json['trivia_categories']);
    
    return switch (json['trivia_categories']){
      {
      'id': int catID,
      'name': String catName,
      } =>
        Map(
          id: catID,
          name: catName, 
        ), _=> throw const FormatException('failed to load categories'),
    };
    
  }
  */

}

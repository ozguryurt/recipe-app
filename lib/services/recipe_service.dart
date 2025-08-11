import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe_model.dart';
import '../utils/constants.dart';

class RecipeService {

  // Get recipes from the API
  static Future<List<RecipeModel>> getRecipes() async {
    try {
      final uri = Uri.parse('$baseUrl/recipes');
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> recipesJson = data['recipes'] ?? [];
        
        return recipesJson
            .map((recipeJson) => RecipeModel.fromJson(recipeJson))
            .toList();
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}

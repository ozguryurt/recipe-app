import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipeapp/models/recipes_response.dart';
import '../models/recipe_model.dart';
import '../utils/constants.dart';

class RecipeService {

  // Get recipes from the API
  static Future<RecipesResponse> getRecipes({int page = 1, int limit = 10}) async {
    try {
      final skip = (page - 1) * limit;
      final uri = Uri.parse('$baseUrl/recipes?skip=$skip&limit=$limit');
      final response = await http.get(uri).timeout(const Duration(seconds: 25));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return RecipesResponse.fromJson(data);
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Get recipe by id
  static Future<RecipeModel> getRecipeById(int id) async {
    try {
      final uri = Uri.parse('$baseUrl/recipes/$id');
      final response = await http.get(uri).timeout(const Duration(seconds: 25));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final RecipeModel recipe = RecipeModel.fromJson(data);
        
        return recipe;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}

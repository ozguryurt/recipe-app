import 'package:recipeapp/models/recipe_model.dart';

class RecipesResponse {
  final List<RecipeModel> recipes;
  final int total;

  RecipesResponse({required this.recipes, required this.total});

  factory RecipesResponse.fromJson(Map<String, dynamic> json) {
    return RecipesResponse(
      recipes: (json['recipes'] as List<dynamic>?)
              ?.map((e) => RecipeModel.fromJson(e))
              .toList() ?? [],
      total: json['total'] ?? 0,
    );
  }
}

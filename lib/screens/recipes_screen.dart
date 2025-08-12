import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_model.dart';
import 'package:recipeapp/services/recipe_service.dart';
import 'package:recipeapp/widgets/error_card.dart';
import 'package:recipeapp/widgets/recipe_card.dart';
import 'package:recipeapp/widgets/recipes_refresh_card.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> _loadRecipes() async {
    if (isLoading) return;
    
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final loadedRecipes = await RecipeService.getRecipes();
      if (mounted) {
        setState(() {
          recipes = loadedRecipes;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = e.toString().replaceAll('Exception: ', '');
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (errorMessage != null)
              ErrorCard(errorMessage: errorMessage!, onPressed: _loadRecipes)
            else
              Expanded(
                child: Column(
                  children: [
                    RecipesRefreshCard(recipeCount: recipes.length, isLoading: isLoading, onRefresh: _loadRecipes),
                    const SizedBox(height: 16),
                    Expanded(
                      child: recipes.isEmpty
                          ? const Center(
                              child: Text('No recipes found'),
                            )
                          : ListView.builder(
                              itemCount: recipes.length,
                              itemBuilder: (context, index) {
                                return RecipeCard(recipe: recipes[index]);
                              },
                            ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
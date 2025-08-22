import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipes_response.dart';
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
  RecipesResponse recipesData = RecipesResponse(recipes: [], total: 0);
  final int itemsPerPage = 8;
  int currentPage = 1;
  bool isLoading = false;
  String? errorMessage;

  Future<void> _loadRecipes() async {
    if (isLoading) return;
    
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final loadedRecipesData = await RecipeService.getRecipes(page: currentPage, limit: itemsPerPage);
      if (mounted) {
        setState(() {
          recipesData = loadedRecipesData;
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
                    RecipesRefreshCard(recipeCount: recipesData.total, isLoading: isLoading, onRefresh: _loadRecipes),
                    const SizedBox(height: 16),
                    Expanded(
                      child: recipesData.recipes.isEmpty
                          ? const Center(
                              child: Text('No recipes found'),
                            )
                          : ListView.builder(
                              itemCount: recipesData.recipes.length,
                              itemBuilder: (context, index) {
                                return RecipeCard(recipe: recipesData.recipes[index]);
                              },
                            ),
                    ),
                    const SizedBox(height: 16),
                    _buildPaginationInfo(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadPage(int page) async {
    if (page == currentPage) return;
    setState(() {
      currentPage = page;
    });
    await _loadRecipes();
  }

  Widget _buildPaginationInfo() {
    if (recipesData.total == 0) return const SizedBox.shrink();
    
    final int totalPages = (recipesData.total / itemsPerPage).ceil();
    
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // İlk sayfa
              _buildPageButton(1, '1'),
              
              // Mevcut sayfadan önceki sayfalar için "..."
              if (currentPage > 3)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('...', style: TextStyle(fontSize: 18)),
                ),
              
              // Mevcut sayfadan bir önceki sayfa
              if (currentPage > 2)
                _buildPageButton(currentPage - 1, '${currentPage - 1}'),
              
              // Mevcut sayfa (eğer ilk veya son sayfa değilse)
              if (currentPage > 1 && currentPage < totalPages)
                _buildPageButton(currentPage, '$currentPage'),
              
              // Mevcut sayfadan bir sonraki sayfa
              if (currentPage < totalPages - 1)
                _buildPageButton(currentPage + 1, '${currentPage + 1}'),
              
              // Mevcut sayfadan sonraki sayfalar için "..."
              if (currentPage < totalPages - 2)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('...', style: TextStyle(fontSize: 18)),
                ),
              
              // Son sayfa
              if (totalPages > 1)
                _buildPageButton(totalPages, '$totalPages'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageButton(int page, String text) {
    final bool isCurrentPage = page == currentPage;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
        onPressed: isCurrentPage ? null : () => _loadPage(page),
        style: ElevatedButton.styleFrom(
          backgroundColor: isCurrentPage 
              ? Theme.of(context).colorScheme.primary 
              : Theme.of(context).colorScheme.surface,
          foregroundColor: isCurrentPage 
              ? Colors.white 
              : Theme.of(context).colorScheme.onSurface,
          minimumSize: const Size(32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isCurrentPage ? FontWeight.bold : FontWeight.normal,
            fontSize: 14
          ),
        ),
      ),
    );
  }
}
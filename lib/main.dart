import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/screens/recipes_screen.dart';
import 'package:recipeapp/screens/recipe_detail_screen.dart';

final _router = GoRouter(
  initialLocation: '/recipes',
  routes: [
    GoRoute(path: '/recipes', builder: (context, state) => const RecipesScreen()),
    GoRoute(
      path: '/recipes/:recipeId',
      builder:
          (context, state) => RecipeDetailScreen(
            recipeId: int.parse(
              state.pathParameters['recipeId'] ?? '0',
            ),
          ),
    ),
  ],
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        fontFamily: 'Poppins',
      ),
    );
  }
}
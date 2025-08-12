import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp/models/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            recipe.image,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 56,
                height: 56,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
        ),
        title: Text(
          recipe.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${recipe.cuisine} cuisine'),
            Row(
              children: [
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 4),
                Text('${recipe.prepTimeMinutes + recipe.cookTimeMinutes} mins'),
                const SizedBox(width: 8),
                const Icon(Icons.fireplace, size: 16, color: Colors.redAccent),
                const SizedBox(width: 4),
                Text('${recipe.caloriesPerServing} kcal'),
                const SizedBox(width: 8),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text('${recipe.rating}'),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to recipe detail
          context.push('/recipes/${recipe.id}');
        },
      ),
    );
  }
}

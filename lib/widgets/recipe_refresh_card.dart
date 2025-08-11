import 'package:flutter/material.dart';

class RecipeRefreshCard extends StatelessWidget {
  final int recipeCount;
  final bool isLoading;
  final Function() onRefresh;
  const RecipeRefreshCard(
      {super.key,
      required this.recipeCount,
      required this.isLoading,
      required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.restaurant_menu),
            const SizedBox(width: 8),
            Text(
              '${recipeCount.toString()} recipes found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            IconButton(
              onPressed: isLoading ? null : onRefresh,
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
            ),
          ],
        ),
      ),
    );
  }
}

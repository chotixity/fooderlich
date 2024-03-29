import 'package:flutter/material.dart';
import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  const GroceryListScreen({
    super.key,
    required this.manager,
  });
  @override
  Widget build(BuildContext context) {
// TODO: Replace with ListView

    // 1
    final groceryItems = manager.groceryItems;
// 2
    return Padding(
      padding: const EdgeInsets.all(16.0),
// 3
      child: ListView.separated(
// 4
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return GroceryTile(
            key: Key(item.id),
            item: item,
// 6
            onComplete: (change) {
// 7
              if (change != null) {
                manager.completeItem(index, change);
              }
            },
          );
        },
// 8
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
// TODO: Wrap in a Dismissable
// TODO: Wrap in an InkWell
// 5;
  }
}

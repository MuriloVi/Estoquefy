import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ProductListItem({
    super.key,
    required this.product,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(product.description),
            const SizedBox(height: 4),
            Text(
              'Peso: ${product.weight.toStringAsFixed(2)} kg',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onEdit != null)
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEdit,
                tooltip: 'Editar',
              ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
                tooltip: 'Excluir',
                color: Theme.of(context).colorScheme.error,
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}


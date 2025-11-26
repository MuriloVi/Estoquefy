import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/product_controller.dart';
import '../widgets/loading_widget.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/product_list_item.dart';
import 'product_form_screen.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListAsync = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: productListAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return const EmptyStateWidget(
              message: 'Nenhum produto cadastrado.\nClique no botão + para adicionar um novo produto.',
              animationPath: 'assets/animations/empty.json',
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(productListProvider);
            },
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductListItem(
                  product: product,
                  onTap: () {
                    // TODO: Navegar para detalhes do produto
                  },
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductFormScreen(productId: product.id),
                      ),
                    );
                  },
                  onDelete: () {
                    _showDeleteDialog(context, ref, product.id);
                  },
                );
              },
            ),
          );
        },
        loading: () => const LoadingWidget(message: 'Carregando produtos...'),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Erro ao carregar produtos',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(productListProvider);
                },
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductFormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, int productId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Tem certeza que deseja excluir este produto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              final deleteController = ref.read(productDeleteProvider.notifier);
              try {
                await deleteController.delete(productId);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Produto excluído com sucesso')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro ao excluir produto: $e')),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}


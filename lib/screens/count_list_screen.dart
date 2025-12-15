import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/count_controller.dart';
import '../controllers/product_controller.dart';
import '../widgets/loading_widget.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/count_list_item.dart';
import 'count_form_screen.dart';

class CountListScreen extends ConsumerWidget {
  final int productId;

  const CountListScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productByIdProvider(productId));
    final countListAsync = ref.watch(countListByProductIdProvider(productId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contagens'),
      ),
      body: Column(
        children: [
          productAsync.when(
            data: (product) {
              if (product == null) {
                return const SizedBox.shrink();
              }
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Peso: ${product.weight.toStringAsFixed(2)} kg',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              );
            },
            loading: () => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: const LinearProgressIndicator(),
            ),
            error: (error, stack) => Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.errorContainer,
              child: Text(
                'Erro ao carregar produto',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ),
          ),
          Expanded(
            child: countListAsync.when(
              data: (counts) {
                if (counts.isEmpty) {
                  return const EmptyStateWidget(
                    message: 'Nenhuma contagem registrada para este produto.\nClique no botão + para adicionar uma nova contagem.',
                    animationPath: 'assets/animations/empty.json',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(countListByProductIdProvider(productId));
                  },
                  child: ListView.builder(
                    itemCount: counts.length,
                    itemBuilder: (context, index) {
                      final count = counts[index];
                      return CountListItem(
                        count: count,
                        onTap: () {
                          // TODO: Navegar para detalhes da contagem
                        },
                        onEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountFormScreen(
                                productId: productId,
                                countId: count.id,
                              ),
                            ),
                          );
                        },
                        onDelete: () {
                          _showDeleteDialog(context, ref, count.id, productId);
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const LoadingWidget(message: 'Carregando contagens...'),
              error: (error, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        'Erro ao carregar contagens',
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
                          ref.invalidate(countListByProductIdProvider(productId));
                        },
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountFormScreen(productId: productId),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, int countId, int productId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Tem certeza que deseja excluir esta contagem?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              final deleteController = ref.read(countDeleteProvider.notifier);
              try {
                await deleteController.delete(countId, productId);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contagem excluída com sucesso')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro ao excluir contagem: $e')),
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


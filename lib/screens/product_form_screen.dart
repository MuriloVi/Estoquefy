import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/product_controller.dart';
import '../widgets/loading_widget.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  final int? productId;

  const ProductFormScreen({
    super.key,
    this.productId,
  });

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _weightController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final title = _titleController.text.trim();
      final description = _descriptionController.text.trim();
      final weight = double.parse(_weightController.text.trim());

      if (widget.productId == null) {
        final createController = ref.read(productCreateProvider.notifier);
        await createController.create(
          title: title,
          description: description,
          weight: weight,
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produto criado com sucesso')),
          );
          Navigator.pop(context);
        }
      } else {
        final updateController = ref.read(productUpdateProvider.notifier);
        await updateController.updateProduct(
          id: widget.productId!,
          title: title,
          description: description,
          weight: weight,
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produto atualizado com sucesso')),
          );
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar produto: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.productId != null) {
      final productAsync = ref.watch(productByIdProvider(widget.productId!));
      return productAsync.when(
        data: (product) {
          if (product != null && _titleController.text.isEmpty) {
            _titleController.text = product.title;
            _descriptionController.text = product.description;
            _weightController.text = product.weight.toString();
          }
          return _buildForm();
        },
        loading: () => Scaffold(
          appBar: AppBar(
            title: const Text('Editar Produto'),
          ),
          body: const LoadingWidget(message: 'Carregando produto...'),
        ),
        error: (error, stack) => Scaffold(
          appBar: AppBar(
            title: const Text('Editar Produto'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Erro ao carregar produto: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(productByIdProvider(widget.productId!));
                  },
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return _buildForm();
  }

  Widget _buildForm() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productId == null ? 'Novo Produto' : 'Editar Produto'),
      ),
      body: _isLoading
          ? const LoadingWidget(message: 'Salvando produto...')
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Título',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'O título é obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'A descrição é obrigatória';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        labelText: 'Peso (kg)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'O peso é obrigatório';
                        }
                        final weight = double.tryParse(value.trim());
                        if (weight == null || weight <= 0) {
                          return 'O peso deve ser um número maior que zero';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _save,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}


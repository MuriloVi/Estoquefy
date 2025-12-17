import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/count_controller.dart';
import '../widgets/loading_widget.dart';

class CountFormScreen extends ConsumerStatefulWidget {
  final int productId;
  final int? countId;

  const CountFormScreen({
    super.key,
    required this.productId,
    this.countId,
  });

  @override
  ConsumerState<CountFormScreen> createState() => _CountFormScreenState();
}

class _CountFormScreenState extends ConsumerState<CountFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _totalWeightController = TextEditingController();
  final _countResultController = TextEditingController();
  final _operatorIdController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _totalWeightController.dispose();
    _countResultController.dispose();
    _operatorIdController.dispose();
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
      final totalWeight = int.parse(_totalWeightController.text.trim());
      final countResult = int.parse(_countResultController.text.trim());
      final operatorId = _operatorIdController.text.trim().isEmpty
          ? null
          : int.parse(_operatorIdController.text.trim());

      if (widget.countId == null) {
        final createController = ref.read(countCreateProvider.notifier);
        await createController.create(
          title: title,
          totalWeight: totalWeight,
          productId: widget.productId,
          countResult: countResult,
          operatorId: operatorId,
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contagem criada com sucesso')),
          );
          Navigator.pop(context);
        }
      } else {
        final updateController = ref.read(countUpdateProvider.notifier);
        await updateController.updateCount(
          id: widget.countId!,
          title: title,
          totalWeight: totalWeight,
          countResult: countResult,
          operatorId: operatorId,
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contagem atualizada com sucesso')),
          );
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar contagem: $e')),
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
    if (widget.countId != null) {
      final countAsync = ref.watch(countByIdProvider(widget.countId!));
      return countAsync.when(
        data: (count) {
          if (count != null && _titleController.text.isEmpty) {
            _titleController.text = count.title;
            _totalWeightController.text = count.totalWeight.toString();
            _countResultController.text = count.countResult.toString();
            if (count.operatorId != null) {
              _operatorIdController.text = count.operatorId.toString();
            }
          }
          return _buildForm();
        },
        loading: () => Scaffold(
          appBar: AppBar(
            title: const Text('Editar Contagem'),
          ),
          body: const LoadingWidget(message: 'Carregando contagem...'),
        ),
        error: (error, stack) => Scaffold(
          appBar: AppBar(
            title: const Text('Editar Contagem'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Erro ao carregar contagem: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(countByIdProvider(widget.countId!));
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
        title: Text(widget.countId == null ? 'Nova Contagem' : 'Editar Contagem'),
      ),
      body: _isLoading
          ? const LoadingWidget(message: 'Salvando contagem...')
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
                      controller: _totalWeightController,
                      decoration: const InputDecoration(
                        labelText: 'Peso Total (kg)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'O peso total é obrigatório';
                        }
                        final weight = int.tryParse(value.trim());
                        if (weight == null || weight <= 0) {
                          return 'O peso total deve ser um número maior que zero';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _countResultController,
                      decoration: const InputDecoration(
                        labelText: 'Resultado da Contagem',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'O resultado da contagem é obrigatório';
                        }
                        final result = int.tryParse(value.trim());
                        if (result == null || result < 0) {
                          return 'O resultado deve ser um número maior ou igual a zero';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _operatorIdController,
                      decoration: const InputDecoration(
                        labelText: 'ID do Operador (opcional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value != null && value.trim().isNotEmpty) {
                          final operatorId = int.tryParse(value.trim());
                          if (operatorId == null || operatorId <= 0) {
                            return 'O ID do operador deve ser um número maior que zero';
                          }
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


import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

part 'product_controller.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository();
}

@riverpod
Future<List<Product>> productList(ProductListRef ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getAll();
}

@riverpod
Future<Product?> productById(ProductByIdRef ref, int id) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getById(id);
}

@riverpod
class ProductCreate extends _$ProductCreate {
  @override
  FutureOr<Product> build() async {
    throw UnimplementedError();
  }

  Future<Product> create({
    required String title,
    required String description,
    required double weight,
  }) async {
    state = const AsyncValue.loading();
    final repository = ref.read(productRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final product = await repository.create(
        title: title,
        description: description,
        weight: weight,
      );
      ref.invalidate(productListProvider);
      return product;
    });
    return state.value!;
  }
}

@riverpod
class ProductUpdate extends _$ProductUpdate {
  @override
  FutureOr<Product> build() async {
    throw UnimplementedError();
  }

  Future<Product> updateProduct({
    required int id,
    String? title,
    String? description,
    double? weight,
  }) async {
    state = const AsyncValue.loading();
    final repository = ref.read(productRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final product = await repository.update(
        id: id,
        title: title,
        description: description,
        weight: weight,
      );
      ref.invalidate(productListProvider);
      ref.invalidate(productByIdProvider(id));
      return product;
    });
    return state.value!;
  }
}

@riverpod
class ProductDelete extends _$ProductDelete {
  @override
  FutureOr<void> build() async {}

  Future<void> delete(int id) async {
    state = const AsyncValue.loading();
    final repository = ref.read(productRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.delete(id);
      ref.invalidate(productListProvider);
      ref.invalidate(productByIdProvider(id));
    });
  }
}


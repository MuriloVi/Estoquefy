import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/count.dart';
import '../repositories/count_repository.dart';

part 'count_controller.g.dart';

@riverpod
CountRepository countRepository(CountRepositoryRef ref) {
  return CountRepository();
}

@riverpod
Future<List<Count>> countList(CountListRef ref) async {
  final repository = ref.watch(countRepositoryProvider);
  return repository.getAll();
}

@riverpod
Future<List<Count>> countListByProductId(CountListByProductIdRef ref, int productId) async {
  final repository = ref.watch(countRepositoryProvider);
  return repository.getByProductId(productId);
}

@riverpod
Future<Count?> countById(CountByIdRef ref, int id) async {
  final repository = ref.watch(countRepositoryProvider);
  return repository.getById(id);
}

@riverpod
class CountCreate extends _$CountCreate {
  @override
  FutureOr<Count> build() async {
    throw UnimplementedError();
  }

  Future<Count> create({
    required String title,
    required int totalWeight,
    required int productId,
    required int countResult,
    int? operatorId,
  }) async {
    state = const AsyncValue.loading();
    final repository = ref.read(countRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final count = await repository.create(
        title: title,
        totalWeight: totalWeight,
        productId: productId,
        countResult: countResult,
        operatorId: operatorId,
      );
      ref.invalidate(countListProvider);
      ref.invalidate(countListByProductIdProvider(productId));
      return count;
    });
    return state.value!;
  }
}

@riverpod
class CountUpdate extends _$CountUpdate {
  @override
  FutureOr<Count> build() async {
    throw UnimplementedError();
  }

  Future<Count> updateCount({
    required int id,
    String? title,
    int? totalWeight,
    int? countResult,
    int? operatorId,
  }) async {
    state = const AsyncValue.loading();
    final repository = ref.read(countRepositoryProvider);
    state = await AsyncValue.guard(() async {
      final count = await repository.update(
        id: id,
        title: title,
        totalWeight: totalWeight,
        countResult: countResult,
        operatorId: operatorId,
      );
      ref.invalidate(countListProvider);
      ref.invalidate(countByIdProvider(id));
      ref.invalidate(countListByProductIdProvider(count.productId));
      return count;
    });
    return state.value!;
  }
}

@riverpod
class CountDelete extends _$CountDelete {
  @override
  FutureOr<void> build() async {}

  Future<void> delete(int id, int productId) async {
    state = const AsyncValue.loading();
    final repository = ref.read(countRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await repository.delete(id);
      ref.invalidate(countListProvider);
      ref.invalidate(countByIdProvider(id));
      ref.invalidate(countListByProductIdProvider(productId));
    });
  }
}


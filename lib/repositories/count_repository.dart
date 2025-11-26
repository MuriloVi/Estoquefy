import '../models/count.dart';
import 'supabase_client.dart';

class CountRepository {
  final _client = SupabaseClientConfig.client;
  static const String _tableName = 'counts';

  Future<List<Count>> getAll() async {
    final response = await _client.from(_tableName).select().order('created_at', ascending: false);
    return (response as List).map((json) => Count.fromJson(json)).toList();
  }

  Future<List<Count>> getByProductId(int productId) async {
    final response = await _client.from(_tableName).select().eq('product_id', productId).order('created_at', ascending: false);
    return (response as List).map((json) => Count.fromJson(json)).toList();
  }

  Future<Count?> getById(int id) async {
    try {
      final response = await _client.from(_tableName).select().eq('id', id).single();
      return Count.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<Count> create({
    required String title,
    required int totalWeight,
    required int productId,
    required int countResult,
    int? operatorId,
  }) async {
    final now = DateTime.now();
    final data = {
      'title': title,
      'total_weight': totalWeight,
      'product_id': productId,
      'count_result': countResult,
      'operator_id': operatorId,
      'updated_at': now.toIso8601String(),
    };
    final response = await _client.from(_tableName).insert(data).select().single();
    return Count.fromJson(response);
  }

  Future<Count> update({
    required int id,
    String? title,
    int? totalWeight,
    int? countResult,
    int? operatorId,
  }) async {
    final data = <String, dynamic>{
      'updated_at': DateTime.now().toIso8601String(),
    };
    if (title != null) data['title'] = title;
    if (totalWeight != null) data['total_weight'] = totalWeight;
    if (countResult != null) data['count_result'] = countResult;
    if (operatorId != null) data['operator_id'] = operatorId;

    final response = await _client.from(_tableName).update(data).eq('id', id).select().single();
    return Count.fromJson(response);
  }

  Future<void> delete(int id) async {
    await _client.from(_tableName).delete().eq('id', id);
  }
}


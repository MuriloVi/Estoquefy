import '../models/count.dart';
import 'supabase_client.dart';

class CountRepository {
  final _client = SupabaseClientConfig.client;
  static const String _tableName = 'counts';

  Future<List<Count>> getAll() async {
    final response = await _client.from(_tableName).select().order('createdAt', ascending: false);
    return (response as List).map((json) => Count.fromJson(json)).toList();
  }

  Future<List<Count>> getByProductId(int productId) async {
    final response = await _client.from(_tableName).select().eq('productId', productId).order('createdAt', ascending: false);
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
      'totalWeight': totalWeight,
      'productId': productId,
      'countResult': countResult,
      'operatorId': operatorId,
      'updatedAt': now.toIso8601String(),
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
      'updatedAt': DateTime.now().toIso8601String(),
    };
    if (title != null) data['title'] = title;
    if (totalWeight != null) data['totalWeight'] = totalWeight;
    if (countResult != null) data['countResult'] = countResult;
    if (operatorId != null) data['operatorId'] = operatorId;

    final response = await _client.from(_tableName).update(data).eq('id', id).select().single();
    return Count.fromJson(response);
  }

  Future<void> delete(int id) async {
    await _client.from(_tableName).delete().eq('id', id);
  }
}


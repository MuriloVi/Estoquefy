import '../models/product.dart';
import 'supabase_client.dart';

class ProductRepository {
  final _client = SupabaseClientConfig.client;
  static const String _tableName = 'products';

  Future<List<Product>> getAll() async {
    final response = await _client.from(_tableName).select().order('createdAt', ascending: false);
    return (response as List).map((json) => Product.fromJson(json)).toList();
  }

  Future<Product?> getById(int id) async {
    try {
      final response = await _client.from(_tableName).select().eq('id', id).single();
      return Product.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<Product> create({
    required String title,
    required String description,
    required double weight,
  }) async {
    final data = {
      'title': title,
      'description': description,
      'weight': weight,
    };
    final response = await _client.from(_tableName).insert(data).select().single();
    return Product.fromJson(response);
  }

  Future<Product> update({
    required int id,
    String? title,
    String? description,
    double? weight,
  }) async {
    final data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (description != null) data['description'] = description;
    if (weight != null) data['weight'] = weight;

    final response = await _client.from(_tableName).update(data).eq('id', id).select().single();
    return Product.fromJson(response);
  }

  Future<void> delete(int id) async {
    await _client.from(_tableName).delete().eq('id', id);
  }
}


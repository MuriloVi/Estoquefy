class Count {
  final int id;
  final DateTime createdAt;
  final String title;
  final int totalWeight;
  final DateTime updatedAt;
  final int productId;
  final int countResult;
  final int? operatorId;

  const Count({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.totalWeight,
    required this.updatedAt,
    required this.productId,
    required this.countResult,
    this.operatorId,
  });

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String,
      totalWeight: json['total_weight'] as int,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      productId: json['product_id'] as int,
      countResult: json['count_result'] as int,
      operatorId: json['operator_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'title': title,
      'total_weight': totalWeight,
      'updated_at': updatedAt.toIso8601String(),
      'product_id': productId,
      'count_result': countResult,
      'operator_id': operatorId,
    };
  }

  Count copyWith({
    int? id,
    DateTime? createdAt,
    String? title,
    int? totalWeight,
    DateTime? updatedAt,
    int? productId,
    int? countResult,
    int? operatorId,
  }) {
    return Count(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      totalWeight: totalWeight ?? this.totalWeight,
      updatedAt: updatedAt ?? this.updatedAt,
      productId: productId ?? this.productId,
      countResult: countResult ?? this.countResult,
      operatorId: operatorId ?? this.operatorId,
    );
  }
}


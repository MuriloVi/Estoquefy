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
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      totalWeight: json['totalWeight'] as int,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      productId: json['productId'] as int,
      countResult: json['countResult'] as int,
      operatorId: json['operatorId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'title': title,
      'totalWeight': totalWeight,
      'updatedAt': updatedAt.toIso8601String(),
      'productId': productId,
      'countResult': countResult,
      'operatorId': operatorId,
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


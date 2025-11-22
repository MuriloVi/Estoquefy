class Product {
  final int id;
  final DateTime createdAt;
  final String title;
  final String description;
  final double weight;

  const Product({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.weight,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      weight: (json['weight'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'title': title,
      'description': description,
      'weight': weight,
    };
  }

  Product copyWith({
    int? id,
    DateTime? createdAt,
    String? title,
    String? description,
    double? weight,
  }) {
    return Product(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      weight: weight ?? this.weight,
    );
  }
}


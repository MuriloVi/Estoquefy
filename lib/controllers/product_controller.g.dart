// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'1143e6a957468f07814b030b8e53d8ea1ddb037b';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
      productRepository,
      name: r'productRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productListHash() => r'6ee4452b50ffc81826729364c6d4d650722a6da5';

/// See also [productList].
@ProviderFor(productList)
final productListProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  productList,
  name: r'productListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductListRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productByIdHash() => r'f8599c4ee3b6d8d6c687b3c52dd3fd2b77934c14';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productById].
@ProviderFor(productById)
const productByIdProvider = ProductByIdFamily();

/// See also [productById].
class ProductByIdFamily extends Family<AsyncValue<Product?>> {
  /// See also [productById].
  const ProductByIdFamily();

  /// See also [productById].
  ProductByIdProvider call(int id) {
    return ProductByIdProvider(id);
  }

  @override
  ProductByIdProvider getProviderOverride(
    covariant ProductByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productByIdProvider';
}

/// See also [productById].
class ProductByIdProvider extends AutoDisposeFutureProvider<Product?> {
  /// See also [productById].
  ProductByIdProvider(int id)
    : this._internal(
        (ref) => productById(ref as ProductByIdRef, id),
        from: productByIdProvider,
        name: r'productByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$productByIdHash,
        dependencies: ProductByIdFamily._dependencies,
        allTransitiveDependencies: ProductByIdFamily._allTransitiveDependencies,
        id: id,
      );

  ProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Product?> Function(ProductByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductByIdProvider._internal(
        (ref) => create(ref as ProductByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Product?> createElement() {
    return _ProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductByIdRef on AutoDisposeFutureProviderRef<Product?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProductByIdProviderElement
    extends AutoDisposeFutureProviderElement<Product?>
    with ProductByIdRef {
  _ProductByIdProviderElement(super.provider);

  @override
  int get id => (origin as ProductByIdProvider).id;
}

String _$productCreateHash() => r'04e149187e3e8cde223a7ae40f0455af7d0a86fa';

/// See also [ProductCreate].
@ProviderFor(ProductCreate)
final productCreateProvider =
    AutoDisposeAsyncNotifierProvider<ProductCreate, Product>.internal(
      ProductCreate.new,
      name: r'productCreateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productCreateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductCreate = AutoDisposeAsyncNotifier<Product>;
String _$productUpdateHash() => r'7fe4e77e498510f948c7c700414f16b7f67d0de5';

/// See also [ProductUpdate].
@ProviderFor(ProductUpdate)
final productUpdateProvider =
    AutoDisposeAsyncNotifierProvider<ProductUpdate, Product>.internal(
      ProductUpdate.new,
      name: r'productUpdateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productUpdateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductUpdate = AutoDisposeAsyncNotifier<Product>;
String _$productDeleteHash() => r'ade17189b6a9efd90505be4f3f82c1f2508fe529';

/// See also [ProductDelete].
@ProviderFor(ProductDelete)
final productDeleteProvider =
    AutoDisposeAsyncNotifierProvider<ProductDelete, void>.internal(
      ProductDelete.new,
      name: r'productDeleteProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productDeleteHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductDelete = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

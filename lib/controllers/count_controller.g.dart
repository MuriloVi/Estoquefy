// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countRepositoryHash() => r'f9445789c30519446f81794a3b59101c9e445013';

/// See also [countRepository].
@ProviderFor(countRepository)
final countRepositoryProvider = AutoDisposeProvider<CountRepository>.internal(
  countRepository,
  name: r'countRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CountRepositoryRef = AutoDisposeProviderRef<CountRepository>;
String _$countListHash() => r'2180cc5766e92e066bac711ad67ff56fc612b418';

/// See also [countList].
@ProviderFor(countList)
final countListProvider = AutoDisposeFutureProvider<List<Count>>.internal(
  countList,
  name: r'countListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CountListRef = AutoDisposeFutureProviderRef<List<Count>>;
String _$countListByProductIdHash() =>
    r'19892c4649e335d6e2d393afc79fae210a30d265';

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

/// See also [countListByProductId].
@ProviderFor(countListByProductId)
const countListByProductIdProvider = CountListByProductIdFamily();

/// See also [countListByProductId].
class CountListByProductIdFamily extends Family<AsyncValue<List<Count>>> {
  /// See also [countListByProductId].
  const CountListByProductIdFamily();

  /// See also [countListByProductId].
  CountListByProductIdProvider call(int productId) {
    return CountListByProductIdProvider(productId);
  }

  @override
  CountListByProductIdProvider getProviderOverride(
    covariant CountListByProductIdProvider provider,
  ) {
    return call(provider.productId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'countListByProductIdProvider';
}

/// See also [countListByProductId].
class CountListByProductIdProvider
    extends AutoDisposeFutureProvider<List<Count>> {
  /// See also [countListByProductId].
  CountListByProductIdProvider(int productId)
    : this._internal(
        (ref) =>
            countListByProductId(ref as CountListByProductIdRef, productId),
        from: countListByProductIdProvider,
        name: r'countListByProductIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$countListByProductIdHash,
        dependencies: CountListByProductIdFamily._dependencies,
        allTransitiveDependencies:
            CountListByProductIdFamily._allTransitiveDependencies,
        productId: productId,
      );

  CountListByProductIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final int productId;

  @override
  Override overrideWith(
    FutureOr<List<Count>> Function(CountListByProductIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CountListByProductIdProvider._internal(
        (ref) => create(ref as CountListByProductIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Count>> createElement() {
    return _CountListByProductIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountListByProductIdProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CountListByProductIdRef on AutoDisposeFutureProviderRef<List<Count>> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _CountListByProductIdProviderElement
    extends AutoDisposeFutureProviderElement<List<Count>>
    with CountListByProductIdRef {
  _CountListByProductIdProviderElement(super.provider);

  @override
  int get productId => (origin as CountListByProductIdProvider).productId;
}

String _$countByIdHash() => r'564524deb535afb0adac457c397eb2b148cbb55c';

/// See also [countById].
@ProviderFor(countById)
const countByIdProvider = CountByIdFamily();

/// See also [countById].
class CountByIdFamily extends Family<AsyncValue<Count?>> {
  /// See also [countById].
  const CountByIdFamily();

  /// See also [countById].
  CountByIdProvider call(int id) {
    return CountByIdProvider(id);
  }

  @override
  CountByIdProvider getProviderOverride(covariant CountByIdProvider provider) {
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
  String? get name => r'countByIdProvider';
}

/// See also [countById].
class CountByIdProvider extends AutoDisposeFutureProvider<Count?> {
  /// See also [countById].
  CountByIdProvider(int id)
    : this._internal(
        (ref) => countById(ref as CountByIdRef, id),
        from: countByIdProvider,
        name: r'countByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$countByIdHash,
        dependencies: CountByIdFamily._dependencies,
        allTransitiveDependencies: CountByIdFamily._allTransitiveDependencies,
        id: id,
      );

  CountByIdProvider._internal(
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
    FutureOr<Count?> Function(CountByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CountByIdProvider._internal(
        (ref) => create(ref as CountByIdRef),
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
  AutoDisposeFutureProviderElement<Count?> createElement() {
    return _CountByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountByIdProvider && other.id == id;
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
mixin CountByIdRef on AutoDisposeFutureProviderRef<Count?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CountByIdProviderElement extends AutoDisposeFutureProviderElement<Count?>
    with CountByIdRef {
  _CountByIdProviderElement(super.provider);

  @override
  int get id => (origin as CountByIdProvider).id;
}

String _$countCreateHash() => r'dad92a61f35b36e2c0ad1b6d17096e59ccdc880c';

/// See also [CountCreate].
@ProviderFor(CountCreate)
final countCreateProvider =
    AutoDisposeAsyncNotifierProvider<CountCreate, Count>.internal(
      CountCreate.new,
      name: r'countCreateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$countCreateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CountCreate = AutoDisposeAsyncNotifier<Count>;
String _$countUpdateHash() => r'0f907820482ed9f684e775099a08539765e685e5';

/// See also [CountUpdate].
@ProviderFor(CountUpdate)
final countUpdateProvider =
    AutoDisposeAsyncNotifierProvider<CountUpdate, Count>.internal(
      CountUpdate.new,
      name: r'countUpdateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$countUpdateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CountUpdate = AutoDisposeAsyncNotifier<Count>;
String _$countDeleteHash() => r'e079824369dd0e931020b8f8a763bc6bf5842ab1';

/// See also [CountDelete].
@ProviderFor(CountDelete)
final countDeleteProvider =
    AutoDisposeAsyncNotifierProvider<CountDelete, void>.internal(
      CountDelete.new,
      name: r'countDeleteProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$countDeleteHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CountDelete = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

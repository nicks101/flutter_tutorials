import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value_generic/models/my_model.dart';

import 'generic_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  GenericModel,
  MyModel,
])

/// Making this private and mutable
Serializers _serializers =
    (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

final serializers = _serializers;

/// Class to add new factories according to the type
class GenericBuilderFactory<T> {
  /// Keeping track of the builder factories added to the serializers for type T
  static final Map<Type, GenericBuilderFactory> _factories = {};

  /// returning serializer if the builder factory is already added
  static Serializers getSerializer<T>() {
    if (_factories.containsKey(T)) {
      return _serializers;
    }
    return GenericBuilderFactory<T>()._addFactory();
  }

  /// Adding the builder factory
  Serializers _addFactory() {
    _factories[T] = this;

    _serializers = (_serializers.toBuilder()
          ..addBuilderFactory(
            FullType(GenericModel, [FullType(T)]),
            () => GenericModelBuilder<T>(),
          )
          ..addBuilderFactory(
            FullType(BuiltList, [FullType(T)]),
            () => ListBuilder<T>(),
          ))
        .build();

    return _serializers;
  }
}

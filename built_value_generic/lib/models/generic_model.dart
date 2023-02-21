import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

/// Add the import for the serializer
import 'serializers.dart';

part 'generic_model.g.dart';

abstract class GenericModel<T>
    implements Built<GenericModel<T>, GenericModelBuilder<T>> {
  GenericModel._();
  factory GenericModel([void Function(GenericModelBuilder<T>) updates]) =
      _$GenericModel<T>;

  Map<String, dynamic> toJson() {
    /// Add the typecast [Map<String, dynamic>] to fix the error
    return serializers.serializeWith(GenericModel.serializer, this)
        as Map<String, dynamic>;
  }

  static GenericModel<T> fromJson<T>(Map<String, dynamic> json) {
    return GenericBuilderFactory.getSerializer<T>().deserialize(
      json,
      specifiedType: FullType(GenericModel, [FullType(T)]),
    ) as GenericModel<T>;
  }

  static Serializer<GenericModel> get serializer => _$genericModelSerializer;

  BuiltList<T> get data;
}

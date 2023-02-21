import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value_generic/models/serializers.dart';

part 'my_model.g.dart';

abstract class MyModel<T> implements Built<MyModel<T>, MyModelBuilder<T>> {
  MyModel._();
  factory MyModel([void Function(MyModelBuilder<T>) updates]) = _$MyModel<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MyModel.serializer, this)
        as Map<String, dynamic>;
  }

  static MyModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MyModel.serializer, json) as MyModel;
  }

  static Serializer<MyModel> get serializer => _$myModelSerializer;

  String get name;

  String get id;
}

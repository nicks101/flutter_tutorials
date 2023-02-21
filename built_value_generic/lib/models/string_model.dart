// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';

// part 'string_model.g.dart';

// abstract class StringModel implements Built<StringModel, StringModelBuilder> {
  

//   StringModel._();
//   factory StringModel([void Function(StringModelBuilder) updates]) = _$StringModel;

//   Map<String, dynamic> toJson() {
//     return serializers.serializeWith(StringModel.serializer, this);
//   }

//   static StringModel fromJson(Map<String, dynamic> json) {
//     return serializers.deserializeWith(StringModel.serializer, json);
//   }

//   static Serializer<StringModel> get serializer => _$stringModelSerializer;
// }
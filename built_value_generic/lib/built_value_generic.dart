import 'package:built_collection/built_collection.dart';
import 'package:built_value_generic/models/generic_model.dart';
import 'package:built_value_generic/models/my_model.dart';

void main() {
  /// Testing serialization with generic type [String]
  final testModel = GenericModel<String>(
    (b) => b
      ..data = ListBuilder<String>(
        ['string 1', 'string 2'],
      ),
  );

  print('model: $testModel');
  print('serialized json: ${testModel.toJson()}');

  /// Testing deserialization with generic type [String]
  final dummyJson = {
    'data': ['string 1', 'string 2'],
  };
  try {
    final testString = GenericModel.fromJson<String>(dummyJson);

    print(testString);
    print(testString.toJson());
  } catch (e) {
    print("\nLooks like it didn't work 🙃");
    print(e);
  }

  /// Testing deserialization with generic type [int]
  final dummyJsonInt = {
    'data': [1, 2],
  };
  try {
    final testInt = GenericModel.fromJson<int>(dummyJsonInt);

    print(testInt);
    print(testInt.toJson());
  } catch (e) {
    print("\nLooks like it didn't work 🙃");
    print(e);
  }

  /// Testing deserialization with generic type [MyModel]
  final dummyJsonMyModel = {
    'data': [
      {'name': 'name 1', 'id': 'id 1'},
      {'name': 'name 2', 'id': 'id 2'},
    ],
  };

  final testMyModel = GenericModel.fromJson<MyModel>(dummyJsonMyModel);

  print('deserialized model: $testMyModel');

  /// Testing serialization with generic type [MyModel]
  print('serialized json: ${testMyModel.toJson()}');
}

import 'package:built_collection/built_collection.dart';
import 'package:built_value_generic/models/generic_model.dart';
import 'package:built_value_generic/models/my_model.dart';
import 'package:test/test.dart';

void main() {
  group('GenericModel<MyModel>', () {
    final GenericModel<MyModel> model = GenericModel<MyModel>(
      (b) => b
        ..data = ListBuilder<MyModel>([
          MyModel((b) => b
            ..name = 'Hello'
            ..id = '1'),
          MyModel((b) => b
            ..name = 'World'
            ..id = '2'),
        ]),
    );

    test('deserializes serialized model', () async {
      expect(
        GenericModel.fromJson<MyModel>(model.toJson()),
        model,
      );
    });

    test('json format', () async {
      expect(
        model.toJson(),
        {
          'data': [
            {'name': 'Hello', 'id': '1'},
            {'name': 'World', 'id': '2'},
          ],
        },
      );
    });
  });

  group('GenericModel<String>', () {
    final GenericModel<String> model = GenericModel<String>(
      (b) => b..data = ListBuilder<String>(['Hello', 'World']),
    );

    test('deserializes serialized model', () async {
      expect(
        GenericModel.fromJson<String>(model.toJson()),
        model,
      );
    });

    test('json format', () async {
      expect(
        model.toJson(),
        {
          'data': ['Hello', 'World'],
        },
      );
    });
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MyModel<Object?>> _$myModelSerializer = new _$MyModelSerializer();

class _$MyModelSerializer implements StructuredSerializer<MyModel<Object?>> {
  @override
  final Iterable<Type> types = const [MyModel, _$MyModel];
  @override
  final String wireName = 'MyModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MyModel<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MyModel<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MyModelBuilder<Object?>();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MyModel<T> extends MyModel<T> {
  @override
  final String name;
  @override
  final String id;

  factory _$MyModel([void Function(MyModelBuilder<T>)? updates]) =>
      (new MyModelBuilder<T>()..update(updates))._build();

  _$MyModel._({required this.name, required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'MyModel', 'name');
    BuiltValueNullFieldError.checkNotNull(id, r'MyModel', 'id');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'MyModel', 'T');
    }
  }

  @override
  MyModel<T> rebuild(void Function(MyModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyModelBuilder<T> toBuilder() => new MyModelBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyModel && name == other.name && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyModel')
          ..add('name', name)
          ..add('id', id))
        .toString();
  }
}

class MyModelBuilder<T> implements Builder<MyModel<T>, MyModelBuilder<T>> {
  _$MyModel<T>? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  MyModelBuilder();

  MyModelBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyModel<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyModel<T>;
  }

  @override
  void update(void Function(MyModelBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyModel<T> build() => _build();

  _$MyModel<T> _build() {
    final _$result = _$v ??
        new _$MyModel<T>._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'MyModel', 'name'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'MyModel', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GenericModel<Object?>> _$genericModelSerializer =
    new _$GenericModelSerializer();

class _$GenericModelSerializer
    implements StructuredSerializer<GenericModel<Object?>> {
  @override
  final Iterable<Type> types = const [GenericModel, _$GenericModel];
  @override
  final String wireName = 'GenericModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GenericModel<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType: new FullType(BuiltList, [parameterT])),
    ];

    return result;
  }

  @override
  GenericModel<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new GenericModelBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as GenericModelBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: new FullType(BuiltList, [parameterT]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GenericModel<T> extends GenericModel<T> {
  @override
  final BuiltList<T> data;

  factory _$GenericModel([void Function(GenericModelBuilder<T>)? updates]) =>
      (new GenericModelBuilder<T>()..update(updates))._build();

  _$GenericModel._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'GenericModel', 'data');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'GenericModel', 'T');
    }
  }

  @override
  GenericModel<T> rebuild(void Function(GenericModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericModelBuilder<T> toBuilder() =>
      new GenericModelBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericModel && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenericModel')..add('data', data))
        .toString();
  }
}

class GenericModelBuilder<T>
    implements Builder<GenericModel<T>, GenericModelBuilder<T>> {
  _$GenericModel<T>? _$v;

  ListBuilder<T>? _data;
  ListBuilder<T> get data => _$this._data ??= new ListBuilder<T>();
  set data(ListBuilder<T>? data) => _$this._data = data;

  GenericModelBuilder();

  GenericModelBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericModel<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericModel<T>;
  }

  @override
  void update(void Function(GenericModelBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericModel<T> build() => _build();

  _$GenericModel<T> _build() {
    _$GenericModel<T> _$result;
    try {
      _$result = _$v ?? new _$GenericModel<T>._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GenericModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hue_color.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HueColor> _$hueColorSerializer = new _$HueColorSerializer();

class _$HueColorSerializer implements StructuredSerializer<HueColor> {
  @override
  final Iterable<Type> types = const [HueColor, _$HueColor];
  @override
  final String wireName = 'HueColor';

  @override
  Iterable<Object?> serialize(Serializers serializers, HueColor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hue',
      serializers.serialize(object.hue, specifiedType: const FullType(num)),
      'saturation',
      serializers.serialize(object.saturation,
          specifiedType: const FullType(num)),
      'brightness',
      serializers.serialize(object.brightness,
          specifiedType: const FullType(num)),
      'temperature',
      serializers.serialize(object.temperature,
          specifiedType: const FullType(num)),
      'ct',
      serializers.serialize(object.ct, specifiedType: const FullType(num)),
      'red',
      serializers.serialize(object.red, specifiedType: const FullType(num)),
      'green',
      serializers.serialize(object.green, specifiedType: const FullType(num)),
      'blue',
      serializers.serialize(object.blue, specifiedType: const FullType(num)),
    ];
    Object? value;
    value = object.xy;
    if (value != null) {
      result
        ..add('xy')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(num)])));
    }
    return result;
  }

  @override
  HueColor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HueColorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hue':
          result.hue = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'saturation':
          result.saturation = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'brightness':
          result.brightness = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'temperature':
          result.temperature = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'ct':
          result.ct = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'xy':
          result.xy.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(num)]))!
              as BuiltList<Object?>);
          break;
        case 'red':
          result.red = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'green':
          result.green = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'blue':
          result.blue = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
      }
    }

    return result.build();
  }
}

class _$HueColor extends HueColor {
  @override
  final num hue;
  @override
  final num saturation;
  @override
  final num brightness;
  @override
  final num temperature;
  @override
  final num ct;
  @override
  final BuiltList<num>? xy;
  @override
  final num red;
  @override
  final num green;
  @override
  final num blue;

  factory _$HueColor([void Function(HueColorBuilder)? updates]) =>
      (new HueColorBuilder()..update(updates)).build();

  _$HueColor._(
      {required this.hue,
      required this.saturation,
      required this.brightness,
      required this.temperature,
      required this.ct,
      this.xy,
      required this.red,
      required this.green,
      required this.blue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(hue, 'HueColor', 'hue');
    BuiltValueNullFieldError.checkNotNull(saturation, 'HueColor', 'saturation');
    BuiltValueNullFieldError.checkNotNull(brightness, 'HueColor', 'brightness');
    BuiltValueNullFieldError.checkNotNull(
        temperature, 'HueColor', 'temperature');
    BuiltValueNullFieldError.checkNotNull(ct, 'HueColor', 'ct');
    BuiltValueNullFieldError.checkNotNull(red, 'HueColor', 'red');
    BuiltValueNullFieldError.checkNotNull(green, 'HueColor', 'green');
    BuiltValueNullFieldError.checkNotNull(blue, 'HueColor', 'blue');
  }

  @override
  HueColor rebuild(void Function(HueColorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HueColorBuilder toBuilder() => new HueColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HueColor &&
        hue == other.hue &&
        saturation == other.saturation &&
        brightness == other.brightness &&
        temperature == other.temperature &&
        ct == other.ct &&
        xy == other.xy &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, hue.hashCode), saturation.hashCode),
                                brightness.hashCode),
                            temperature.hashCode),
                        ct.hashCode),
                    xy.hashCode),
                red.hashCode),
            green.hashCode),
        blue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HueColor')
          ..add('hue', hue)
          ..add('saturation', saturation)
          ..add('brightness', brightness)
          ..add('temperature', temperature)
          ..add('ct', ct)
          ..add('xy', xy)
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class HueColorBuilder implements Builder<HueColor, HueColorBuilder> {
  _$HueColor? _$v;

  num? _hue;
  num? get hue => _$this._hue;
  set hue(num? hue) => _$this._hue = hue;

  num? _saturation;
  num? get saturation => _$this._saturation;
  set saturation(num? saturation) => _$this._saturation = saturation;

  num? _brightness;
  num? get brightness => _$this._brightness;
  set brightness(num? brightness) => _$this._brightness = brightness;

  num? _temperature;
  num? get temperature => _$this._temperature;
  set temperature(num? temperature) => _$this._temperature = temperature;

  num? _ct;
  num? get ct => _$this._ct;
  set ct(num? ct) => _$this._ct = ct;

  ListBuilder<num>? _xy;
  ListBuilder<num> get xy => _$this._xy ??= new ListBuilder<num>();
  set xy(ListBuilder<num>? xy) => _$this._xy = xy;

  num? _red;
  num? get red => _$this._red;
  set red(num? red) => _$this._red = red;

  num? _green;
  num? get green => _$this._green;
  set green(num? green) => _$this._green = green;

  num? _blue;
  num? get blue => _$this._blue;
  set blue(num? blue) => _$this._blue = blue;

  HueColorBuilder();

  HueColorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hue = $v.hue;
      _saturation = $v.saturation;
      _brightness = $v.brightness;
      _temperature = $v.temperature;
      _ct = $v.ct;
      _xy = $v.xy?.toBuilder();
      _red = $v.red;
      _green = $v.green;
      _blue = $v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HueColor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HueColor;
  }

  @override
  void update(void Function(HueColorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HueColor build() {
    _$HueColor _$result;
    try {
      _$result = _$v ??
          new _$HueColor._(
              hue:
                  BuiltValueNullFieldError.checkNotNull(hue, 'HueColor', 'hue'),
              saturation: BuiltValueNullFieldError.checkNotNull(
                  saturation, 'HueColor', 'saturation'),
              brightness: BuiltValueNullFieldError.checkNotNull(
                  brightness, 'HueColor', 'brightness'),
              temperature: BuiltValueNullFieldError.checkNotNull(
                  temperature, 'HueColor', 'temperature'),
              ct: BuiltValueNullFieldError.checkNotNull(ct, 'HueColor', 'ct'),
              xy: _xy?.build(),
              red:
                  BuiltValueNullFieldError.checkNotNull(red, 'HueColor', 'red'),
              green: BuiltValueNullFieldError.checkNotNull(
                  green, 'HueColor', 'green'),
              blue: BuiltValueNullFieldError.checkNotNull(
                  blue, 'HueColor', 'blue'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'xy';
        _xy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HueColor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

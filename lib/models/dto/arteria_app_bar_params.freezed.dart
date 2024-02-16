// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arteria_app_bar_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArteriaAppBarParams {
  String get title => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) home,
    required TResult Function(String title) favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? home,
    TResult? Function(String title)? favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? home,
    TResult Function(String title)? favorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeParams value) home,
    required TResult Function(FavoriteParams value) favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeParams value)? home,
    TResult? Function(FavoriteParams value)? favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeParams value)? home,
    TResult Function(FavoriteParams value)? favorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArteriaAppBarParamsCopyWith<ArteriaAppBarParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArteriaAppBarParamsCopyWith<$Res> {
  factory $ArteriaAppBarParamsCopyWith(
          ArteriaAppBarParams value, $Res Function(ArteriaAppBarParams) then) =
      _$ArteriaAppBarParamsCopyWithImpl<$Res, ArteriaAppBarParams>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$ArteriaAppBarParamsCopyWithImpl<$Res, $Val extends ArteriaAppBarParams>
    implements $ArteriaAppBarParamsCopyWith<$Res> {
  _$ArteriaAppBarParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeParamsImplCopyWith<$Res>
    implements $ArteriaAppBarParamsCopyWith<$Res> {
  factory _$$HomeParamsImplCopyWith(
          _$HomeParamsImpl value, $Res Function(_$HomeParamsImpl) then) =
      __$$HomeParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$HomeParamsImplCopyWithImpl<$Res>
    extends _$ArteriaAppBarParamsCopyWithImpl<$Res, _$HomeParamsImpl>
    implements _$$HomeParamsImplCopyWith<$Res> {
  __$$HomeParamsImplCopyWithImpl(
      _$HomeParamsImpl _value, $Res Function(_$HomeParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$HomeParamsImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeParamsImpl implements HomeParams {
  const _$HomeParamsImpl(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'ArteriaAppBarParams.home(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeParamsImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeParamsImplCopyWith<_$HomeParamsImpl> get copyWith =>
      __$$HomeParamsImplCopyWithImpl<_$HomeParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) home,
    required TResult Function(String title) favorite,
  }) {
    return home(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? home,
    TResult? Function(String title)? favorite,
  }) {
    return home?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? home,
    TResult Function(String title)? favorite,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeParams value) home,
    required TResult Function(FavoriteParams value) favorite,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeParams value)? home,
    TResult? Function(FavoriteParams value)? favorite,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeParams value)? home,
    TResult Function(FavoriteParams value)? favorite,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class HomeParams implements ArteriaAppBarParams {
  const factory HomeParams(final String title) = _$HomeParamsImpl;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$HomeParamsImplCopyWith<_$HomeParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteParamsImplCopyWith<$Res>
    implements $ArteriaAppBarParamsCopyWith<$Res> {
  factory _$$FavoriteParamsImplCopyWith(_$FavoriteParamsImpl value,
          $Res Function(_$FavoriteParamsImpl) then) =
      __$$FavoriteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$FavoriteParamsImplCopyWithImpl<$Res>
    extends _$ArteriaAppBarParamsCopyWithImpl<$Res, _$FavoriteParamsImpl>
    implements _$$FavoriteParamsImplCopyWith<$Res> {
  __$$FavoriteParamsImplCopyWithImpl(
      _$FavoriteParamsImpl _value, $Res Function(_$FavoriteParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$FavoriteParamsImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteParamsImpl implements FavoriteParams {
  const _$FavoriteParamsImpl(this.title);

  @override
  final String title;

  @override
  String toString() {
    return 'ArteriaAppBarParams.favorite(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteParamsImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteParamsImplCopyWith<_$FavoriteParamsImpl> get copyWith =>
      __$$FavoriteParamsImplCopyWithImpl<_$FavoriteParamsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) home,
    required TResult Function(String title) favorite,
  }) {
    return favorite(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? home,
    TResult? Function(String title)? favorite,
  }) {
    return favorite?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? home,
    TResult Function(String title)? favorite,
    required TResult orElse(),
  }) {
    if (favorite != null) {
      return favorite(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeParams value) home,
    required TResult Function(FavoriteParams value) favorite,
  }) {
    return favorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeParams value)? home,
    TResult? Function(FavoriteParams value)? favorite,
  }) {
    return favorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeParams value)? home,
    TResult Function(FavoriteParams value)? favorite,
    required TResult orElse(),
  }) {
    if (favorite != null) {
      return favorite(this);
    }
    return orElse();
  }
}

abstract class FavoriteParams implements ArteriaAppBarParams {
  const factory FavoriteParams(final String title) = _$FavoriteParamsImpl;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteParamsImplCopyWith<_$FavoriteParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

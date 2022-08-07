import 'package:json_annotation/json_annotation.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Input$FinishPomodoroInput {
  Input$FinishPomodoroInput(
      {required this.id, required this.name, required this.duration});

  @override
  factory Input$FinishPomodoroInput.fromJson(Map<String, dynamic> json) =>
      _$Input$FinishPomodoroInputFromJson(json);

  final String id;

  final String name;

  final int duration;

  Map<String, dynamic> toJson() => _$Input$FinishPomodoroInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$duration = duration;
    return Object.hashAll([l$id, l$name, l$duration]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$FinishPomodoroInput) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) return false;
    return true;
  }

  CopyWith$Input$FinishPomodoroInput<Input$FinishPomodoroInput> get copyWith =>
      CopyWith$Input$FinishPomodoroInput(this, (i) => i);
}

abstract class CopyWith$Input$FinishPomodoroInput<TRes> {
  factory CopyWith$Input$FinishPomodoroInput(Input$FinishPomodoroInput instance,
          TRes Function(Input$FinishPomodoroInput) then) =
      _CopyWithImpl$Input$FinishPomodoroInput;

  factory CopyWith$Input$FinishPomodoroInput.stub(TRes res) =
      _CopyWithStubImpl$Input$FinishPomodoroInput;

  TRes call({String? id, String? name, int? duration});
}

class _CopyWithImpl$Input$FinishPomodoroInput<TRes>
    implements CopyWith$Input$FinishPomodoroInput<TRes> {
  _CopyWithImpl$Input$FinishPomodoroInput(this._instance, this._then);

  final Input$FinishPomodoroInput _instance;

  final TRes Function(Input$FinishPomodoroInput) _then;

  static const _undefined = {};

  TRes call(
          {Object? id = _undefined,
          Object? name = _undefined,
          Object? duration = _undefined}) =>
      _then(Input$FinishPomodoroInput(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          duration: duration == _undefined || duration == null
              ? _instance.duration
              : (duration as int)));
}

class _CopyWithStubImpl$Input$FinishPomodoroInput<TRes>
    implements CopyWith$Input$FinishPomodoroInput<TRes> {
  _CopyWithStubImpl$Input$FinishPomodoroInput(this._res);

  TRes _res;

  call({String? id, String? name, int? duration}) => _res;
}

const possibleTypesMap = {};

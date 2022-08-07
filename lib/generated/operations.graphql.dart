import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
import 'schema.graphql.dart';
part 'operations.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$pomodoro {
  Fragment$pomodoro(
      {required this.id,
      required this.name,
      required this.duration,
      required this.$__typename});

  @override
  factory Fragment$pomodoro.fromJson(Map<String, dynamic> json) =>
      _$Fragment$pomodoroFromJson(json);

  final String id;

  final String name;

  final int duration;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$pomodoroToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$duration = duration;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$duration, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$pomodoro) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$duration = duration;
    final lOther$duration = other.duration;
    if (l$duration != lOther$duration) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$pomodoro on Fragment$pomodoro {
  CopyWith$Fragment$pomodoro<Fragment$pomodoro> get copyWith =>
      CopyWith$Fragment$pomodoro(this, (i) => i);
}

abstract class CopyWith$Fragment$pomodoro<TRes> {
  factory CopyWith$Fragment$pomodoro(
          Fragment$pomodoro instance, TRes Function(Fragment$pomodoro) then) =
      _CopyWithImpl$Fragment$pomodoro;

  factory CopyWith$Fragment$pomodoro.stub(TRes res) =
      _CopyWithStubImpl$Fragment$pomodoro;

  TRes call({String? id, String? name, int? duration, String? $__typename});
}

class _CopyWithImpl$Fragment$pomodoro<TRes>
    implements CopyWith$Fragment$pomodoro<TRes> {
  _CopyWithImpl$Fragment$pomodoro(this._instance, this._then);

  final Fragment$pomodoro _instance;

  final TRes Function(Fragment$pomodoro) _then;

  static const _undefined = {};

  TRes call(
          {Object? id = _undefined,
          Object? name = _undefined,
          Object? duration = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$pomodoro(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          duration: duration == _undefined || duration == null
              ? _instance.duration
              : (duration as int),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$pomodoro<TRes>
    implements CopyWith$Fragment$pomodoro<TRes> {
  _CopyWithStubImpl$Fragment$pomodoro(this._res);

  TRes _res;

  call({String? id, String? name, int? duration, String? $__typename}) => _res;
}

const fragmentDefinitionpomodoro = FragmentDefinitionNode(
    name: NameNode(value: 'pomodoro'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(name: NameNode(value: 'Pomodoro'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'duration'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentpomodoro = DocumentNode(definitions: [
  fragmentDefinitionpomodoro,
]);

extension ClientExtension$Fragment$pomodoro on graphql.GraphQLClient {
  void writeFragment$pomodoro(
          {required Fragment$pomodoro data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'pomodoro',
                  document: documentNodeFragmentpomodoro)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$pomodoro? readFragment$pomodoro(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'pomodoro',
                document: documentNodeFragmentpomodoro)),
        optimistic: optimistic);
    return result == null ? null : Fragment$pomodoro.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Query$getPomodoros {
  Query$getPomodoros({required this.pomodoros, required this.$__typename});

  @override
  factory Query$getPomodoros.fromJson(Map<String, dynamic> json) =>
      _$Query$getPomodorosFromJson(json);

  final List<Fragment$pomodoro> pomodoros;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$getPomodorosToJson(this);
  int get hashCode {
    final l$pomodoros = pomodoros;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$pomodoros.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$getPomodoros) || runtimeType != other.runtimeType)
      return false;
    final l$pomodoros = pomodoros;
    final lOther$pomodoros = other.pomodoros;
    if (l$pomodoros.length != lOther$pomodoros.length) return false;
    for (int i = 0; i < l$pomodoros.length; i++) {
      final l$pomodoros$entry = l$pomodoros[i];
      final lOther$pomodoros$entry = lOther$pomodoros[i];
      if (l$pomodoros$entry != lOther$pomodoros$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$getPomodoros on Query$getPomodoros {
  CopyWith$Query$getPomodoros<Query$getPomodoros> get copyWith =>
      CopyWith$Query$getPomodoros(this, (i) => i);
}

abstract class CopyWith$Query$getPomodoros<TRes> {
  factory CopyWith$Query$getPomodoros(
          Query$getPomodoros instance, TRes Function(Query$getPomodoros) then) =
      _CopyWithImpl$Query$getPomodoros;

  factory CopyWith$Query$getPomodoros.stub(TRes res) =
      _CopyWithStubImpl$Query$getPomodoros;

  TRes call({List<Fragment$pomodoro>? pomodoros, String? $__typename});
  TRes pomodoros(
      Iterable<Fragment$pomodoro> Function(
              Iterable<CopyWith$Fragment$pomodoro<Fragment$pomodoro>>)
          _fn);
}

class _CopyWithImpl$Query$getPomodoros<TRes>
    implements CopyWith$Query$getPomodoros<TRes> {
  _CopyWithImpl$Query$getPomodoros(this._instance, this._then);

  final Query$getPomodoros _instance;

  final TRes Function(Query$getPomodoros) _then;

  static const _undefined = {};

  TRes call(
          {Object? pomodoros = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$getPomodoros(
          pomodoros: pomodoros == _undefined || pomodoros == null
              ? _instance.pomodoros
              : (pomodoros as List<Fragment$pomodoro>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes pomodoros(
          Iterable<Fragment$pomodoro> Function(
                  Iterable<CopyWith$Fragment$pomodoro<Fragment$pomodoro>>)
              _fn) =>
      call(
          pomodoros: _fn(_instance.pomodoros
              .map((e) => CopyWith$Fragment$pomodoro(e, (i) => i))).toList());
}

class _CopyWithStubImpl$Query$getPomodoros<TRes>
    implements CopyWith$Query$getPomodoros<TRes> {
  _CopyWithStubImpl$Query$getPomodoros(this._res);

  TRes _res;

  call({List<Fragment$pomodoro>? pomodoros, String? $__typename}) => _res;
  pomodoros(_fn) => _res;
}

const documentNodeQuerygetPomodoros = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getPomodoros'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'pomodoros'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'pomodoro'), directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionpomodoro,
]);
Query$getPomodoros _parserFn$Query$getPomodoros(Map<String, dynamic> data) =>
    Query$getPomodoros.fromJson(data);

class Options$Query$getPomodoros
    extends graphql.QueryOptions<Query$getPomodoros> {
  Options$Query$getPomodoros(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: documentNodeQuerygetPomodoros,
            parserFn: _parserFn$Query$getPomodoros);
}

class WatchOptions$Query$getPomodoros
    extends graphql.WatchQueryOptions<Query$getPomodoros> {
  WatchOptions$Query$getPomodoros(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeQuerygetPomodoros,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$getPomodoros);
}

class FetchMoreOptions$Query$getPomodoros extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getPomodoros(
      {required graphql.UpdateQuery updateQuery})
      : super(
            updateQuery: updateQuery, document: documentNodeQuerygetPomodoros);
}

extension ClientExtension$Query$getPomodoros on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getPomodoros>> query$getPomodoros(
          [Options$Query$getPomodoros? options]) async =>
      await this.query(options ?? Options$Query$getPomodoros());
  graphql.ObservableQuery<Query$getPomodoros> watchQuery$getPomodoros(
          [WatchOptions$Query$getPomodoros? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$getPomodoros());
  void writeQuery$getPomodoros(
          {required Query$getPomodoros data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: documentNodeQuerygetPomodoros)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$getPomodoros? readQuery$getPomodoros({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQuerygetPomodoros)),
        optimistic: optimistic);
    return result == null ? null : Query$getPomodoros.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getPomodoros> useQuery$getPomodoros(
        [Options$Query$getPomodoros? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$getPomodoros());
graphql.ObservableQuery<Query$getPomodoros> useWatchQuery$getPomodoros(
        [WatchOptions$Query$getPomodoros? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$getPomodoros());

class Query$getPomodoros$Widget
    extends graphql_flutter.Query<Query$getPomodoros> {
  Query$getPomodoros$Widget(
      {widgets.Key? key,
      Options$Query$getPomodoros? options,
      required graphql_flutter.QueryBuilder<Query$getPomodoros> builder})
      : super(
            key: key,
            options: options ?? Options$Query$getPomodoros(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$finishPomodoro {
  Variables$Mutation$finishPomodoro({this.input});

  @override
  factory Variables$Mutation$finishPomodoro.fromJson(
          Map<String, dynamic> json) =>
      _$Variables$Mutation$finishPomodoroFromJson(json);

  final Input$FinishPomodoroInput? input;

  Map<String, dynamic> toJson() =>
      _$Variables$Mutation$finishPomodoroToJson(this);
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$finishPomodoro) ||
        runtimeType != other.runtimeType) return false;
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) return false;
    return true;
  }

  CopyWith$Variables$Mutation$finishPomodoro<Variables$Mutation$finishPomodoro>
      get copyWith =>
          CopyWith$Variables$Mutation$finishPomodoro(this, (i) => i);
}

abstract class CopyWith$Variables$Mutation$finishPomodoro<TRes> {
  factory CopyWith$Variables$Mutation$finishPomodoro(
          Variables$Mutation$finishPomodoro instance,
          TRes Function(Variables$Mutation$finishPomodoro) then) =
      _CopyWithImpl$Variables$Mutation$finishPomodoro;

  factory CopyWith$Variables$Mutation$finishPomodoro.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$finishPomodoro;

  TRes call({Input$FinishPomodoroInput? input});
}

class _CopyWithImpl$Variables$Mutation$finishPomodoro<TRes>
    implements CopyWith$Variables$Mutation$finishPomodoro<TRes> {
  _CopyWithImpl$Variables$Mutation$finishPomodoro(this._instance, this._then);

  final Variables$Mutation$finishPomodoro _instance;

  final TRes Function(Variables$Mutation$finishPomodoro) _then;

  static const _undefined = {};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$finishPomodoro(
          input: input == _undefined
              ? _instance.input
              : (input as Input$FinishPomodoroInput?)));
}

class _CopyWithStubImpl$Variables$Mutation$finishPomodoro<TRes>
    implements CopyWith$Variables$Mutation$finishPomodoro<TRes> {
  _CopyWithStubImpl$Variables$Mutation$finishPomodoro(this._res);

  TRes _res;

  call({Input$FinishPomodoroInput? input}) => _res;
}

@JsonSerializable(explicitToJson: true)
class Mutation$finishPomodoro {
  Mutation$finishPomodoro(
      {required this.finishPomodoro, required this.$__typename});

  @override
  factory Mutation$finishPomodoro.fromJson(Map<String, dynamic> json) =>
      _$Mutation$finishPomodoroFromJson(json);

  final Fragment$pomodoro finishPomodoro;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$finishPomodoroToJson(this);
  int get hashCode {
    final l$finishPomodoro = finishPomodoro;
    final l$$__typename = $__typename;
    return Object.hashAll([l$finishPomodoro, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$finishPomodoro) || runtimeType != other.runtimeType)
      return false;
    final l$finishPomodoro = finishPomodoro;
    final lOther$finishPomodoro = other.finishPomodoro;
    if (l$finishPomodoro != lOther$finishPomodoro) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$finishPomodoro on Mutation$finishPomodoro {
  CopyWith$Mutation$finishPomodoro<Mutation$finishPomodoro> get copyWith =>
      CopyWith$Mutation$finishPomodoro(this, (i) => i);
}

abstract class CopyWith$Mutation$finishPomodoro<TRes> {
  factory CopyWith$Mutation$finishPomodoro(Mutation$finishPomodoro instance,
          TRes Function(Mutation$finishPomodoro) then) =
      _CopyWithImpl$Mutation$finishPomodoro;

  factory CopyWith$Mutation$finishPomodoro.stub(TRes res) =
      _CopyWithStubImpl$Mutation$finishPomodoro;

  TRes call({Fragment$pomodoro? finishPomodoro, String? $__typename});
  CopyWith$Fragment$pomodoro<TRes> get finishPomodoro;
}

class _CopyWithImpl$Mutation$finishPomodoro<TRes>
    implements CopyWith$Mutation$finishPomodoro<TRes> {
  _CopyWithImpl$Mutation$finishPomodoro(this._instance, this._then);

  final Mutation$finishPomodoro _instance;

  final TRes Function(Mutation$finishPomodoro) _then;

  static const _undefined = {};

  TRes call(
          {Object? finishPomodoro = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Mutation$finishPomodoro(
          finishPomodoro: finishPomodoro == _undefined || finishPomodoro == null
              ? _instance.finishPomodoro
              : (finishPomodoro as Fragment$pomodoro),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Fragment$pomodoro<TRes> get finishPomodoro {
    final local$finishPomodoro = _instance.finishPomodoro;
    return CopyWith$Fragment$pomodoro(
        local$finishPomodoro, (e) => call(finishPomodoro: e));
  }
}

class _CopyWithStubImpl$Mutation$finishPomodoro<TRes>
    implements CopyWith$Mutation$finishPomodoro<TRes> {
  _CopyWithStubImpl$Mutation$finishPomodoro(this._res);

  TRes _res;

  call({Fragment$pomodoro? finishPomodoro, String? $__typename}) => _res;
  CopyWith$Fragment$pomodoro<TRes> get finishPomodoro =>
      CopyWith$Fragment$pomodoro.stub(_res);
}

const documentNodeMutationfinishPomodoro = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'finishPomodoro'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'input')),
            type: NamedTypeNode(
                name: NameNode(value: 'FinishPomodoroInput'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'finishPomodoro'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'input'),
                  value: VariableNode(name: NameNode(value: 'input')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'pomodoro'), directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionpomodoro,
]);
Mutation$finishPomodoro _parserFn$Mutation$finishPomodoro(
        Map<String, dynamic> data) =>
    Mutation$finishPomodoro.fromJson(data);
typedef OnMutationCompleted$Mutation$finishPomodoro = FutureOr<void> Function(
    dynamic, Mutation$finishPomodoro?);

class Options$Mutation$finishPomodoro
    extends graphql.MutationOptions<Mutation$finishPomodoro> {
  Options$Mutation$finishPomodoro(
      {String? operationName,
      Variables$Mutation$finishPomodoro? variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$finishPomodoro? onCompleted,
      graphql.OnMutationUpdate<Mutation$finishPomodoro>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            variables: variables?.toJson() ?? {},
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$finishPomodoro(data)),
            update: update,
            onError: onError,
            document: documentNodeMutationfinishPomodoro,
            parserFn: _parserFn$Mutation$finishPomodoro);

  final OnMutationCompleted$Mutation$finishPomodoro? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$finishPomodoro
    extends graphql.WatchQueryOptions<Mutation$finishPomodoro> {
  WatchOptions$Mutation$finishPomodoro(
      {String? operationName,
      Variables$Mutation$finishPomodoro? variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            variables: variables?.toJson() ?? {},
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeMutationfinishPomodoro,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$finishPomodoro);
}

extension ClientExtension$Mutation$finishPomodoro on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$finishPomodoro>> mutate$finishPomodoro(
          [Options$Mutation$finishPomodoro? options]) async =>
      await this.mutate(options ?? Options$Mutation$finishPomodoro());
  graphql.ObservableQuery<Mutation$finishPomodoro> watchMutation$finishPomodoro(
          [WatchOptions$Mutation$finishPomodoro? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$finishPomodoro());
}

class Mutation$finishPomodoro$HookResult {
  Mutation$finishPomodoro$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$finishPomodoro runMutation;

  final graphql.QueryResult<Mutation$finishPomodoro> result;
}

Mutation$finishPomodoro$HookResult useMutation$finishPomodoro(
    [WidgetOptions$Mutation$finishPomodoro? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$finishPomodoro());
  return Mutation$finishPomodoro$HookResult(
    ({variables, optimisticResult}) => result.runMutation(
      variables?.toJson() ?? const {},
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$finishPomodoro>
    useWatchMutation$finishPomodoro(
            [WatchOptions$Mutation$finishPomodoro? options]) =>
        graphql_flutter.useWatchMutation(
            options ?? WatchOptions$Mutation$finishPomodoro());

class WidgetOptions$Mutation$finishPomodoro
    extends graphql.MutationOptions<Mutation$finishPomodoro> {
  WidgetOptions$Mutation$finishPomodoro(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$finishPomodoro? onCompleted,
      graphql.OnMutationUpdate<Mutation$finishPomodoro>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$finishPomodoro(data)),
            update: update,
            onError: onError,
            document: documentNodeMutationfinishPomodoro,
            parserFn: _parserFn$Mutation$finishPomodoro);

  final OnMutationCompleted$Mutation$finishPomodoro? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$finishPomodoro
    = graphql.MultiSourceResult<Mutation$finishPomodoro> Function(
        {Variables$Mutation$finishPomodoro? variables,
        Object? optimisticResult});
typedef Builder$Mutation$finishPomodoro = widgets.Widget Function(
    RunMutation$Mutation$finishPomodoro,
    graphql.QueryResult<Mutation$finishPomodoro>?);

class Mutation$finishPomodoro$Widget
    extends graphql_flutter.Mutation<Mutation$finishPomodoro> {
  Mutation$finishPomodoro$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$finishPomodoro? options,
      required Builder$Mutation$finishPomodoro builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$finishPomodoro(),
            builder: (run, result) => builder(
                ({variables, optimisticResult}) => run(
                    variables?.toJson() ?? const {},
                    optimisticResult: optimisticResult),
                result));
}

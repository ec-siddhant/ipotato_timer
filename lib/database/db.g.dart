// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TimersTableData extends DataClass implements Insertable<TimersTableData> {
  final String title;
  final String description;
  final int timeLeft;
  final bool finished;
  const TimersTableData(
      {required this.title,
      required this.description,
      required this.timeLeft,
      required this.finished});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['time_left'] = Variable<int>(timeLeft);
    map['finished'] = Variable<bool>(finished);
    return map;
  }

  TimersTableCompanion toCompanion(bool nullToAbsent) {
    return TimersTableCompanion(
      title: Value(title),
      description: Value(description),
      timeLeft: Value(timeLeft),
      finished: Value(finished),
    );
  }

  factory TimersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimersTableData(
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      timeLeft: serializer.fromJson<int>(json['timeLeft']),
      finished: serializer.fromJson<bool>(json['finished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'timeLeft': serializer.toJson<int>(timeLeft),
      'finished': serializer.toJson<bool>(finished),
    };
  }

  TimersTableData copyWith(
          {String? title,
          String? description,
          int? timeLeft,
          bool? finished}) =>
      TimersTableData(
        title: title ?? this.title,
        description: description ?? this.description,
        timeLeft: timeLeft ?? this.timeLeft,
        finished: finished ?? this.finished,
      );
  @override
  String toString() {
    return (StringBuffer('TimersTableData(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timeLeft: $timeLeft, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, description, timeLeft, finished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimersTableData &&
          other.title == this.title &&
          other.description == this.description &&
          other.timeLeft == this.timeLeft &&
          other.finished == this.finished);
}

class TimersTableCompanion extends UpdateCompanion<TimersTableData> {
  final Value<String> title;
  final Value<String> description;
  final Value<int> timeLeft;
  final Value<bool> finished;
  const TimersTableCompanion({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.timeLeft = const Value.absent(),
    this.finished = const Value.absent(),
  });
  TimersTableCompanion.insert({
    required String title,
    required String description,
    required int timeLeft,
    required bool finished,
  })  : title = Value(title),
        description = Value(description),
        timeLeft = Value(timeLeft),
        finished = Value(finished);
  static Insertable<TimersTableData> custom({
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? timeLeft,
    Expression<bool>? finished,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (timeLeft != null) 'time_left': timeLeft,
      if (finished != null) 'finished': finished,
    });
  }

  TimersTableCompanion copyWith(
      {Value<String>? title,
      Value<String>? description,
      Value<int>? timeLeft,
      Value<bool>? finished}) {
    return TimersTableCompanion(
      title: title ?? this.title,
      description: description ?? this.description,
      timeLeft: timeLeft ?? this.timeLeft,
      finished: finished ?? this.finished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timeLeft.present) {
      map['time_left'] = Variable<int>(timeLeft.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimersTableCompanion(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timeLeft: $timeLeft, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }
}

class $TimersTableTable extends TimersTable
    with TableInfo<$TimersTableTable, TimersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimersTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _timeLeftMeta = const VerificationMeta('timeLeft');
  @override
  late final GeneratedColumn<int> timeLeft = GeneratedColumn<int>(
      'time_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _finishedMeta = const VerificationMeta('finished');
  @override
  late final GeneratedColumn<bool> finished = GeneratedColumn<bool>(
      'finished', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("finished" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [title, description, timeLeft, finished];
  @override
  String get aliasedName => _alias ?? 'timers_table';
  @override
  String get actualTableName => 'timers_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time_left')) {
      context.handle(_timeLeftMeta,
          timeLeft.isAcceptableOrUnknown(data['time_left']!, _timeLeftMeta));
    } else if (isInserting) {
      context.missing(_timeLeftMeta);
    }
    if (data.containsKey('finished')) {
      context.handle(_finishedMeta,
          finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta));
    } else if (isInserting) {
      context.missing(_finishedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TimersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimersTableData(
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      timeLeft: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}time_left'])!,
      finished: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}finished'])!,
    );
  }

  @override
  $TimersTableTable createAlias(String alias) {
    return $TimersTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyTimerDatabase extends GeneratedDatabase {
  _$MyTimerDatabase(QueryExecutor e) : super(e);
  late final $TimersTableTable timersTable = $TimersTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timersTable];
}

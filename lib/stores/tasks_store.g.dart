// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on _TasksStore, Store {
  late final _$taskListAtom =
      Atom(name: '_TasksStore.taskList', context: context);

  @override
  ObservableList<TaskModel> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<TaskModel> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$_TasksStoreActionController =
      ActionController(name: '_TasksStore', context: context);

  @override
  dynamic addTask(TaskModel taskModel) {
    final _$actionInfo =
        _$_TasksStoreActionController.startAction(name: '_TasksStore.addTask');
    try {
      return super.addTask(taskModel);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reduceTaskTime({required int index}) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.reduceTaskTime');
    try {
      return super.reduceTaskTime(index: index);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTaskAsComplete({required int index}) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.setTaskAsComplete');
    try {
      return super.setTaskAsComplete(index: index);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList}
    ''';
  }
}

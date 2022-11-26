// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TimersStore on _TimersStore, Store {
  late final _$taskListAtom =
      Atom(name: '_TimersStore.taskList', context: context);

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

  late final _$_TimersStoreActionController =
      ActionController(name: '_TimersStore', context: context);

  @override
  dynamic addTask(TaskModel taskModel) {
    final _$actionInfo = _$_TimersStoreActionController.startAction(
        name: '_TimersStore.addTask');
    try {
      return super.addTask(taskModel);
    } finally {
      _$_TimersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reduceTaskTime({required int index}) {
    final _$actionInfo = _$_TimersStoreActionController.startAction(
        name: '_TimersStore.reduceTaskTime');
    try {
      return super.reduceTaskTime(index: index);
    } finally {
      _$_TimersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTaskAsComplete({required int index}) {
    final _$actionInfo = _$_TimersStoreActionController.startAction(
        name: '_TimersStore.setTaskAsComplete');
    try {
      return super.setTaskAsComplete(index: index);
    } finally {
      _$_TimersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList}
    ''';
  }
}

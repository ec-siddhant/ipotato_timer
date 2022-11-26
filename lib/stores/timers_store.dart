import 'dart:async';

import 'package:flutter_beep/flutter_beep.dart';
import 'package:ipotato_timer/database/db.dart';
import 'package:ipotato_timer/models/task_model.dart';
import 'package:ipotato_timer/services/service.dart';
import 'package:mobx/mobx.dart';

part 'timers_store.g.dart';

// ignore: library_private_types_in_public_api
class TimersStore = _TimersStore with _$TimersStore;

abstract class _TimersStore with Store {
  @observable
  ObservableList<TaskModel> taskList = ObservableList<TaskModel>.of([]);

  final _taskDB = getIt<MyTaskDatabase>();

  @action
  addTask(TaskModel taskModel) {
    taskList.add(taskModel);
    _taskDB.insertTask(TasksTableData(
        id: taskModel.taskID,
        title: taskModel.taskName,
        description: taskModel.taskDescription,
        timeLeft: taskModel.taskDuration.inSeconds,
        finished: taskModel.taskComplete));
    sortList();
  }

  addAllTasks(List<dynamic> tableDataList) {
    for (var element in tableDataList) {
      taskList.add(TaskModel(
          taskID: element.id,
          taskName: element.title,
          taskDescription: element.description,
          taskComplete: element.finished,
          taskDuration: Duration(seconds: element.timeLeft),
          ownTimer: null));
      sortList();
    }
  }

  sortList() {
    taskList.sort((a, b) {
      if (b.taskComplete) {
        return 1;
      }
      return -1;
    });
    taskList = taskList;
  }

  @action
  reduceTaskTime({required int index}) {
    final currentTask = taskList[index];

    currentTask.ownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTask.taskDuration.inSeconds > 0) {
        currentTask.taskDuration =
            Duration(seconds: currentTask.taskDuration.inSeconds - 1);

        _taskDB.updateTask(taskList[index].taskID, currentTask);
      } else {
        currentTask.taskComplete = true;
        _taskDB.updateTask(currentTask.taskID, currentTask);
        playSound();
        timer.cancel();
      }
      sortList();
    });
  }

  @action
  setTaskAsComplete({required int index}) {
    if (taskList[index].ownTimer != null) taskList[index].ownTimer!.cancel();
    _taskDB.deleteTask(taskList[index].taskID);
    taskList.removeAt(index);
    sortList();
  }

  void playSound() {
    int times = 0;
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (times <= 7) {
        FlutterBeep.beep();
        times++;
      } else {
        timer.cancel();
      }
    });
  }
}

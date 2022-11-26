//counter.dart
import 'dart:async';

import 'package:flutter_beep/flutter_beep.dart';
import 'package:ipotato_timer/database/db.dart';
import 'package:ipotato_timer/models/task_model.dart';
import 'package:mobx/mobx.dart';

part 'timers_store.g.dart';

// ignore: library_private_types_in_public_api
class TimersStore = _TimersStore with _$TimersStore;

abstract class _TimersStore with Store {
  @observable
  ObservableList<TaskModel> taskList = ObservableList<TaskModel>.of([]);

  @action
  addTask(TaskModel taskModel) {
    taskList.add(taskModel);
    sortList();
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

    currentTask.ownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentTask.taskDuration.inSeconds > 0) {
        currentTask.taskDuration =
            Duration(seconds: currentTask.taskDuration.inSeconds - 1);
      } else {
        currentTask.taskComplete = true;
        playSound();
        timer.cancel();
      }
      sortList();
    });
  }

  @action
  setTaskAsComplete({required int index}) {
    taskList[index].ownTimer!.cancel();
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

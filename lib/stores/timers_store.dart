//counter.dart
import 'dart:async';

import 'package:flutter_beep/flutter_beep.dart';
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
  }

  @action
  reduceTaskTime({required int index}) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentTask = taskList[index];

      if (currentTask.taskDuration.inSeconds > 0) {
        currentTask.taskDuration =
            Duration(seconds: currentTask.taskDuration.inSeconds - 1);
        taskList = taskList;
      } else {
        setTaskAsComplete(index: index);
        timer.cancel();
      }
    });
  }

  @action
  setTaskAsComplete({required int index}) {
    final currentTask = taskList[index];
    if (currentTask.taskDuration.inSeconds <= 0) {
      playSound();
      currentTask.taskComplete = true;
    }else{
      currentTask.taskComplete = true;
    }
    taskList = taskList;
  }

  void playSound() {
    FlutterBeep.beep();
  }
}

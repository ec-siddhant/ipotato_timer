import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/models/task_model.dart';
import 'package:ipotato_timer/stores/tasks_store.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tasks_store_test.mocks.dart';

//Unfortunately this test is failing and I have no idea why

GetIt getIt = GetIt.instance;

@GenerateMocks([TasksStore])
void main() {
  late MockTasksStore tasksStore;

  getIt.registerLazySingleton(() => MockTasksStore());

  setUp(() => {tasksStore = GetIt.I<MockTasksStore>()});

  group('TaskStore Tests', () {
    test('Testing if addTask adds to TaskList', () async {
      when(tasksStore.taskList)
          .thenAnswer((_) => mobx.ObservableList<TaskModel>.of([]));

      when(tasksStore.addTask(TaskModel(
              taskID: "1",
              taskName: "Task 1",
              taskDescription: "Task Description",
              taskComplete: true,
              taskDuration: const Duration(seconds: 5),
              ownTimer: null)))
          .thenAnswer((_) async => true);


      expect(tasksStore.taskList.length, 1);
    });
  });
}

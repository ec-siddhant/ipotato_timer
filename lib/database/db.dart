import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:ipotato_timer/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'db.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class TasksTable extends Table {
  TextColumn get id => text().unique()();

  TextColumn get title => text().withLength(max: 32)();

  TextColumn get description => text()();

  IntColumn get timeLeft => integer()();

  BoolColumn get finished => boolean()();
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(path.join(dbFolder.path, "Tasks.sqlite"));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [TasksTable])
class MyTaskDatabase extends _$MyTaskDatabase {
  MyTaskDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //READ
  Future<List<dynamic>> getAllTasks() => select(tasksTable).get();

  //INSERT
  Future insertTask(TasksTableData task) => into(tasksTable).insert(task);

  //Update
  updateTask(String taskID, TaskModel taskModel) =>
      (update(tasksTable)..where((t) => t.id.equals(taskID))).write(
          TasksTableData(
              id: taskModel.taskID,
              title: taskModel.taskName,
              description: taskModel.taskDescription,
              timeLeft: taskModel.taskDuration.inSeconds,
              finished: taskModel.taskComplete));

  //Delete
  deleteTask(String taskID) {
    return (delete(tasksTable)..where((t) => t.id.equals(taskID))).go();
  }
}

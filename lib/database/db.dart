import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'db.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class TimersTable extends Table {
  TextColumn get title => text().withLength(max: 32)();
  TextColumn get description => text()();
  IntColumn get timeLeft => integer()();
  BoolColumn get finished => boolean()();

}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.

LazyDatabase _openConnection(){
  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(path.join(dbFolder.path, "timers.sqlite"));

    return NativeDatabase(file);

  });
}

@DriftDatabase(tables: [TimersTable])
class MyTimerDatabase extends _$MyTimerDatabase {
    MyTimerDatabase() : super(_openConnection());


  @override
  int get schemaVersion => 1;

  //READ
  Future<List<TimersTableData>> getAllTasks() => select(timersTable).get();
  //INSERT
  Future insertTask(TimersTableData task) => into(timersTable).insert(task);
  //Update
  Future updateTask(TimersTableData task) => update(timersTable).replace(task);
  //Delete
  Future deleteTask(TimersTableData task) => delete(timersTable).delete(task);

}
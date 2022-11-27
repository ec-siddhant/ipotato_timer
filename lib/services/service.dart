import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/database/db.dart';
import 'package:ipotato_timer/stores/timers_store.dart';

final getIt = GetIt.instance;

Future<void> initServices() async {
  getIt.registerLazySingleton<TasksStore>(() =>TasksStore());
  getIt.registerLazySingleton<MyTaskDatabase>(() =>MyTaskDatabase());

}
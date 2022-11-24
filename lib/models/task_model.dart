import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required final int index,
    required String taskName,
    required String taskDescription,
    required Duration taskDuration,
  }) = _TaskModel;

}
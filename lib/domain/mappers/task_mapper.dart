import 'package:tasknotes/utils/formatter.dart';
import '../../data/models/task_model.dart';
import '../../domain/entities/task_entity.dart';
import 'base/base_data_mapper.dart';

class TaskMapper extends BaseDataMapper<TaskModel, TaskEntity> {
  @override
  TaskEntity mapToEntity(TaskModel data) {
    return TaskEntity(
      id: data.id ?? -1,
      userId: data.userId ?? "",
      title: data.title ?? "",
      notes: data.notes ?? "",
      time: Formatter().stringToDate(data.time ?? "0000-01-01 00:00:00"),
      repetition: data.repetition ?? -1,
      status: (data.status ?? 0) == 1,
      createdAt:
          Formatter().stringToDate(data.createdAt ?? "0000-01-01 00:00:00"),
      updatedAt:
          Formatter().stringToDate(data.updatedAt ?? "0000-01-01 00:00:00"),
    );
  }

  @override
  TaskModel mapToModel(TaskEntity data) {
    return TaskModel(
      id: data.id,
      userId: data.userId,
      title: data.title,
      notes: data.notes,
      time: Formatter().dateToString(data.time),
      repetition: data.repetition,
      status: data.status ? 1 : 0,
      createdAt: Formatter().dateToString(data.createdAt),
      updatedAt: Formatter().dateToString(data.updatedAt),
    );
  }
}

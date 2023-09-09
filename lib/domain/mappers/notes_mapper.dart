import 'package:tasknotes/data/models/notes_model.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/utils/formatter.dart';
import 'base/base_data_mapper.dart';

class NotesMapper extends BaseDataMapper<NotesModel, NotesEntity> {
  @override
  NotesEntity mapToEntity(NotesModel data) {
    return NotesEntity(
      id: data.id ?? -1,
      userId: data.userId ?? "",
      text: data.text ?? "",
      isFavorite: (data.isFavorite ?? 0) == 1,
      createdAt:
      Formatter().stringToDate(data.createdAt ?? "0000-01-01 00:00:00"),
      updatedAt:
      Formatter().stringToDate(data.updatedAt ?? "0000-01-01 00:00:00"),
    );
  }

  @override
  NotesModel mapToModel(NotesEntity data) {
    return NotesModel(
      id: data.id,
      userId: data.userId,
      text: data.text,
      isFavorite: data.isFavorite ? 1 : 0,
      createdAt: Formatter().dateToString(data.createdAt),
      updatedAt: Formatter().dateToString(data.updatedAt),
    );
  }
}

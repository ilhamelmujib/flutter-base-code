import 'package:get/get.dart';

import '../../../../domain/entities/notes_entity.dart';
import '../../../../domain/usecase/notes/fetch_notes_use_case.dart';
import '../../../widgets/toast.dart';

class FavoriteNotesController extends GetxController {
  FavoriteNotesController(this._fetchNotesUseCase);

  final FetchNotesUseCase _fetchNotesUseCase;

  final RxList<NotesEntity> notes = RxList.empty();

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchNotes();
  }

  fetchNotes() async {
    final result = await _fetchNotesUseCase.execute();
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      notes.value = data;
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}

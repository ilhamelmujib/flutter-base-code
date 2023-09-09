import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/domain/usecase/notes/add_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/update_notes_use_case.dart';
import '../../../widgets/toast.dart';

class AddNotesController extends GetxController {
  AddNotesController(this._addNotesUseCase, this._updateNotesUseCase);

  final AddNotesUseCase _addNotesUseCase;
  final UpdateNotesUseCase _updateNotesUseCase;

  final box = GetStorage();

  final HtmlEditorController htmlEditorController = HtmlEditorController();
  final RxBool isFavorite = false.obs;

  onInitHtmlEditor(){
    if (Get.arguments != null) {
      final NotesEntity notes = Get.arguments;

      htmlEditorController.setText(notes.text);
      isFavorite.value = notes.isFavorite;
    }
  }

  addNotes() async {
    final text = await htmlEditorController.getText();
    if (text.isEmpty) {
      _showError("Please complete the data");
      return;
    }

    final data = NotesEntity(
      id: DateTime.now().microsecondsSinceEpoch,
      userId: box.read("id"),
      text: text,
      isFavorite: isFavorite.value,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    );
    final result = await _addNotesUseCase.execute(data);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Get.back(result: true);
      Toast.success(Get.context!, "Added!");
    });
  }

  updateNotes() async {
    final text = await htmlEditorController.getText();
    if (text.isEmpty) {
      _showError("Please complete the data");
      return;
    }
    final NotesEntity notes = Get.arguments;

    final data = NotesEntity(
      id: notes.id,
      userId: notes.userId,
      text: text,
      isFavorite: isFavorite.value,
      createdAt: notes.createdAt,
      updatedAt: DateTime.now(),
    );
    final result = await _updateNotesUseCase.execute(data);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Get.back(result: true);
      Toast.success(Get.context!, "Updated!");
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}


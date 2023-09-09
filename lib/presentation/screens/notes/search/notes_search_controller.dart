import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/domain/usecase/notes/fetch_notes_use_case.dart';
import '../../../widgets/toast.dart';

class NotesSearchController extends GetxController {
  NotesSearchController(this._fetchNotesUseCase);

  final FetchNotesUseCase _fetchNotesUseCase;
  final RxList<NotesEntity> notes = RxList.empty();
  final searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchNotes("");
  }

  fetchNotes(String keyword) async {
    final result = await _fetchNotesUseCase.execute();
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      notes.value = keyword.isEmpty
          ? RxList.empty()
          : data.where((element) => element.text.toLowerCase().contains(keyword.toLowerCase())).toList();
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tasknotes/presentation/screens/notes/add/add_notes_controller.dart';
import 'package:tasknotes/presentation/screens/notes/add/widgets/app_bar.dart';
import '../../../../app/app_colors.dart';
import '../../../widgets/scaffold.dart';

class AddNotesScreen extends GetView<AddNotesController> {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: NotesAppBar(context, controller),
      backgroundColor: AppColors.white,
      body: HtmlEditor(
        controller: controller.htmlEditorController,
        callbacks: Callbacks(
          onInit: (){
            controller.onInitHtmlEditor();
          }
        ),
        htmlEditorOptions: const HtmlEditorOptions(
          hint: "Your text here..." ,
        ),
        htmlToolbarOptions: const HtmlToolbarOptions(
          toolbarPosition:
              ToolbarPosition.belowEditor,
          defaultToolbarButtons: [
            ParagraphButtons(
              increaseIndent: false,
              decreaseIndent: false,
              textDirection: false,
              lineHeight: false,
              caseConverter: false,
            ),
            // ColorButtons(),
            FontButtons(
              subscript: false,
              superscript: false,
              clearAll: false,
            ),
            // ListButtons(),
            // InsertButtons(),
            // OtherButtons(),
          ],
        ),
        otherOptions: OtherOptions(height: MediaQuery.of(context).size.height),
      ),
    );
  }
}

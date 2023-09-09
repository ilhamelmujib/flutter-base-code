import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasknotes/app/app_sources.dart';
import 'package:tasknotes/presentation/screens/notes/search/notes_search_controller.dart';
import 'package:tasknotes/presentation/screens/notes/search/widgets/notes_item.dart';
import 'package:tasknotes/presentation/widgets/button.dart';
import 'package:tasknotes/presentation/widgets/card.dart';
import 'package:tasknotes/presentation/widgets/image.dart';
import 'package:tasknotes/presentation/widgets/text.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_pages.dart';
import '../../../widgets/form.dart';
import '../../../widgets/scaffold.dart';
import '../../../widgets/space.dart';

class NotesSearchScreen extends GetView<NotesSearchController> {
  const NotesSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: DefaultCard(
                      height: 50,
                      child: DefaultTextFormField(
                        autofocus: true,
                        controller: controller.searchController,
                        hint: "Search Notes",
                        onChanged: controller.fetchNotes,
                        textInputType: TextInputType.name,
                        prefixIcon: ImageSvg(
                          AppSources.icon("ic_search.svg"),
                          color: AppColors.gray,
                        ),
                        isBordered: false,
                      ),
                    ),
                  ),
                  const SpaceRow(10),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: DefaultText(
                        "Cancel",
                        color: AppColors.gray,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(() {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.notes.value.length,
                  itemBuilder: (context, index) {
                    return NotesItem(
                      notes: controller.notes.value[index],
                      onItemTap: (notes) async {
                        final result = await Get.toNamed(Routes.notesAdd,
                            arguments: controller.notes.value[index]);
                        if (result != null) {
                          await controller
                              .fetchNotes(controller.searchController.text);
                        }
                      },
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}

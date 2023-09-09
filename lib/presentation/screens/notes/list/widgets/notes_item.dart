import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../app/app_fonts.dart';
import '../../../../../app/app_sources.dart';
import '../../../../../domain/entities/notes_entity.dart';
import '../../../../../utils/formatter.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class NotesItem extends StatelessWidget {
  const NotesItem(
      {super.key,
      required this.notes,
      required this.time,
      required this.onItemTap});

  final NotesEntity notes;
  final String time;
  final Function(NotesEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    final parsedText = parse(notes.text);
    final paragraphs = parsedText.body?.children;

    String title = "";
    String description = "";

    if (paragraphs != null && paragraphs.isNotEmpty) {
      title = paragraphs[0].text;
      if (paragraphs.length > 1) {
        description = paragraphs.sublist(1).map((p) => p.text).join(' ');
      }
    }

    if(title.isEmpty){
      title = notes.text;
    }

    return DefaultCard(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: InkWell(
        onTap: () {
          onItemTap(notes);
        },
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      title,
                      fontFamily: FontFamily.interBold,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    if (description.trim().isNotEmpty)
                      DefaultText(
                        description.trim(),
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Row(
                children: [
                  notes.isFavorite
                      ? ImageSvg(AppSources.icon("ic_favorite.svg"))
                      : const SizedBox(),
                  const SizedBox(width: 10),
                  DefaultText(
                    time,
                    color: AppColors.gray,
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:tasknotes/app/app_fonts.dart';
import 'package:tasknotes/utils/formatter.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../app/app_sources.dart';
import '../../../../../domain/entities/notes_entity.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({
    super.key,
    required this.notes,
    this.topRadius = 0,
    this.bottomRadius = 0,
  });

  final NotesEntity notes;
  final double topRadius;
  final double bottomRadius;

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

    if (title.isEmpty) {
      title = notes.text;
    }
    return DefaultCard(
      margin: const EdgeInsets.only(left: 20, right: 20),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(topRadius),
        bottom: Radius.circular(bottomRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (topRadius == 0) const Divider(height: 1),
          Padding(
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
                    if (notes.isFavorite)
                      ImageSvg(AppSources.icon("ic_favorite.svg")),
                    const SizedBox(width: 10),
                    DefaultText(
                      Formatter()
                          .dateToString(notes.createdAt, format: "HH:mm"),
                      size: 12,
                      color: AppColors.gray,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

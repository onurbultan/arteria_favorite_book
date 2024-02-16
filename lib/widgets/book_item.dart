import 'package:arteriaapp/common/theme_colors.dart';
import 'package:arteriaapp/common/theme_fonts.dart';
import 'package:arteriaapp/common/theme_variables.dart';
import 'package:arteriaapp/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookItem extends StatefulWidget {
  final String? title;
  final String? authors;
  final String? publisher;
  final String? thumbnail;
  final String? publishedDate;
  final int? pageCount;
  final bool isFavorite;
  final Function(bool status) setBookStatus;

  const BookItem(
      {Key? key,
      this.title,
      this.authors,
      this.publisher,
      this.thumbnail,
      this.publishedDate,
      this.pageCount,
      required this.setBookStatus,
      required this.isFavorite})
      : super(key: key);

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => !widget.isFavorite ? widget.setBookStatus.call(true) : null,
      onLongPress: () => widget.isFavorite ? widget.setBookStatus.call(false) : null,
      child: Container(
        padding: const EdgeInsets.all(ThemeVariables.gap),
        margin: const EdgeInsets.only(bottom: ThemeVariables.gap),
        decoration: BoxDecoration(
            color: ThemeColors.transparent,
            borderRadius: BorderRadius.circular(ThemeVariables.gap * 2),
            border: Border.all(width: 2, color: widget.isFavorite ? ThemeColors.blue : ThemeColors.white)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ThemeVariables.gap),
                child: widget.thumbnail != null
                    ? Image.network(widget.thumbnail!,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.4,
                        colorBlendMode: BlendMode.color,
                        color: const Color.fromRGBO(0, 0, 0, 0.5))
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const Icon(
                          Icons.image,
                          size: 80,
                          color: ThemeColors.white,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(width: ThemeVariables.gap * 2),
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title ?? LocaleKeys.widgets_book_item_unknown.tr(),
                              style: ThemeFonts.bold16_24.copyWith(
                                color: ThemeColors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(height: ThemeVariables.gap),
                            Divider(color: ThemeColors.white.withOpacity(0.5), height: 0.5),
                            const SizedBox(height: ThemeVariables.gap),
                            if (widget.authors != null)
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.widgets_book_item_authors.tr(),
                                    style: ThemeFonts.regular14_16.copyWith(color: ThemeColors.white),
                                  ),
                                  const SizedBox(width: ThemeVariables.gap),
                                  Flexible(
                                    child: Text(
                                      widget.authors!,
                                      style: ThemeFonts.regular14_16.copyWith(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            if (widget.publisher != null)
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.widgets_book_item_publisher.tr(),
                                    style: ThemeFonts.regular14_16.copyWith(color: ThemeColors.white),
                                  ),
                                  const SizedBox(width: ThemeVariables.gap),
                                  Flexible(
                                    child: Text(
                                      widget.publisher!,
                                      style: ThemeFonts.regular14_16.copyWith(
                                        color: ThemeColors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            if (widget.publishedDate != null) ...[
                              Text(
                                '${LocaleKeys.widgets_book_item_published_at.tr()} ${widget.publishedDate}',
                                style: ThemeFonts.regular14_16.copyWith(color: ThemeColors.white),
                              ),
                              const SizedBox(width: ThemeVariables.gap)
                            ],
                            if (widget.publishedDate != null)
                              Text(
                                '${LocaleKeys.widgets_book_item_pages.tr()} ${widget.pageCount}',
                                style: ThemeFonts.regular14_16.copyWith(color: ThemeColors.white),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

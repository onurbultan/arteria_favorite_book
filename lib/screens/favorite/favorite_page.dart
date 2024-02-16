import 'dart:convert';
import 'package:arteriaapp/generated/codegen_loader.g.dart';
import 'package:arteriaapp/screens/favorite/bloc/favorite_bloc.dart';
import 'package:arteriaapp/screens/favorite/widgets/favorite_app_bar.dart';
import 'package:arteriaapp/screens/home/bloc/home_bloc.dart';
import 'package:arteriaapp/widgets/book_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arteriaapp/common/test_keys.dart';
import 'package:arteriaapp/common/theme_colors.dart';
import 'package:arteriaapp/common/theme_variables.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeBloc = context.read<HomeBloc>();
    return Material(
        child: Scaffold(
            backgroundColor: ThemeColors.background,
            appBar: FavoriteAppBar(context, title: LocaleKeys.screens_favorite_page_title.tr()),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: ThemeVariables.gap),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          BlocConsumer<FavoriteBloc, FavoriteState>(listener: (context, state) async {
                            if (state is BookRemoved) {
                              homeBloc.getFavoriteBooks();
                            }
                          }, builder: (context, state) {
                            var cubit = context.read<FavoriteBloc>();
                            return state is FavoriteLoading
                                ? const Expanded(
                                    child: Center(child: CircularProgressIndicator()),
                                  )
                                : cubit.favoriteBooks.isEmpty
                                    ? const Expanded(
                                        child: Center(
                                          child: Icon(
                                            Icons.book,
                                            size: 50,
                                            color: ThemeColors.blue,
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          padding: EdgeInsets.zero,
                                          itemCount: cubit.favoriteBooks.length,
                                          itemBuilder: (c, i) {
                                            var book = cubit.favoriteBooks[i];
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: ThemeVariables.gap * 2, vertical: ThemeVariables.gap / 2),
                                              child: BookItem(
                                                key: TestKeys.bookItem(book.bookId),
                                                title: book.title,
                                                authors: book.authors?.join(","),
                                                publisher: book.publisher,
                                                pageCount: book.pageCount,
                                                publishedDate: book.publishedDate,
                                                thumbnail: book.imageLinks != null
                                                    ? (json.decode(book.imageLinks!))["thumbnail"]
                                                    : null,
                                                isFavorite: true,
                                                setBookStatus: (status) async {
                                                  context.read<FavoriteBloc>().add(FavoriteBookRemove(book));
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                          })
                        ])))));
  }
}

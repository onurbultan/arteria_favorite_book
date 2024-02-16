import 'package:arteriaapp/common/base_input_decoration.dart';
import 'package:arteriaapp/generated/codegen_loader.g.dart';
import 'package:arteriaapp/screens/favorite/bloc/favorite_bloc.dart';
import 'package:arteriaapp/widgets/book_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arteriaapp/common/test_keys.dart';
import 'package:arteriaapp/common/theme_colors.dart';
import 'package:arteriaapp/common/theme_variables.dart';
import 'package:arteriaapp/screens/home/bloc/home_bloc.dart';
import 'package:arteriaapp/screens/home/widgets/home_app_bar.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode searchBookFocusNode = FocusNode();
  final Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  final snackBar = SnackBar(
    content: Text(LocaleKeys.screens_homepage_page_search_term_exceeded.tr()),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteBloc = context.read<FavoriteBloc>();
    return Material(
        child: Scaffold(
            backgroundColor: ThemeColors.background,
            appBar: HomeAppBar(context, title: LocaleKeys.screens_homepage_page_title.tr()),
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
                          searchBookField(),
                          const SizedBox(
                            height: ThemeVariables.gap * 2,
                          ),
                          BlocConsumer<HomeBloc, HomeState>(listener: (context, state) async {
                            if (state is SearchTermExceeded) {
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            if (state is HomePageBookRemoved) {
                              favoriteBloc.getFavoriteBooks();
                            }
                            if (state is BookAdded) {
                              favoriteBloc.getFavoriteBooks();
                            }
                          }, builder: (context, state) {
                            var cubit = context.read<HomeBloc>();

                            return state is HomeLoading
                                ? const Expanded(
                                    child: Center(child: CircularProgressIndicator()),
                                  )
                                : cubit.books.isEmpty
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
                                          itemCount: cubit.books.length,
                                          itemBuilder: (c, i) {
                                            var book = cubit.books[i];
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: ThemeVariables.gap * 2, vertical: ThemeVariables.gap / 2),
                                              child: BookItem(
                                                key: TestKeys.bookItem(book.id),
                                                title: book.volumeInfo.title,
                                                authors: book.volumeInfo.authors?.join(","),
                                                publisher: book.volumeInfo.publisher,
                                                pageCount: book.volumeInfo.pageCount,
                                                publishedDate: book.volumeInfo.publishedDate,
                                                thumbnail: book.volumeInfo.imageLinks != null
                                                    ? book.volumeInfo.imageLinks!["thumbnail"]
                                                    : null,
                                                isFavorite: book.isFavorite ?? false,
                                                setBookStatus: (status) async {
                                                  if (status) {
                                                    context.read<HomeBloc>().add(BookAdd(book));
                                                  } else {
                                                    context.read<HomeBloc>().add(BookRemove(book));
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      );
                          })
                        ])))));
  }

  Widget searchBookField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeVariables.gap * 2, vertical: ThemeVariables.gap / 2),
      child: TextFormField(
        focusNode: searchBookFocusNode,
        cursorWidth: 2,
        style: const TextStyle(color: Colors.white),
        decoration: textFieldStyle.copyWith(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 26,
          ),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          debouncer.call(() {
            if (value.isNotEmpty) {
              context.read<HomeBloc>().add(BookSearching(value));
            }
          });
        },
      ),
    );
  }
}

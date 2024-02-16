import 'package:arteriaapp/common/routes.dart';
import 'package:arteriaapp/models/dto/arteria_app_bar_params.dart';
import 'package:flutter/material.dart';
import 'package:arteriaapp/common/test_keys.dart';
import 'package:arteriaapp/common/theme_colors.dart';
import 'package:arteriaapp/common/theme_fonts.dart';
import 'package:arteriaapp/common/theme_variables.dart';

class ArteriaAppBar extends StatelessWidget {
  final ArteriaAppBarParams appBarParams;

  const ArteriaAppBar({Key? key, required this.appBarParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: AppBar(
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 64,
            backgroundColor: ThemeColors.background,
            centerTitle: true,
            surfaceTintColor: ThemeColors.background,
            key: appBarParams.map(
              home: (_) => TestKeys.homeAppBar,
              favorite: (_) => TestKeys.favoriteAppBar,
            ),
            title: _buildTitle(context),
            actions: [
              appBarParams.map(
                home: (_) => const SizedBox(),
                favorite: (_) => const SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildTitle(BuildContext context) {
    return appBarParams.map(
      home: (params) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: ThemeVariables.gap * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                params.title,
                style: ThemeFonts.bold24_28.copyWith(color: Colors.white),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.favorite);
                  },
                  child: const Icon(Icons.favorite, size: 24, color: Colors.white)),
            ],
          ),
        );
      },
      favorite: (params) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: ThemeVariables.gap * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                params.title,
                style: ThemeFonts.bold24_28.copyWith(color: Colors.white),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.home);
                  },
                  child: const Icon(Icons.home, size: 24, color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}

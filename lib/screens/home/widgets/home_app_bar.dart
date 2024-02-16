import 'package:arteriaapp/models/dto/arteria_app_bar_params.dart';
import 'package:arteriaapp/widgets/arteria_app_bar/arteria_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arteriaapp/common/app_bar_params.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar(BuildContext context, {Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArteriaAppBar(
      appBarParams: HomeParams(title),
    );
  }

  @override
  @override
  Size get preferredSize => const Size.fromHeight(AppBarParams.mobileHeight);
}

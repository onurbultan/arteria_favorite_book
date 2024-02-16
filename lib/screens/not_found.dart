import 'package:arteriaapp/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(LocaleKeys.not_found.tr()),
    );
  }
}

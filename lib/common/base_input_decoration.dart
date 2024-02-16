import 'package:arteriaapp/common/theme_colors.dart';
import 'package:flutter/material.dart';

const textFieldStyle = InputDecoration(
    hintStyle: TextStyle(
      color: Color.fromRGBO(131, 143, 161, 1),
      fontFamily: 'PTSans',
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(214, 217, 219, 1), width: 1.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(width: 2, color: ThemeColors.black10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ThemeColors.blue, width: 2.0),
    ),
    isDense: true);

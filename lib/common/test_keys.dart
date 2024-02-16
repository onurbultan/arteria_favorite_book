import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TestKeys {
  static Key homeAppBar = const Key('homeAppBar');
  static Key favoriteAppBar = const Key('favoriteAppBar');

  static Key bookItem(String id) => Key('bookItem-$id');
}

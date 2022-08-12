import 'package:flutter/material.dart';
import 'package:piton_assignment/core/style/style.dart';

final mainTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: styleAppBarTxt,
        centerTitle: true),
    colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black));

import 'dart:ui';

import 'package:flutter/material.dart';
const blue1 = Color(0xFF03045E);
const blue2 = Color(0xFF023E8A);
const blue3 = Color(0xFF0077B6);
const blue4 = Color(0xFF0096C7);
const blue5 = Color(0xFF00B4D8);
const blue6 = Color(0xFF48CAE4);
const blue7 = Color(0xFF90E0EF);
const blue8 = Color(0xFFADE8F4);
const blue9 = Color(0xFFCAF0F8);
const kPageOneColor = Color(0xFF0096C7);
const kPageTwoColor = Color(0xFF00B4D8);
const kPageThreeColor = Color(0xFF48CAE4);
const kPageSkipTextColor = Color(0xFF26283C);

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
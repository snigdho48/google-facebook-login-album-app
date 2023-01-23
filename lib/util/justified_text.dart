import 'package:flutter/material.dart';

Text text(String text,
        {TextStyle style = const TextStyle(color: Colors.white)}) =>
    Text(text, textAlign: TextAlign.justify, style: style);

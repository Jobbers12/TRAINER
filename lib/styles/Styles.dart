import 'package:flutter/material.dart';

class Styles {
  // GLOBAL SIZES
  static const _textSizeDefault = 16.0; // Default text size

  // GLOBAL COLORS
  static final Color headerColor = Colors.grey[900]; // Header text color
  static final Color _textColorDefault = _hexToColor('000000'); // Default text color
  static final Color backgroundColor = Colors.grey[200]; // App backgound colour
  static final Color activeColor = Colors.green[100];
  static final Color inActiveColor = Colors.grey[350];

  
  static const EdgeInsets globalPagePadding = EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0); // Padding for the entire page
  static const EdgeInsets headingPadding = EdgeInsets.fromLTRB(0, 8.0, 0, 16.0);


  // Default Text
  static final textDefault = TextStyle(
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  // Large Heading
  static final headerLarge = TextStyle(
    fontSize: 32.0,
    color: headerColor,
    fontWeight: FontWeight.bold,
  );

  // Medium Heading
  static final headerMedium = TextStyle(
    fontSize: 24,
    color: headerColor,
    fontWeight: FontWeight.bold,
  );

  // Converts HEX to Color
  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}

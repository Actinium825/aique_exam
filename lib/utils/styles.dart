import 'package:flutter/material.dart';
import 'package:qube_project/gen/fonts.gen.dart';

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't create every variant in existence here, just the main ones.
/// More specific variants can be created on the fly using 'style.copyWith()'.
class TextStyles {
  /// Declare a base style family
  static const TextStyle poppinsStyles = TextStyle(
    fontFamily: FontFamily.poppins,
    color: Colors.white,
  );

  static TextStyle get regular => poppinsStyles.copyWith(fontWeight: FontWeight.w400);

  static TextStyle get medium => poppinsStyles.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get xxs => regular.copyWith(fontSize: 12.0);
}

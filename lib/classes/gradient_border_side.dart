import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';

class GradientBorderSide extends InputBorder {
  const GradientBorderSide({
    this.width = detailsCardBorderWidth,
    this.radius = detailsCardRadius,
  });

  final double width;
  final double radius;

  @override
  InputBorder copyWith({BorderSide? borderSide}) => throw UnimplementedError();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => throw UnimplementedError();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => throw UnimplementedError();

  @override
  bool get isOutline => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final rrect = BorderRadius.circular(radius).toRRect(rect).deflate(width / 2);
    canvas.drawRRect(rrect, _getPaint(rect));
  }

  @override
  ShapeBorder scale(double t) => this;

  Paint _getPaint(Rect rect) => Paint()
    ..strokeWidth = width
    ..shader = qubeGradient.createShader(rect)
    ..style = PaintingStyle.stroke;
}

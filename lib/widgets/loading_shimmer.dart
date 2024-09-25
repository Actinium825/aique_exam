import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    this.height = 24,
    this.width,
    super.key,
  });

  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: loadingGradient,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(loadingShimmerRadius),
          color: Colors.black,
        ),
      ),
    );
  }
}

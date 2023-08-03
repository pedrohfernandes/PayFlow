import 'package:flutter/material.dart';

import '/shared/themes/themes.dart';

class DividerWidget extends StatelessWidget {
  final double width;
  final double height;

  const DividerWidget({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: AppColors.stroke,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_widget.dart';

import '/shared/themes/themes.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;

  const LabelButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DividerWidget(
            width: double.maxFinite,
            height: 1,
          ),
          Expanded(
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                label,
                style: style ?? AppTextStyles.buttonHeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

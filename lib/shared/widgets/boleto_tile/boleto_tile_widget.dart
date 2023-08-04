import 'package:flutter/material.dart';

import '/shared/models/boleto_model.dart';
import '/shared/themes/themes.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        data.name!,
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em ${data.dueDate}",
        style: AppTextStyles.captionBody,
      ),
      trailing: Text.rich(
        TextSpan(
          text: "R\$ ",
          style: AppTextStyles.trailingRegular,
          children: [
            TextSpan(
              text: data.value!.toStringAsFixed(2),
              style: AppTextStyles.trailingBold,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '/shared/themes/themes.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int quantidadeBoletos;
  const BoletoInfoWidget({super.key, required this.quantidadeBoletos});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 34,
              color: AppColors.background,
            ),
            Text.rich(
              TextSpan(
                text: "Você tem ",
                style: AppTextStyles.captionBackground,
                children: [
                  TextSpan(
                    text: "$quantidadeBoletos boletos\n",
                    style: AppTextStyles.captionBoldBackground,
                  ),
                  TextSpan(
                    text: "cadastrados para pagar",
                    style: AppTextStyles.captionBackground,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

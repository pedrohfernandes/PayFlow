import 'package:flutter/material.dart';

import '/shared/models/boleto_model.dart';
import '/shared/themes/themes.dart';
import '/shared/widgets/boleto_info/boleto_info_widget.dart';
import '/shared/widgets/boleto_list/boleto_list_controller.dart';
import '/shared/widgets/boleto_list/boleto_list_widget.dart';
import '/shared/widgets/divider_vertical/divider_widget.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({super.key});

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) =>
                      BoletoInfoWidget(quantidadeBoletos: boletos.length),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Text(
                      "Meus boletos",
                      style: AppTextStyles.titleBoldHeading,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: DividerWidget(
                  width: double.maxFinite,
                  height: 1,
                ),
              ),
              BoletoListWidget(controller: controller),
            ],
          ),
        ),
      ],
    );
  }
}

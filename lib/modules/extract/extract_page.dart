import 'package:flutter/material.dart';

import '/shared/themes/themes.dart';
import '/shared/widgets/boleto_list/boleto_list_controller.dart';
import '/shared/widgets/boleto_list/boleto_list_widget.dart';
import '/shared/widgets/divider_vertical/divider_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({super.key});

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Text(
                        "Meus extratos",
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
      ),
    );
  }
}

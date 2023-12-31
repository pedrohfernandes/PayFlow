import 'package:flutter/material.dart';

import '/modules/barcode_scanner/barcode_scanner_controller.dart';
import '/modules/barcode_scanner/barcode_scanner_status.dart';
import '/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import '/shared/widgets/set_label_buttons/set_label_buttons.dart';
import '/shared/themes/themes.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(
          context,
          "/insert_boleto",
          arguments: controller.status.barcode,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1, //Faz com que o layout gire 90°
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: AppTextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código do boleto",
                primaryOnPressed: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                secondaryLabel: "Adicionar boleto da galeria",
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  title: "Não foi possível identificar o código de barras.",
                  subtitle:
                      "Tente escanear novamente ou digite o código do seu boleto.",
                  primaryLabel: "Escanear novamente",
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  },
                  secondaryLabel: "Digitar código",
                  secondaryOnPressed: () {
                    Navigator.pushReplacementNamed(context, "/insert_boleto");
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

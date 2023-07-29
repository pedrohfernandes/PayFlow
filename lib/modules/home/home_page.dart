import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';

import '/shared/themes/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final pages = [
    Container(color: Colors.blue),
    Container(color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: "Pedro",
                        style: AppTextStyles.titleBoldBackground,
                      ),
                    ],
                  ),
                ),
                subtitle: Text(
                  "Mantenha suas contas em dia",
                  style: AppTextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: pages[controller.currentPage],
        bottomNavigationBar: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("clicou");
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.setPage(1);
                  setState(() {});
                },
                icon: Icon(Icons.description_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

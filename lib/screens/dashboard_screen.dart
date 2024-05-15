import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/utils/constants.dart';
import 'package:promovision/utils/responsive.dart';
import 'package:promovision/widgets/header.dart';
import 'package:promovision/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer:const SideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // We want this side menu only for large screen
          if (Responsive.isDesktop(context))
            const Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(),
            ),
          const Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [Header(title: "Dashboard",)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

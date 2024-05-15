import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/utils/constants.dart';
import 'package:promovision/utils/responsive.dart';
import 'package:promovision/widgets/header.dart';
import 'package:promovision/widgets/projects_table.dart';
import 'package:promovision/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer:const SideMenu(),
      body: SelectionArea (
        child: Row(
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
              child: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Header(title: "Proyectos"),
                      SizedBox(height: defaultPadding),
                      ProjectsTable()
                      ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
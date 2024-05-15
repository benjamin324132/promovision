import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/utils/responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, this.children});
  final String title;
  final Widget? children;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        if (children != null) children!
      ],
    );
  }
}

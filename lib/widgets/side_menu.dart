import 'package:flutter/material.dart';
import 'package:promovision/screens/dashboard_screen.dart';
import 'package:promovision/screens/petty_cash_screen.dart';
import 'package:promovision/screens/projects_screen.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
         const DrawerHeader(
            child: Center(child: Text("Promovison")),
          ),
          DrawerListTile(
            title: "Dashboard",
            icon: Icons.dashboard,
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashboardScreen()));
            },
          ),
          DrawerListTile(
            title: "Proyectos",
            icon: Icons.task,
            press: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProjectsScreen()));
            },
          ),
          DrawerListTile(
            title: "Caja chica",
            icon: Icons.money,
            press: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PettyCashScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.white54,
        size: 16,
      ),
      title: Text(
        title,
        style:const TextStyle(color: Colors.white54),
      ),
    );
  }
}
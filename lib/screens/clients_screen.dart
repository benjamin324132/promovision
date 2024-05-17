import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/utils/constants.dart';
import 'package:promovision/utils/responsive.dart';
import 'package:promovision/widgets/clients_table.dart';
import 'package:promovision/widgets/header.dart';
import 'package:promovision/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _apellido1Controller = TextEditingController();
  final TextEditingController _apellido2Controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();

  Future<void> showFormDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: secondaryColor,
              content: SizedBox(
                width: Responsive.isDesktop(context) ? 400 : double.infinity,
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca nombre";
                          },
                          decoration: const InputDecoration(hintText: "Nombre"),
                        ),
                        TextFormField(
                          controller: _apellido1Controller,
                          decoration: const InputDecoration(hintText: "Apellido 1"),
                        ),
                        TextFormField(
                          controller: _apellido2Controller,
                          decoration: const InputDecoration(hintText: "Apellido 2"),
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca email";
                          },
                          decoration: const InputDecoration(hintText: "Email"),
                        ),
                        TextFormField(
                          controller: _telefonoController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca telefono";
                          },
                          decoration: const InputDecoration(hintText: "Telefono"),
                        ),
                        TextFormField(
                          controller: _montoController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca monto";
                          },
                          decoration: const InputDecoration(hintText: "Monto"),
                        ),
                      ],
                    )),
              ),
              title: const Text('Agregar cliente'),
              actions: <Widget>[
                TextButton(         
                  child: const Text('Cancelar'),
                  onPressed: () {
                    // Do something like updating SharedPreferences or User Settings etc.
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SelectionArea(
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
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Header(
                      title: "Clientes",
                      children: ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.5,
                            vertical: defaultPadding /
                                (Responsive.isMobile(context) ? 2 : 1),
                          ),
                        ),
                        onPressed: () async {
                          await showFormDialog(context);
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Agregar"),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    const ClientsTable()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

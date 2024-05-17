import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/utils/constants.dart';
import 'package:promovision/utils/responsive.dart';
import 'package:promovision/widgets/header.dart';
import 'package:promovision/widgets/investments_table.dart';
import 'package:promovision/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({super.key});

  @override
  State<InvestmentsScreen> createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _projectController = TextEditingController();
  final TextEditingController _inversorController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _porcentajeController = TextEditingController();
  final TextEditingController _fechaDesinversionController = TextEditingController();

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
                          controller: _projectController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca proyecto";
                          },
                          decoration: const InputDecoration(hintText: "Proyecto"),
                        ),
                        TextFormField(
                          controller: _inversorController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca inversor";
                          },
                          decoration: const InputDecoration(hintText: "Inversor"),
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
                        TextFormField(
                          controller: _porcentajeController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca porcentaje";
                          },
                          decoration: const InputDecoration(hintText: "Porcentaje"),
                        ),
                        TextFormField(
                          controller: _fechaDesinversionController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca fecha desinversion";
                          },
                          decoration: const InputDecoration(hintText: "Fecha Desinversion"),
                        ),
                      ],
                    )),
              ),
              title: const Text('Agregar inversion'),
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
                      title: "Inversiones",
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
                    const InvestmentsTable()
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

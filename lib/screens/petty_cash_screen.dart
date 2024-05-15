import 'package:flutter/material.dart';
import 'package:promovision/controllers/MenuAppController.dart';
import 'package:promovision/utils/constants.dart';
import 'package:promovision/utils/responsive.dart';
import 'package:promovision/widgets/expenses_table.dart';
import 'package:promovision/widgets/header.dart';
import 'package:promovision/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class PettyCashScreen extends StatefulWidget {
  const PettyCashScreen({super.key});

  @override
  State<PettyCashScreen> createState() => _PettyCashScreenState();
}

class _PettyCashScreenState extends State<PettyCashScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _conceptoController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _cuentaController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();

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
                          controller: _conceptoController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca concepto";
                          },
                          decoration: const InputDecoration(hintText: "Concepto"),
                        ),
                        TextFormField(
                          controller: _cantidadController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Introduzca cantidad";
                          },
                          decoration: const InputDecoration(hintText: "Cantidad"),
                        ),
                        TextFormField(
                          controller: _cuentaController,
                          validator: (value) {
                            return value!.isNotEmpty ? null : "Introduzca cuenta";
                          },
                          decoration: const InputDecoration(hintText: "Cuenta"),
                        ),
                        TextFormField(
                          controller: _fechaController,
                          validator: (value) {
                            return value!.isNotEmpty ? null : "Introduzca fecha";
                          },
                          decoration: const InputDecoration(hintText: "Fecha"),
                        ),
                      ],
                    )),
              ),
              title: const Text('Agregar transaccion'),
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
                      title: "Caja chica",
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
                    const ExpensesTable()
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

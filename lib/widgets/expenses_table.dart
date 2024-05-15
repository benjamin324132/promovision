

import 'package:flutter/material.dart';
import 'package:promovision/models/expenses.dart';
import 'package:promovision/utils/constants.dart';

class ExpensesTable extends StatelessWidget {
  const ExpensesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius:  BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tabla de proyectos",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns:const [
                DataColumn(
                  label: Text("Id"),
                ),
                DataColumn(
                  label: Text("Concepto"),
                ),
                DataColumn(
                  label: Text("Cantidad"),
                ),
                DataColumn(
                  label: Text("Cuenta"),
                ),
                DataColumn(
                  label: Text("Fecha"),
                ),
              ],
              rows: List.generate(
                demoExpenses.length,
                (index) => recentFileDataRow(demoExpenses[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(ExpenseModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id!)),
      DataCell(Text(fileInfo.concepto!)),
       DataCell(Text(fileInfo.cantidad!)),
        DataCell(Text(fileInfo.cuenta!)),
      DataCell(Text(fileInfo.fecha!)),
    ],
  );
}
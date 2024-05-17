import 'package:flutter/material.dart';
import 'package:promovision/models/investment.dart';
import 'package:promovision/utils/constants.dart';

class InvestmentsTable extends StatelessWidget {
  const InvestmentsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("Id"),
                ),
                DataColumn(
                  label: Text("Proyecto"),
                ),
                DataColumn(
                  label: Text("Inversor"),
                ),
                DataColumn(
                  label: Text("Monto"),
                ),
                DataColumn(
                  label: Text("Porcentaje"),
                ),
                DataColumn(
                  label: Text("Fecha Desinversion"),
                ),
              ],
              rows: List.generate(
                demoInvestments.length,
                (index) => recentFileDataRow(demoInvestments[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(InvestmentsModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id)),
      DataCell(Text(fileInfo.proyecto)),
      DataCell(Text(fileInfo.inversor)),
      DataCell(Text("\$${fileInfo.montoInversion}")),
      DataCell(Text(fileInfo.porcentajePropiedad != null ? "${fileInfo.porcentajePropiedad}" : "")),
      DataCell(Text("${fileInfo.fechaDesinversion}")),
    ],
  );
}

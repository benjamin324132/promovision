import 'package:flutter/material.dart';
import 'package:promovision/models/investors.dart';
import 'package:promovision/utils/constants.dart';

class InvestorsTable extends StatelessWidget {
  const InvestorsTable({super.key});

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
                  label: Text("Nombre"),
                ),
              ],
              rows: List.generate(
                demoInvestors.length,
                (index) => recentFileDataRow(demoInvestors[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(InvestorsModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id)),
      DataCell(Text(fileInfo.nombre)),
    ],
  );
}

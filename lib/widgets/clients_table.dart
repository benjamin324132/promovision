import 'package:flutter/material.dart';
import 'package:promovision/models/clients.dart';
import 'package:promovision/utils/constants.dart';

class ClientsTable extends StatelessWidget {
  const ClientsTable({super.key});

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
                DataColumn(
                  label: Text("Apellidos"),
                ),
                DataColumn(
                  label: Text("Telefono"),
                ),
                DataColumn(
                  label: Text("Email"),
                ),
                DataColumn(
                  label: Text("Monto"),
                ),
              ],
              rows: List.generate(
                demoClients.length,
                (index) => recentFileDataRow(demoClients[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(ClientsModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id)),
      DataCell(Text(fileInfo.nombre)),
      DataCell(Text(fileInfo.apellido1 ?? "")),
      DataCell(Text(fileInfo.telefono)),
      DataCell(Text(fileInfo.email)),
      DataCell(Text("\$${fileInfo.montoCredito}")),
    ],
  );
}



import 'package:flutter/material.dart';
import 'package:promovision/models/project.dart';
import 'package:promovision/utils/constants.dart';

class ProjectsTable extends StatelessWidget {
  const ProjectsTable({super.key});

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
                  label: Text("Costo"),
                ),
                DataColumn(
                  label: Text("Fecha inicio"),
                ),
                DataColumn(
                  label: Text("Fecha fin"),
                ),
                DataColumn(
                  label: Text("Servicios"),
                ),
                DataColumn(
                  label: Text("Gastos"),
                ),
                DataColumn(
                  label: Text("Precio venta"),
                ),
              ],
              rows: List.generate(
                demoProjects.length,
                (index) => recentFileDataRow(demoProjects[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(ProjectModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id)),
      DataCell(Text("\$${fileInfo.costoPropiedad}")),
      DataCell(Text(fileInfo.fechaInicio)),
      DataCell(Text(fileInfo.fechaFin)),
      DataCell(Text(fileInfo.servicios)),
      DataCell(Text(fileInfo.gastos)),
      DataCell(Text("\$${fileInfo.precioVenta}")),
    ],
  );
}
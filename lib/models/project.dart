class ProjectModel {
  final String id;
  final int costoPropiedad;
  final String fechaInicio;
  final String fechaFin;
  final String servicios;
  final String gastos;
  final int? precioVenta;

  ProjectModel(
      {required this.id,
      required this.costoPropiedad,
      required this.fechaInicio,
      required this.fechaFin,
      required this.servicios,
      required this.gastos,
      this.precioVenta});
}

List<ProjectModel> demoProjects = [
  ProjectModel(
      id: "234",
      costoPropiedad: 400000,
      fechaInicio: "Inicio",
      fechaFin: "Fin",
      servicios: "Luz, agua",
      gastos: "Limpieza",
      precioVenta: 450000),

];

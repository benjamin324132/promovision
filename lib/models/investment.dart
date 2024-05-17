class InvestmentsModel {
  final String id;
  final String proyecto;
  final String inversor;
  final int montoInversion;
  final int? porcentajePropiedad;
  final String? fechaDesinversion;

  InvestmentsModel(
      {required this.id,
      required this.proyecto,
      required this.inversor,
      required this.montoInversion,
      this.porcentajePropiedad,
      this.fechaDesinversion});
}

List<InvestmentsModel> demoInvestments = [
  InvestmentsModel(
      id: "1",
      proyecto: "Proyecto Kino",
      inversor: "Jhon Doe",
      montoInversion: 40000,
      porcentajePropiedad: 30,
      fechaDesinversion: "Fecha"),
  InvestmentsModel(
      id: "2",
      proyecto: "Proyecto Kino",
      inversor: "Bolainaz",
      montoInversion: 490000,
      porcentajePropiedad: 80,
      fechaDesinversion: "Fecha"),
  InvestmentsModel(
      id: "3",
      proyecto: "Proyecto Kino",
      inversor: "Bolainaz",
      montoInversion: 2000,
      porcentajePropiedad: 20,
      fechaDesinversion: "Fecha"),
  InvestmentsModel(
      id: "4",
      proyecto: "Proyecto Kino",
      inversor: "Pedro Juarez",
      montoInversion: 40000,
      porcentajePropiedad: 30,
      fechaDesinversion: "Fecha"),
  InvestmentsModel(
      id: "5",
      proyecto: "Proyecto Kino",
      inversor: "Benjamin",
      montoInversion: 10000,
      porcentajePropiedad: 10,
      fechaDesinversion: "Fecha"),
];

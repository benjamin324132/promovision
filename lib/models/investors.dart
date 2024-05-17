class InvestorsModel {
  final String id;
  final String nombre;
  final String? apellido1;
  final String? apellido2;
  final String? telefono;
  final String? email;
  final int? montoCredito;

  InvestorsModel(
      {required this.id,
      required this.nombre,
      this.apellido1,
      this.apellido2,
      this.telefono,
      this.email,
      this.montoCredito});
}

List<InvestorsModel> demoInvestors = [
  InvestorsModel(id: "1", nombre: "Jhon Doe"),
  InvestorsModel(id: "2", nombre: "Dave Graham"),
  InvestorsModel(id: "3", nombre: "Juanita Perez"),
  InvestorsModel(id: "4", nombre: "Bolainaz"),
];

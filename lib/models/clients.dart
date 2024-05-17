class ClientsModel {
  final String id;
  final String nombre;
  final String? apellido1;
  final String? apellido2;
  final String telefono;
  final String email;
  final int montoCredito;

  ClientsModel(
      {required this.id,
      required this.nombre,
      this.apellido1,
      this.apellido2,
      required this.telefono,
      required this.email,
      required this.montoCredito});
}

List<ClientsModel> demoClients = [
  ClientsModel(
      id: "1",
      nombre: "Jhon Doe",
      telefono: "6623241324",
      email: "doe@gmail.com",
      montoCredito: 10700),
  ClientsModel(
      id: "2",
      nombre: "Dave Graham",
      telefono: "6623241324",
      email: "dave@gmail.com",
      montoCredito: 13000),
  ClientsModel(
      id: "3",
      nombre: "Juanita Perez",
      telefono: "6623241324",
      email: "juanita@gmail.com",
      montoCredito: 3000),
  ClientsModel(
      id: "4",
      nombre: "Bolainaz",
      telefono: "6623241324",
      email: "bolainaz@gmail.com",
      montoCredito: 1500),
];

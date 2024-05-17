class SellersModel {
  final String id;
  final String nombre;
  final String? apellido1;
  final String? apellido2;
  final String telefono;
  final String email;

  SellersModel(
      {required this.id,
      required this.nombre,
      this.apellido1,
      this.apellido2,
      required this.telefono,
      required this.email});
}

List<SellersModel> demoSellers = [
  SellersModel(
      id: "1",
      nombre: "Jhon Doe",
      telefono: "6623241324",
      email: "doe@gmail.com"),
  SellersModel(
      id: "2",
      nombre: "Dave Graham",
      telefono: "6623241324",
      email: "dave@gmail.com"),
  SellersModel(
      id: "3",
      nombre: "Juanita Perez",
      telefono: "6623241324",
      email: "juanita@gmail.com"),
  SellersModel(
      id: "4",
      nombre: "Bolainaz",
      telefono: "6623241324",
      email: "bolainaz@gmail.com"),
];

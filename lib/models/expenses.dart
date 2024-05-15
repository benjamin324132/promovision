class ExpenseModel {
  final String? id, concepto, cantidad, cuenta, fecha;

  ExpenseModel(
      {required this.id,
      required this.concepto,
      required this.cantidad,
      required this.cuenta,
      required this.fecha});
}

List<ExpenseModel> demoExpenses = [
  ExpenseModel(
      id: "214",
      concepto: "Mecanico",
      cantidad: "400",
      cuenta: "oficina",
      fecha: "23/4/2024"),
  ExpenseModel(
      id: "2124",
      concepto: "Avaluo",
      cantidad: "700",
      cuenta: "oficina",
      fecha: "23/4/2024"),
  ExpenseModel(
      id: "14",
      concepto: "Material",
      cantidad: "1000",
      cuenta: "oficina",
      fecha: "15/4/2024"),
  ExpenseModel(
      id: "214",
      concepto: "Renta",
      cantidad: "1400",
      cuenta: "oficina",
      fecha: "15/4/2024"),
  ExpenseModel(
      id: "214",
      concepto: "Escrituras",
      cantidad: "600",
      cuenta: "Constelacion",
      fecha: "12/4/2024"),
];

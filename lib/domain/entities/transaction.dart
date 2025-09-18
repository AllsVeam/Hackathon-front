class Transaction {
  final int id;
  final String type;
  final String name;
  final String concepto;
  final double count;
  final String date;
  final String idUser;

  Transaction({
    required this.id,
    required this.type,
    required this.name,
    required this.concepto,
    required this.count,
    required this.date,
    required this.idUser,
  });
}

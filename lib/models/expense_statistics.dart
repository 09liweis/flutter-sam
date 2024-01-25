class ExpenseStatistics {
  ExpenseStatistics({
    this.total = 0,
    this.date = '',
    this.categoryPrice,
  });

  double total;
  String date;
  Map<String, dynamic>? categoryPrice;

  double getTotal() {
    return total;
  }

  String getDate() {
    return date;
  }

  Map<String, dynamic>? getCategoryPrice() {
    return categoryPrice;
  }

  factory ExpenseStatistics.fromMap(Map<String, dynamic> map) =>
      ExpenseStatistics(
        total: map['total'],
        date: map['date'],
        categoryPrice: map['categoryPrice'],
      );
}

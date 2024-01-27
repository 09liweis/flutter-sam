class ExpenseStatistics {
  ExpenseStatistics({
    this.total = 0,
    this.date = '',
    this.categoryPrice,
  });

  double total;
  String date;
  List<CategoryExpenses>? categoryPrice;

  double getTotal() {
    return total;
  }

  String getDate() {
    return date;
  }

  List<CategoryExpenses>? getCategoryPrice() {
    return categoryPrice;
  }

  factory ExpenseStatistics.fromMap(Map<String, dynamic> json) =>
      ExpenseStatistics(
        total: json['total'],
        date: json['date'],
        categoryPrice: List<CategoryExpenses>.from(
            json['categoryPrice'].map((c) => CategoryExpenses.fromJson(c))),
      );
}

class CategoryExpenses {
  double total;
  String category;
  List<Expense>? items;
  CategoryExpenses({this.total = 0, this.category = '', this.items});
  factory CategoryExpenses.fromJson(Map<String, dynamic> json) {
    return CategoryExpenses(
        total: json['total'],
        category: json['category'],
        items: List<Expense>.from(
            json['items'].map((item) => Expense.fromJson(item))));
  }
}

class Expense {
  String title;
  double price;
  String category;
  String date;
  Expense(
      {this.title = '', this.price = 0, this.category = '', this.date = ''});
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
        price: json['price'],
        title: json['title'],
        category: json['category'],
        date: json['date']);
  }
}

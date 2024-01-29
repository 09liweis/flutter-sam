class ExpenseStatistics {
  ExpenseStatistics({
    this.total = '',
    this.date = '',
    this.categoryPrice = const [],
  });

  String total;
  String date;
  List<CategoryExpenses> categoryPrice;

  String getTotal() {
    return total;
  }

  String getDate() {
    return date;
  }

  List<CategoryExpenses> getCategoryPrice() {
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
  String total;
  String category;
  List<Expense> items;
  CategoryExpenses(
      {this.total = '', this.category = '', this.items = const []});
  factory CategoryExpenses.fromJson(Map<String, dynamic> json) {
    return CategoryExpenses(
        total: json['total'],
        category: json['category'],
        items: List<Expense>.from(
            json['items'].map((item) => Expense.fromJson(item))));
  }
}

class Expense {
  String? title;
  String price;
  String category;
  String date;
  Place? place;
  Expense(
      {this.title = '', this.price = '', this.category = '', this.date = ''});
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      price: json['price'],
      title: json['title'] ?? '',
      category: json['category'],
      date: json['date'],
    );
  }
}

class Place {
  String name;
  Place({this.name = ''});
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(name: json['name']);
  }
}

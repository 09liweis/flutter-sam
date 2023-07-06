class ExpenseStatistics {
  ExpenseStatistics({
    required this.total,
    required this.date,
    required this.categoryPrice,
  });

  factory ExpenseStatistics.fromMap(Map<String, dynamic> map) =>
      ExpenseStatistics(
        total: map['total'],
        date: map['date'],
        categoryPrice: CategoryPrice.fromMap(map['categoryPrice']),
      );

  double total;
  String date;
  CategoryPrice categoryPrice;

  Map<String, dynamic> toMap() => {
        'total': total,
        'date': date,
        'categoryPrice': categoryPrice.toMap(),
      };
}

class CategoryPrice {
  CategoryPrice({
    required this.food,
    required this.grocery,
    required this.gift,
    required this.movie,
    required this.fuel,
  });

  factory CategoryPrice.fromMap(Map<String, dynamic> map) => CategoryPrice(
        food: Food.fromMap(map['food']),
        grocery: Grocery.fromMap(map['grocery']),
        gift: Gift.fromMap(map['gift']),
        movie: Movie.fromMap(map['movie']),
        fuel: Fuel.fromMap(map['fuel']),
      );

  Map<String, dynamic> toMap() => {
        'food': food.toMap(),
        'grocery': grocery.toMap(),
        'gift': gift.toMap(),
        'movie': movie.toMap(),
        'fuel': fuel.toMap(),
      };
}

class Items {
  Items({
    required this.Id,
    required this.price,
    required this.date,
    required this.category,
    required this.place,
    required this.title,
  });

  factory Items.fromMap(Map<String, dynamic> map) => Items(
        Id: map['_id'],
        price: map['price'],
        date: map['date'],
        category: map['category'],
        place: Place.fromMap(map['place']),
        title: map['title'],
      );

  String Id;
  double price;
  String date;
  String category;
  Place place;
  String? title;

  Map<String, dynamic> toMap() => {
        '_id': Id,
        'price': price,
        'date': date,
        'category': category,
        'place': place.toMap(),
        'title': title,
      };
}

class Place {
  Place({
    required this.photos,
    required this.types,
    required this.transactions,
    required this.Id,
    required this.placeId,
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory Place.fromMap(Map<String, dynamic> map) => Place(
        photos: List<dynamic>.from(map['photos']),
        types: List<dynamic>.from(map['types']),
        transactions: List<dynamic>.from(map['transactions']),
        Id: map['_id'],
        placeId: map['place_id'],
        name: map['name'],
        address: map['address'],
        lat: map['lat'],
        lng: map['lng'],
      );

  List<dynamic> photos;
  List<dynamic> types;
  List<dynamic> transactions;
  String Id;
  String placeId;
  String name;
  String address;
  String lat;
  String lng;

  Map<String, dynamic> toMap() => {
        'photos': photos.map((e) => e).toList(),
        'types': types.map((e) => e).toList(),
        'transactions': transactions.map((e) => e).toList(),
        '_id': Id,
        'place_id': placeId,
        'name': name,
        'address': address,
        'lat': lat,
        'lng': lng,
      };
}

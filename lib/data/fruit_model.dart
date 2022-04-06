class FruitModel {
  String? name;
  String? price;
  double? rating;
  String? image;
  int? count;

  FruitModel({
    this.name,
    this.price,
    this.rating,
    this.image,
    this.count,
  });
  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      image: json['image'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'rating': rating,
        'image': image,
        'count': count,
      };
}

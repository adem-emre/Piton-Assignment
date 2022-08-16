class ProductDetailModel {
  Product? product;

  ProductDetailModel({this.product});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  double? price;
  String? image;
  String? description;
  String? timeStamp;
  List<Likes>? likes;

  Product(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.description,
      this.timeStamp,
      this.likes});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = (json['price'] as num).toDouble();
    image = json['image'];
    description = json['description'];
    timeStamp = json['timeStamp'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['timeStamp'] = timeStamp;
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Likes {
  int? id;

  Likes({this.id});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

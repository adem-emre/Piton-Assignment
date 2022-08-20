class ProductListModel {
  List<Product>? products;

  ProductListModel({this.products});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
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
  int? likes;

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
    likes=json["likes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['description'] = description;
    data['timeStamp'] = timeStamp;
    data['likes'] = likes;
    return data;
  }
}


class Likes {
  int? id;
  String? email;
  String? password;
  String? name;
  String? token;
  int? timeStamp;

  Likes(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.token,
      this.timeStamp});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    token = json['token'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['token'] = token;
    data['timeStamp'] = timeStamp;
    return data;
  }
}

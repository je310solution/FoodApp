
import 'dart:convert';

List<Orders> ordersFromJson(String str) => new List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  DateTime createdAt;
  int id;
  double price;
  int productID;
  String user;
  String name;
  String status;
  int qty;

  Orders({
    this.createdAt,
    this.id,
    this.user,
    this.name,
    this.status,
    this.productID,
    this.qty,
    this.price
  });

  factory Orders.fromJson(Map<String, dynamic> json) => new Orders(
    createdAt: DateTime.parse(json["created_at"]),

    id: json["id"],
    user: json["user"],
    name: json["name"],
    status: json["status"],
    productID: json["productID"],
    qty:json["qty"],
    price:json["price"]
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "user": user,
    "name": name,
    "status": status,
    "productID": productID,
    "price":price
  };
}


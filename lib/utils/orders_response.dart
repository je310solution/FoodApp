import 'package:foodapps/models/order.dart';

class OrdersResponse {
  final  List<Orders> orders;
  final String apiMore;
  OrdersResponse(this.orders, this.apiMore);
}
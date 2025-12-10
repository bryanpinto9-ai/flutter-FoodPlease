import 'cart_item.dart';

enum OrderStatus {
  pending,
  preparing,
  onWay,
  delivered,
}

class Order {
  final String id;
  final String userId;
  final String customerName;
  final String address;
  final List<CartItem> items;
  final double total;
  OrderStatus status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.userId,
    required this.customerName,
    required this.address,
    required this.items,
    required this.total,
    this.status = OrderStatus.pending,
    required this.createdAt,
  });
}

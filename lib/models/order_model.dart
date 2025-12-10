import 'product_model.dart';
// import 'user_model.dart'; // Not strictly needed if we just store customer name for now

enum OrderStatus {
  received,
  preparing,
  ready, // 'Listo para retirar' or 'En Preparación' completion
  onTheWay,
  delivered,
}

class OrderItem {
  final Product product;
  final int quantity;
  final String notes;

  OrderItem({
    required this.product,
    required this.quantity,
    this.notes = '',
  });

  double get total => product.price * quantity;
}

class Order {
  final String id;
  final String customerName;
  final String customerAddress;
  final List<OrderItem> items;
  OrderStatus status;
  final DateTime timestamp;

  Order({
    required this.id,
    required this.customerName,
    required this.customerAddress,
    required this.items,
    this.status = OrderStatus.received,
    DateTime? timestamp,
  }) : this.timestamp = timestamp ?? DateTime.now();

  double get total => items.fold(0, (sum, item) => sum + item.total);
    
  String get statusText {
     switch (status) {
       case OrderStatus.received: return 'Pedido Recibido';
       case OrderStatus.preparing: return 'En Preparación';
       case OrderStatus.ready: return 'Listo para enviar';
       case OrderStatus.onTheWay: return 'En Camino';
       case OrderStatus.delivered: return 'Entregado';
     }
  }
}

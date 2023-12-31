class OrderModel {
  int? id;
  String? status;
  String? paymentStatus;
  int? totalPrice;

  OrderModel({this.id, this.status, this.paymentStatus, this.totalPrice});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        status: json['status'],
        paymentStatus: json['payment_status'],
        totalPrice: json['total_price'],
      );

  static List<OrderModel> listFromJson(List json) =>
      List<OrderModel>.from(json.map((order) => OrderModel.fromJson(order)));
}

import 'package:flutter/material.dart';

enum OrderStatus { active, completed, cancelled }

class Order {
  final String id;
  final String dishName;
  final double price;
  OrderStatus status;
  final DateTime createdAt;
  final String? imageAsset; // put an asset path if you have one
  DateTime? cancelledAt;
  String? cancelReason;
  int? rating; // 1..5
  String? reviewComment;

  Order({
    required this.id,
    required this.dishName,
    required this.price,
    required this.status,
    required this.createdAt,
    this.imageAsset,
    this.cancelledAt,
    this.cancelReason,
    this.rating,
    this.reviewComment,
  });

  String get priceLabel => 'EGP ${price.toStringAsFixed(2)}';

  Color get statusColor => switch (status) {
        OrderStatus.active => Colors.blue,
        OrderStatus.completed => Colors.green,
        OrderStatus.cancelled => Colors.red,
      };
}
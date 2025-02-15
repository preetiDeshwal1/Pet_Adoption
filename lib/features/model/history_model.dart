import 'package:flutter/material.dart';

class PetsHistoryModel {
  String name;
  String breed;
  String image;
  int age;
  String origin;
  String price;
  Color color;
  String description;
  DateTime dateTime;

  PetsHistoryModel(
      {required this.image,
      required this.name,
      required this.breed,
      required this.age,
      required this.origin,
      required this.price,
      required this.color,
      required this.description,
      required this.dateTime});
}

List<PetsHistoryModel> history = [
  PetsHistoryModel(
    name: 'Mono LaMi',
    breed: 'British cats',
    image: 'images/cat1.png',
    age: 1,
    origin: "US",
    price: "\$12",
    dateTime: DateTime.now().subtract(const Duration(days: 5)
    ),
    color: const Color(0xffC1B7B1),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
];

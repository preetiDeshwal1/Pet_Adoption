import 'package:flutter/material.dart';

class PetsModel {
  String name;
  String breed;
  String image;
  int age;
  String origin;
  String price;
  Color color;
  String description;

  PetsModel({
    required this.image,
    required this.name,
    required this.breed,
    required this.age,
    required this.origin,
    required this.price,
    required this.color,
    required this.description,
  });
}

List<PetsModel> cats = [
  PetsModel(
    name: 'Mono LaMi',
    breed: 'British cats',
    image: 'images/cat1.png',
    age: 1,
    origin: "US",
    price: "\$12",
    color: const Color(0xffC1B7B1),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Amila Marko',
    breed: 'LaPerm cats',
    image: 'images/cat2.png',
    age: 2,
    price: "\$8",
    origin: "US",
    color: const Color(0xffD7BF9D),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Yon lee',
    breed: 'Persian cat',
    image: 'images/cat3.png',
    age: 3,
    origin: "Iran",
    price: "\$12",
    color: const Color(0xffB1D1FF),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
];
List<PetsModel> dogs = [
  PetsModel(
    name: 'Max',
    breed: 'Labrador Retriever',
    image: 'images/dog1.png',
    age: 1,
    origin: "UK",
    price: "\$12",
    color: const Color(0xffC1B7B1),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Bella',
    breed: 'Golden Retriever',
    image: 'images/dog2.png',
    age: 2,
    price: "\$15",
    origin: "Italy",
    color: const Color(0xffD7BF9D),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Charlie',
    breed: 'German Shepherd',
    image: 'images/dog3.png',
    age: 2,
    origin: "India",
    price: "\$9",
    color: const Color(0xffB1D1FF),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Daisy',
    breed: 'Beagle',
    image: 'images/dog4.png',
    age: 2,
    price: "\$18",
    origin: "India",
    color: const Color(0xffC1B7B1),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
  PetsModel(
    name: 'Luna',
    breed: 'Siberian Husky',
    image: 'images/dog5.png',
    age: 2,
    price: "\$10",
    origin: "India",
    color: const Color(0xffB1D1FF),
    description:
        "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
  ),
];

List<String> categoryList = ['Cats', 'Dogs'];
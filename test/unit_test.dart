import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petadoption/features/model/pet_model.dart';

void main() {
  test('PetsModel should store and retrieve correct values', () {
    final pet = PetsModel(
      name: 'Charlie',
      breed: 'German Shepherd',
      image: 'images/dog3.png',
      age: 2,
      price: '\$3',
      origin: "India",
      color: const Color(0xffB1D1FF),
      description:
          "Pets bring joy, companionship, and love into our lives. Whether furry, feathered, or scaled, they offer comfort and loyalty. From playful antics to gentle purrs, they teach us patience and responsibility.",
    );

    expect(pet.name, "Bella");
    expect(pet.breed, "Labrador");
    expect(pet.age, 2);
    expect(pet.image, "images/labrador.png");
    expect(pet.color, const Color(0xffFF9166));
  });
}

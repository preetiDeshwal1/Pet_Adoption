import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/features/presentation/home/bloc/event.dart';
import 'package:petadoption/features/presentation/home/bloc/state.dart';

class PetBloc extends Bloc<PetEvent, PetState> {
  PetBloc() : super(PetState(_pets)) {
    on<LoadPets>((event, emit) => emit(PetState(_pets)));
  }

  static final List<Map<String, dynamic>> _pets = [
    {'name': 'Bella', 'age': 2, 'price': 150, 'image': 'assets/cat1.jpeg'},
    {'name': 'Max', 'age': 3, 'price': 200, 'image': 'assets/dog1.jpeg'},
    {'name': 'Charlie', 'age': 1, 'price': 180, 'image': 'assets/cat2.jpeg'},
    {'name': 'Lucy', 'age': 4, 'price': 250, 'image': 'assets/dog2.jpeg'},
    {'name': 'Milo', 'age': 2, 'price': 175, 'image': 'assets/cat3.jpeg'},
    {'name': 'Rocky', 'age': 3, 'price': 220, 'image': 'assets/dog3.jpeg'},
    {'name': 'Luna', 'age': 5, 'price': 300, 'image': 'assets/cat4.jpeg'},
    {'name': 'Daisy', 'age': 1, 'price': 190, 'image': 'assets/dog4.jpeg'},
    {'name': 'Coco', 'age': 2, 'price': 210, 'image': 'assets/cat5.jpeg'},
    {'name': 'Buddy', 'age': 3, 'price': 240, 'image': 'assets/dog5.jpeg'},
  ];
}
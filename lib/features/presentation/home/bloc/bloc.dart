import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/pet_model.dart';
import 'event.dart';
import 'state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  List<PetsModel> allPets = [];
  int selectedIndex = 0;
  int page = 1;
  bool isLoading = false;
  String searchQuery = "";
  int minAge = 0;

  PetsBloc() : super(PetsLoading()) {
    on<LoadPets>((event, emit) {
      emit(PetsLoading());
      allPets = selectedIndex == 0 ? cats : dogs;
      List<PetsModel> pets = allPets.toList();
      emit(PetsLoaded(
          pets: pets,
          // hasMore: allPets.length > 5,
          selectedIndex: selectedIndex));
    });

    on<SearchPets>((event, emit) {
      searchQuery = event.query.toLowerCase();
      List<PetsModel> filteredPets = (minAge == 0)
          ? allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .toList()
          : allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .where((pet) => pet.age == minAge)
              // .take(5)
              .toList();

      emit(PetsLoaded(
          pets: filteredPets,
          // hasMore: allPets.length > 5,
          selectedIndex: selectedIndex));
    });

    on<FilterPetsByAge>((event, emit) {
      minAge = event.minAge;
      List<PetsModel> filteredPets = (minAge == 0)
          ? allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .toList()
          : allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .where((pet) => pet.age == minAge)
              // .take(5)
              .toList();

      emit(PetsLoaded(
          pets: filteredPets,
          // hasMore: allPets.length > 5,
          selectedIndex: selectedIndex));
    });

    on<SlectPetIndexEvent>((event, emit) {
      selectedIndex = event.index;
      // List<PetsModel> filteredPets = (minAge == 0)
      //     ? allPets
      //         .where((pet) => pet.name.toLowerCase().contains(searchQuery))
      //         .toList()
      //     : allPets
      //         .where((pet) => pet.name.toLowerCase().contains(searchQuery))
      //         .where((pet) => pet.age == minAge)
      //         // .take(5)
      //         .toList();

      // emit(PetsLoaded(
      //     pets: filteredPets,
      //     // hasMore: allPets.length > 5,
      //     selectedIndex: selectedIndex));
      add(ChangeCategory(selectedIndex));
    });

    on<ChangeCategory>((event, emit) {
      selectedIndex = event.index;
      allPets = selectedIndex == 0 ? cats : dogs;
      page = 1;
      List<PetsModel> filteredPets = (minAge == 0)
          ? allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .toList()
          : allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .where((pet) => pet.age == minAge)
              // .take(5)
              .toList();

      emit(PetsLoaded(
          pets: filteredPets,
          // hasMore: allPets.length > 5,
          selectedIndex: selectedIndex));
    });

    on<LoadMorePets>((event, emit) {
      if (isLoading) return;
      isLoading = true;
      Future.delayed(const Duration(seconds: 1));
      List<PetsModel> newPets = (minAge == 0)
          ? allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .toList()
          : allPets
              .where((pet) => pet.name.toLowerCase().contains(searchQuery))
              .where((pet) => pet.age == minAge)
              // .take(5)
              .toList();

      page++;
      isLoading = false;

      if (state is PetsLoaded) {
        final currentState = state as PetsLoaded;
        emit(PetsLoaded(
            pets: [...currentState.pets, ...newPets],
            // hasMore: newPets.isNotEmpty,
            selectedIndex: selectedIndex));
      }
    });
  }
}

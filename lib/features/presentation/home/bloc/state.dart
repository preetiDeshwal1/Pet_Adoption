import '../../../model/pet_model.dart';

abstract class PetsState {
  const PetsState();
}

class PetsLoading extends PetsState {}

class PetsLoaded extends PetsState {
  final List<PetsModel> pets;
  // final bool hasMore;
  int selectedIndex;
  PetsLoaded(
      {required this.pets, /*this.hasMore = true,*/ required this.selectedIndex});
}

class PetsError extends PetsState {
  final String message;
  const PetsError(this.message);
}

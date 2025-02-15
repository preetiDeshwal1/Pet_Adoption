abstract class PetsEvent {
  const PetsEvent();
}

class LoadPets extends PetsEvent {}

class SearchPets extends PetsEvent {
  final String query;
  const SearchPets(this.query);
}

class FilterPetsByAge extends PetsEvent {
  final int minAge;
  const FilterPetsByAge(this.minAge);
}

class SlectPetIndexEvent extends PetsEvent {
  int index;
  SlectPetIndexEvent(this.index);
}

class ChangeCategory extends PetsEvent {
  final int index;
  const ChangeCategory(this.index);
}

class LoadMorePets extends PetsEvent {}

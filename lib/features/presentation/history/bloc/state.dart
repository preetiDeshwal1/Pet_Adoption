abstract class PetsDetailState {
  const PetsDetailState();
}

class PetsLoading extends PetsDetailState {}

class PetsisAdoptedLoading extends PetsDetailState {
  bool adopted;
  PetsisAdoptedLoading(this.adopted);
}

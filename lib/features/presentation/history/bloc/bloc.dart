import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/features/model/history_model.dart';

import 'event.dart';
import 'state.dart';

class PetsDetalisBloc extends Bloc<PetsDetailEvent, PetsDetailState> {
  List<PetsHistoryModel> allPets = [];
  bool adopted = false;
  PetsDetalisBloc() : super(PetsLoading()) {
    on<IsPetAdopted>((event, emit) {
      adopted = ((history
                  .where((pet) =>
                      pet.name.toLowerCase().contains(event.name.toLowerCase()))
                  .toList())
              .isEmpty)
          ? false
          : true;
      emit(PetsisAdoptedLoading(adopted));
    });

    on<AdoptedEvent>((event, emit) {
      history.add(event.data);
      add(IsPetAdopted(event.data.name));
    });
  }
}

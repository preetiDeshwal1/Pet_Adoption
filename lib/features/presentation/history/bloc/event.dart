import 'package:petadoption/features/model/history_model.dart';

abstract class PetsDetailEvent {
  const PetsDetailEvent();
}

class IsPetAdopted extends PetsDetailEvent {
  String name;
  IsPetAdopted(this.name);
}

class AdoptedEvent extends PetsDetailEvent {
  final PetsHistoryModel data;
  const AdoptedEvent(this.data);
}

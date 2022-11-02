import 'package:jacek_janur_zadanie/pets/models/pet_model.dart';

abstract class PetsBlocEvent {}

class LoadPetsEvent extends PetsBlocEvent {}
class LoadingPetsEvent extends PetsBlocEvent {}
class LoadedPetsEvent extends PetsBlocEvent {}
class UpdatePetsFilterEvent extends PetsBlocEvent {
  String filter;
  UpdatePetsFilterEvent({required this.filter});
}
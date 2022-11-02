import '../models/pet_model.dart';

abstract class PetsBlocState {}

class PetsBlocStateEmpty extends PetsBlocState {}

class PetsBlocStateLoading extends PetsBlocState {}

class PetsBlocStateError extends PetsBlocState {}

class PetsBlocLoaded extends PetsBlocState {
  PetsBlocLoaded({required this.pets, this.filter=''});
  List<Pet> pets;
  String filter;
}
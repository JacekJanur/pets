import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jacek_janur_zadanie/pets/bloc/pets_event.dart';
import 'package:jacek_janur_zadanie/pets/bloc/pets_state.dart';
import 'package:jacek_janur_zadanie/pets/models/pet_model.dart';
import 'package:jacek_janur_zadanie/pets/repository/pet_repository.dart';

class PetsBloc extends Bloc<PetsBlocEvent, PetsBlocState>
{
  PetsBloc({required this.petRepository}) : super(PetsBlocStateEmpty()) {
    on<LoadPetsEvent>(_loadPetsEvent);
    on<UpdatePetsFilterEvent>(_updatePetsFilterEvent);
  }
  final PetRepository petRepository;

  void _loadPetsEvent(LoadPetsEvent event, emit) async{
    emit(PetsBlocStateLoading());
    List<Pet> pets = await petRepository.getPets();
    pets.isEmpty ? emit(PetsBlocStateEmpty()) : emit(PetsBlocLoaded(pets: pets));
  }

  void _updatePetsFilterEvent(UpdatePetsFilterEvent event, emit) async{
    PetsBlocState actualState = state;
    if(actualState is PetsBlocLoaded)
      {
        emit(PetsBlocLoaded(pets: actualState.pets, filter: event.filter));
      }
  }
}
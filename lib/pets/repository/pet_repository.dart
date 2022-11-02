import 'dart:convert';

import 'package:jacek_janur_zadanie/pets/api/pets_api.dart';
import 'package:jacek_janur_zadanie/pets/models/pet_model.dart';

class PetRepository{
  PetsAPI api;
  PetRepository({required this.api});

  Future<List<Pet>> getPets() async{
    List<Pet> pets = [];
    try{
      dynamic response = await api.getRawPets().timeout(const Duration(seconds: 10));
      return petsFromJson(response);
    }
    catch(error)
    {
      print(error);
    }
    return pets;
  }

}
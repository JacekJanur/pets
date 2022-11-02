import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jacek_janur_zadanie/pets/api/pets_api.dart';
import 'package:jacek_janur_zadanie/pets/bloc/pets_bloc_import.dart';
import 'package:jacek_janur_zadanie/pets/repository/pet_repository.dart';
import 'package:jacek_janur_zadanie/pets/view/home_page_pets.dart';
import 'package:jacek_janur_zadanie/pets_details/view/detail_page_pets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PetRepository petRepository = PetRepository(api: PetsAPI());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetsBloc(petRepository: petRepository), // Nie trzeba dawac globalnego dostępu, można lokalnie na widok. W tej aplikacji niech będzie globalnie
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jacek Janur',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePagePets(),
          '/detail': (context) => const DetailPagePets(),
        },
      ),
    );
  }
}

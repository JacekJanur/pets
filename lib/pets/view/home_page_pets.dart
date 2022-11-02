import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jacek_janur_zadanie/pets/bloc/pets_bloc_import.dart';
import 'package:jacek_janur_zadanie/pets/widgets/pet_item_list.dart';
import 'package:jacek_janur_zadanie/utils/contains_ignore_case.dart';
import 'package:jacek_janur_zadanie/utils/styles.dart';
import '../models/pet_model.dart';

class HomePagePets extends StatefulWidget {
  const HomePagePets({Key? key}) : super(key: key);

  @override
  State<HomePagePets> createState() => _HomePagePetsState();
}

class _HomePagePetsState extends State<HomePagePets> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PetsBloc>(context).add(LoadPetsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsBloc, PetsBlocState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              const Text("Pets repository", style: CustomTextStyle.header),
              if (state is PetsBlocLoaded)
                Text(
                    'Nice, we found ${state.pets.where((element) => containsIgnoreCase(element.name, state.filter) || containsIgnoreCase(element.breed, state.filter)).length} pets',
                    style: CustomTextStyle.subheader),
            ],
          ),
        ),
        body: state is PetsBlocStateLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: state is! PetsBlocLoaded
                          ? const SizedBox()
                          : _PetsListViewBuilder(
                              pets: state.pets
                                  .where((element) =>
                                      containsIgnoreCase(
                                          element.name, state.filter) ||
                                      containsIgnoreCase(
                                          element.breed, state.filter))
                                  .toList(),
                            ),
                    ),
                    const _SearchBarPet(),
                  ],
                ),
              ),
      );
    });
  }
}

class _SearchBarPet extends StatelessWidget {
  const _SearchBarPet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Icon(
            Icons.search,
            size: 50,
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 16),
            child: TextFormField(
              onChanged: (text) {
                BlocProvider.of<PetsBloc>(context)
                    .add(UpdatePetsFilterEvent(filter: text));
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Wpisz nazwe',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PetsListViewBuilder extends StatelessWidget {
  List<Pet> pets;

  _PetsListViewBuilder({Key? key, required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/detail', arguments: pets[index]);
              },
              child: PetItemList(
                name: pets[index].name,
                breed: pets[index].breed,
              ),
            ),
            const Divider(thickness: 3),
          ],
        );
      },
    );
  }
}

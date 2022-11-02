import 'package:flutter/material.dart';

import '../../pets/models/pet_model.dart';
import '../../utils/styles.dart';

class DetailPagePets extends StatelessWidget {
  const DetailPagePets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pet pet = ModalRoute.of(context)!.settings.arguments as Pet;
    //moglbym tez wyslac index i wczytac z State przez index
    //dodatkowo mozna osobnego bloca przechowujacego tylko 1 zwierze, ale tutaj tak najprosciej KISS
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(pet.name, style: CustomTextStyle.header,),
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Breed:", style: CustomTextStyle.header,),
            Text(pet.breed, style: CustomTextStyle.subheader.copyWith(fontSize: 36))
          ],
        ),
      ),
    );
  }
}

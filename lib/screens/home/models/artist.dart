import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

/// Flutter Objects MyFlutterApp
/// This carpet must contains Object references.

class Painting{
  String name;
  String imagePath;
  int? year;
  String? medium;
  double? dx;
  double? dy;

  Painting({required this.name, required this.imagePath, this.year, this.medium, this.dx, this.dy});
}

class VanGogh {
  String name;
  String lastName;
  DateTime birthDate;
  DateTime deathDate;
  String description;
  List<Painting> paintings;

  VanGogh({
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.deathDate,
    required this.description,
    required this.paintings
  });

  VanGogh.create():
      name = 'Vincent',
      lastName = 'van Gogh',
      birthDate = DateTime(1853, 3, 30),
      deathDate = DateTime(1890, 7, 29),
      description = 'Vicent Willem van Gogh was a Dutch Post-\n'
                    'implessionist painter who is among the most\n'
                    'famous and influential in the history of\n'
                    'Western art.',
      paintings = [
        Painting(name: 'The Night\nCafé' , imagePath: Assets.images.vincentVanGogh.painting1.path),
        Painting(name: 'The Starry\nNight' , imagePath: Assets.images.vincentVanGogh.painting2.path),
        Painting(name: 'The Potatoe\nEaters' , imagePath: Assets.images.vincentVanGogh.painting3.path),
        Painting(name: 'Irises' , imagePath: Assets.images.vincentVanGogh.painting4.path),
        Painting(name: 'Starry Night\nOver the River' , imagePath: Assets.images.vincentVanGogh.painting5.path),
        Painting(name: 'Self-Portrait' , imagePath: Assets.images.vincentVanGogh.painting6.path),
        Painting(name: 'The Nap' , imagePath: Assets.images.vincentVanGogh.painting7.path),
      ];


  // Every artist has a category inside his own projets,
  // for example Da Vinci was an Writer, Drawer and Sculptor at the same time

  //@TODO
  int get century {
    int c = birthDate.year ~/ 100;
    int r = birthDate.year % 100;

    if(r == 0) { return c; }
    else       { return c+1; }
  }

}
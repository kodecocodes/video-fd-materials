import 'dart:developer' as dev;
import 'package:flutter/material.dart';

import '../controllers/doggie_provider.dart';
import '../models/dog.dart';
import '../models/forever_home.dart';
import 'dog_details.dart';
import 'dog_tile.dart';

class DogScreen extends StatefulWidget {
  const DogScreen({Key? key}) : super(key: key);

  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who\'s a good boy?'),
      ),
      body: Column(children: [
        Expanded(child: _buildForeverHome()),
        SafeArea(child: _buildDogPicker()),
      ]),
    );
  }

  Widget _buildForeverHome() {
    final dog = DoggieProvider.of(context).home!.dog;
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            child: child,
            scale: animation,
          ),
        );
      },
      child: DogDetails(key: ValueKey(dog), dog: dog),
    );
  }

  Widget _buildDogPicker() {
    final controller = DoggieProvider.of(context);
    final dogs = controller.dogs;

    return Row(
      children: <Widget>[
        for (Dog dog in dogs)
          Expanded(
            child: DogTile(
              dog: dog,
              selected: controller.home!.dog == dog,
              onTapped: () {
                setState(() {
                  controller.home = ForeverHome(dog: dog);
                });
                dev.log('Some long message');
              },
            ),
          )
      ],
    );
  }
}

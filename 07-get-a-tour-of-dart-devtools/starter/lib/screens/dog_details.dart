import 'package:flutter/material.dart';

import '../controllers/doggie_provider.dart';
import '../models/dog.dart';

class DogDetails extends StatelessWidget {
  const DogDetails({
    Key? key,
    required this.dog,
  }) : super(key: key);

  final Dog dog;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            dog.name,
            style: theme.headline6,
          ),
          Text(dog.breed),
          Text('Age ${dog.age}'),
          Expanded(
            child: GestureDetector(
              onTap: () => _doggieTapped(context),
              child: Image.asset(dog.assetPath),
            ),
          ),
          if (dog.credit != null) ...[
            Text(
              'Photo Credit',
              style: theme.subtitle1,
            ),
            Text(dog.credit ?? '')
          ]
        ],
      ),
    );
  }

  void _doggieTapped(BuildContext context) {
    final home = DoggieProvider.of(context).home;
    home!.pets++;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'You have given ${dog.name} ${home.pets} pets',
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      duration: const Duration(seconds: 2),
    ));
  }
}

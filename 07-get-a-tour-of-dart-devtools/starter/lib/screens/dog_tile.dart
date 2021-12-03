import 'package:flutter/material.dart';

import '../models/dog.dart';

class DogTile extends StatelessWidget {
  const DogTile(
      {Key? key,
      required this.dog,
      this.selected = false,
      required this.onTapped})
      : super(key: key);

  final Dog dog;
  final bool selected;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTapped,
        child: Column(
          children: <Widget>[
            Container(
              decoration: selected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 3,
                      ),
                    )
                  : null,
              child: _buildDogImage(),
            ),
            _buildDogName(context)
          ],
        ),
      ),
    );
  }

  Text _buildDogName(BuildContext context) {
    return Text(
      dog.name,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          color: selected ? Theme.of(context).colorScheme.secondary : null),
    );
  }

  Widget _buildDogImage() {
    return ClipOval(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Image.asset(
          dog.assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

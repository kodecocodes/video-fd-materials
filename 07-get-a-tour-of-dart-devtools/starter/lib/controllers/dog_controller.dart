import '../models/dog.dart';
import '../models/forever_home.dart';

class DogController {
  final dogs = [
    const Dog(
        name: 'Rooney',
        assetPath: 'assets/images/nikolay-tchaouchev-FbG7KdgPSjs-unsplash.jpg',
        age: 3,
        breed: 'Shih Tsu',
        credit: 'Photo by Nikolay Tchaouchev on Unsplash'),
    const Dog(
      name: 'Oliver',
      assetPath: 'assets/images/benjamin-ilchmann-FE2EaKIcSr8-unsplash.jpg',
      age: 8,
      breed: 'Golden Retriever',
      credit: 'Photo by Benjamin Ilchmann on Unsplash',
    ),
    const Dog(
      name: 'Amy',
      assetPath:
          'assets/images/sebastian-coman-travel-JgKfmp9uq9w-unsplash.jpg',
      age: 4,
      breed: 'Miniature Schnauzer',
      credit: 'Photo by Sebastian Coman Travel on Unsplash',
    ),
  ];

  ForeverHome? home;

  DogController() {
    home = ForeverHome(
      dog: dogs.first,
      pets: 0,
    );
  }
}

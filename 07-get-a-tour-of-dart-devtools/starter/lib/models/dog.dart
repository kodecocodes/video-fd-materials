class Dog {
  final String name;
  final String assetPath;
  final int age;
  final String breed;
  final bool goodBoi;
  final String? credit;

  const Dog({
    required this.name,
    required this.assetPath,
    required this.age,
    required this.breed,
    this.credit,
    this.goodBoi = true,
  }) : assert(goodBoi == true, 'All dogs are good boys!');

  factory Dog.fromJson(Map json) {
    final name = json['name'] as String;
    final assetPath = json['assetPath'] as String;
    final age = json['age'] as int;
    final breed = json['breed'] as String;
    final goodBoi = json['goodBoi'] as bool;
    final credit = json['credit'] as String;

    return Dog(
      name: name,
      assetPath: assetPath,
      age: age,
      breed: breed,
      goodBoi: goodBoi,
      credit: credit,
    );
  }
}

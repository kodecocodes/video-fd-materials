/*
 * Copyright (c) 2020 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * This project and source code may use libraries or frameworks that are
 * released under various Open-Source licenses. Use of those libraries and
 * frameworks are governed by their own individual licenses.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:meta/meta.dart';

class Dog {
  final String name;
  final String assetPath;
  final int age;
  final String breed;
  final bool goodBoi;
  final String credit;

  const Dog({
    @required this.name,
    @required this.assetPath,
    @required this.age,
    @required this.breed,
    this.credit,
    this.goodBoi = true,
  })  : assert(name != null),
        assert(assetPath != null),
        assert(age != null),
        assert(goodBoi == true, 'All dogs are good boys!');

  factory Dog.fromJson(Map json) {
    final name = json['name'];
    final assetPath = json['assetPath'];
    final age = json['age'];
    final breed = json['breed'];
    final goodBoi = json['goodBoi'];
    final credit = json['credit'];

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

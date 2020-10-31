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

import 'package:flutter_debugging/controllers/doggie_provider.dart';
import 'package:flutter_debugging/models/dog.dart';
import 'package:flutter_debugging/models/forever_home.dart';
import 'package:flutter_debugging/screens/dog_details.dart';
import 'package:flutter_debugging/screens/dog_tile.dart';
import 'package:flutter/material.dart';

class DogScreen extends StatefulWidget {
  @override
  _DogScreenState createState() => _DogScreenState();
}

class _DogScreenState extends State<DogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who\'s a good boy?'),
      ),
      body: Column(children: [
        Expanded(child: _buildForeverHome()),
        SafeArea(child: _buildDogPicker()),
      ]),
    );
  }

  Widget _buildForeverHome() {
    final dog = DoggieProvider.of(context).home.dog;
    return AnimatedSwitcher(
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      duration: Duration(milliseconds: 100),
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
              selected: controller.home.dog == dog,
              onTapped: () {
                setState(() {
                  controller.home = ForeverHome(dog: dog);
                });
              },
            ),
          )
      ],
    );
  }
}

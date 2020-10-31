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

import 'package:flutter_debugging/models/dog.dart';
import 'package:flutter/material.dart';

class DogTile extends StatelessWidget {
  const DogTile(
      {Key key,
      @required this.dog,
      this.selected = false,
      @required this.onTapped})
      : super(key: key);

  final Dog dog;
  final bool selected;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onTapped,
        child: Column(
          children: <Widget>[
            Container(
              decoration: selected
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).accentColor, width: 3))
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
      style: Theme.of(context).textTheme.subtitle1.copyWith(
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          color: selected ? Theme.of(context).accentColor : null),
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

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>  with TickerProviderStateMixin  {
  List<Color> _colors = [
    //Get list of colors
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];
  int _currentIndex = 0;
  int _nextIndex = 1;
  var ans = '';

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationAgain();


  }
  animationAgain(){

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );
    animationController.forward();

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: display(),
    );
  }

  _onChanged() {
    animationAgain();
    //update with a new color when the user taps button
    int _colorCount = _colors.length;

    setState(() {
      if (_nextIndex == _colorCount - 1) {
        _nextIndex = 0;
        _currentIndex = _colorCount - 1;
      } else if (_currentIndex == _colorCount - 1) {
        _currentIndex = 0;
        _nextIndex = _colorCount - 3;
      } else {
        _currentIndex += 1;
        _nextIndex += 1;
      }
    });
  }

  Widget display() {
    return GestureDetector(
      onTap: _onChanged,

      child: Container(
        // color: _colors[_currentIndex];
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 9,
              child:AnimatedContainer(
                  constraints: BoxConstraints.expand(),
                  curve: Curves.decelerate,
                  duration: Duration(seconds: 1),
                  color: _colors[_currentIndex],
                  child: Align(
                    alignment: Alignment.center,
                    child: _changeNumber(),
                  )),
            ),
            Expanded(
              flex: 1,
              child: AnimatedContainer(
                curve: Curves.decelerate,
                duration: Duration(seconds: 1),
                color: _colors[_nextIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _changeNumber() {
    setState(() {
      var rndm = new Random();
      var num = rndm.nextInt(12);
     // print(num + 1);
      ans = (num + 1).toString();
    });
    return RotationTransition(
        turns: animation,
        child:Text(
        ans,
      style: TextStyle(color: Colors.white,fontSize: 90,
      shadows: [Shadow(
        color: Colors.black,
        blurRadius: 10.0,
        offset: Offset(5.0, 5.0),
      )]
      ),
    ));
  }
}

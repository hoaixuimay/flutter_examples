import 'package:flutter/material.dart';
import 'package:custom_loader/animations.dart';

class BarLoadingScreen extends StatefulWidget {
  @override
  _BarLoadingScreenState createState() => _BarLoadingScreenState();
}

class _BarLoadingScreenState extends State<BarLoadingScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 3000)
    );
    tween = new Tween<double>(begin: 0.0, end: 1.00);
    _controller.repeat().orCancel;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Animation<double> get stepOne => tween.animate(
    new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
            0.0,
            0.125,
            curve: Curves.linear
        ),
    ),
  );
  Animation<double> get stepTwo => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.125,
          0.25,
          curve: Curves.linear
      ),
    ),
  );
  Animation<double> get stepThree => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.25,
          0.375,
          curve: Curves.linear
      ),
    ),
  );
  Animation<double> get stepFour => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.375,
          0.5,
          curve: Curves.linear
      ),
    ),
  );
  Animation<double> get stepFive => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.5,
          0.625,
          curve: Curves.linear
      ),
    ),
  );
  Animation<double> get stepSix => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.625,
          0.75,
          curve: Curves.linear
      ),
    ),
  );
  Animation<double> get stepSeven => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.75,
          0.875,
          curve: Curves.linear
      ),
    ),
  );
  Animation<double> get stepEight => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
          0.875,
          1.0,
          curve: Curves.linear
      ),
    ),
  );

  Widget get forwardStaggerredAnimation {
    return new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new PivotBar(
            alignment: FractionalOffset.centerLeft,
              controller: _controller,
              animations: [
                stepOne,
                stepTwo
              ],
              marginRight: 0.0,
              marginLeft: 0.0,
              isClockwise: true
          ),
          new PivotBar(
              controller: _controller,
              animations: [
                stepThree,
                stepEight
              ],
              marginRight: 0.0,
              marginLeft: 0.0,
              isClockwise: false
          ),
          new PivotBar(
              controller: _controller,
              marginLeft: 32.0,
              marginRight: 0.0,
              animations: [
                stepFour,
                stepSeven
              ],
              isClockwise: true
          ),
          new PivotBar(
              controller: _controller,
              marginLeft: 32.0,
              marginRight: 0.0,
              animations: [
                stepFive,
                stepSix
              ],
              isClockwise: false
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: forwardStaggerredAnimation,
    );
  }
}

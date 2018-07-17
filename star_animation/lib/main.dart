import 'package:flutter/material.dart';
import 'package:star_animation/girl.dart';
import 'package:star_animation/sky.dart';
import 'package:star_animation/star.dart';
import 'package:star_animation/shooting_star.dart';
import 'package:star_animation/planets.dart';

void main() => runApp(new StarsAnimation());

class StarsAnimation extends StatefulWidget {
  @override
  StarsAnimationState createState() {
    return new StarsAnimationState();
  }
}

class StarsAnimationState extends State<StarsAnimation>
    with TickerProviderStateMixin {

  AnimationController _bobAnimationController;
  AnimationController _slowAnimationController;
  AnimationController _mdSpeedAnimationController;
  AnimationController _fastAnimationController;

  Animation<double> starAnimation;


  @override
  initState() {
    super.initState();
    _bobAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _slowAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );
    _mdSpeedAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _fastAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _startBobAnimation();
    _slowAnimationController.repeat().orCancel;
    _mdSpeedAnimationController.repeat().orCancel;
    _fastAnimationController.repeat().orCancel;
  }

  _startBobAnimation() {
    var animation =
    new Tween(begin: 0.0, end: 50.0).animate(_bobAnimationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _bobAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _bobAnimationController.forward();
      }
    });
    _bobAnimationController.forward();
  }

  @override
  dispose() {
    _slowAnimationController?.dispose();
    _mdSpeedAnimationController?.dispose();
    _fastAnimationController?.dispose();
    _bobAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new Stack(
          children: <Widget>[
            // Dark Sky
            new SkyCircle(
              size: 250.0,
              top: -30.0,
              left: -30.0,
              radius: 120.0,
              animationController: _mdSpeedAnimationController,
            ),
            new SkyCircle(
                size: 250.0,
                top: -30.0,
                left: 150.0,
                radius: 120.0,
                animationController: _mdSpeedAnimationController),
            new SkyCircle(
                size: 220.0,
                top: 160.0,
                left: 10.0,
                radius: 107.0,
                animationController: _mdSpeedAnimationController),
            new SkyCircle(
                size: 220.0,
                top: 160.0,
                left: 140.0,
                radius: 107.0,
                animationController: _mdSpeedAnimationController),
            new SkyCircle(
                size: 170.0,
                top: 340.0,
                left: 40.0,
                radius: 81.0,
                animationController: _mdSpeedAnimationController),
            new SkyCircle(
                size: 170.0,
                top: 340.0,
                left: 140.0,
                radius: 81.0,
                animationController: _mdSpeedAnimationController),
            new SkyPoint(size: 180.0, top: 500.0, left: 125.0),

            // Stars
            new Star(top: 150.0, left: 150.0),
            new Star(top: 10.0, left: 10.0),
            new Star(top: 83.0, left: 303.0),
            new Star(top: 287.0, left: 287.0),
            new Star(top: 367.0, left: 100.0),
            new Star(top: 447.0, left: 240.0),
            new Star(top: 302.0, left: 160.0),
            new Star(top: 165.0, left: 60.0),
            new Star(top: 468.0, left: 60.0),
            new Star(top: 538.0, left: 150.0),

            //Shooting Stars
            new ShootingStar(
              top: 280.0,
              left: 10.0,
              animationStep: new CurvedAnimation(
                parent: _mdSpeedAnimationController,
                curve: new Interval(0.0, 0.3),
              ),
            ),
            new ShootingStar(
              top: 100.0,
              left: 10.0,
              animationStep: new CurvedAnimation(
                parent: _mdSpeedAnimationController,
                curve: new Interval(0.3, 0.7),
              ),
            ),
            new ShootingStar(
              top: 470.0,
              left: 59.0,
              width: 372.0,
              animationStep: new CurvedAnimation(
                parent: _mdSpeedAnimationController,
                curve: new Interval(0.4, 0.6),
              ),
            ),

            // Planets
            // Top Left Blue
            new Planet(
              size: 50.0,
              top: 40.0,
              left: 60.0,
              animationController: _fastAnimationController,
              pivotAlignment: FractionalOffset.center,
              gradient: new LinearGradient(
                  colors: [new Color(0xFF00c6fb), new Color(0xFF005bea)]),
            ),
            // Top Right Orange/Yellow
            new Planet(
              size: 45.0,
              top: 150.0,
              left: 250.0,
              pivotAlignment: FractionalOffset.centerLeft,
              animationController: _slowAnimationController,
              gradient: new LinearGradient(
                  colors: [new Color(0xFFf83600), new Color(0xFFf9d423)]),
            ),
            // Pink with Rings / Left
            new Planet(
              size: 65.0,
              top: 245.0,
              left: 45.0,
              pivotAlignment: FractionalOffset.center,
              animationController: _bobAnimationController,
              ringWidth: 10.0,
              color: new Color(0xFFff0844),
              gradient: new LinearGradient(
                  colors: [new Color(0xFFff0844), new Color(0xFFffb199)]),
            ),
            //Purple - bottom left
            new Planet(
              reverse: true,
              size: 65.0,
              top: 365.0,
              left: 115.0,
              pivotAlignment: FractionalOffset.centerRight,
              animationController: _mdSpeedAnimationController,
              color: new Color(0xFFff0844),
              gradient: new LinearGradient(
                  colors: [new Color(0xFFcc208e), new Color(0xFF6713d2)]),
            ),

            // girl
            new Head(size: 70.0, top: 480.0, left: 220.0),
            new Hair(size: 120.0, top: 490.0, left: 245.0),
            new Arm(size: 100.0, top: 515.0, left: 263.0, rotate: 35.0),
            new Body(size: 180.0, top: 500.0, left: 265.0),
            new Leg(
                height: 80.0,
                width: 60.0,
                top: 548.0,
                left: 248.0,
                rotate: -33.0),
            new Shoe(size: 30.0, top: 600.0, left: 280.0, rotate: -24.0),
            new Toe(size: 35.0, top: 597.0, left: 277.0, rotate: 0.0),
            new Pants(size: 60.0, top: 581.0, left: 296.0),
            new Pencil(size: 60.0, top: 555.0, left: 206.0, rotate: -15.0),
          ],
        ),
      ),
    );
  }
}



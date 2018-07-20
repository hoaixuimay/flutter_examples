import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class GoogleAuthButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedCallback;

  GoogleAuthButton({@required this.buttonText, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressedCallback,
      color: Colors.white,
      child: new Container(
        width: 230.0,
        height: 50.0,
        alignment: Alignment.center,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: new Image.network(
                'https://diylogodesigns.com/blog/wp-content/uploads/2016/04/google-logo-icon-PNG-Transparent-Background.png',
                width: 30.0,
              ),
            ),
            new Text(
              buttonText,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}

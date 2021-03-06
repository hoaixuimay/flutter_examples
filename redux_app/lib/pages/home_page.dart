import 'package:flutter/material.dart';
import 'package:redux_app/containers/counter/counter.dart';
import 'package:redux_app/containers/counter/increase_counter.dart';
import 'package:redux_app/containers/auth_button/auth_button_container.dart';
import 'package:redux_app/containers/user_profile/user_profile.dart';

class HomePage extends StatelessWidget {
  // We passed it a title from the app root, so we have to
  // set up the class to accept that arg.
  final String title;
  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    // Scaffold is almost always going to be your top-level widget
    // on each page.
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new GoogleAuthButtonContainer(),
              new Padding(																			// new
                padding: const EdgeInsets.symmetric(vertical: 16.0),  // new
                child: new CurrentUserProfile(),								// new
              ),

              new Text(
                  "You have pushed the button many times",
              ),
              new Counter(),
            ],
          ),
        ),
      ),
      floatingActionButton: new IncreaseCountButton(),
    );
  }
}

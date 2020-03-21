import 'package:flutter/material.dart';
import 'package:postwhatuneedapp/newPost-Screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostWhatUNeed'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          Center(
            child: Container(
                child: Row(
              children: <Widget>[
                MenuBoxItem(Icons.message, 'Neue Anfrage'),
                MenuBoxItem(Icons.search, 'Suche Anfragen')
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )),
          ),
        ],
      ),
    );
  }
}

class MenuBoxItem extends StatelessWidget {
  double groesse = 180;

  final IconData icon;
  final String text;

  MenuBoxItem(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: groesse,
      width: groesse,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: (){ Navigator.of(context).pushNamed(NewPostScreen.ROUTENAME);},
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  size: groesse / 2,
                ),
                Text(text)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
          color: Theme.of(context).accentColor,
          elevation: 40,
        ),
      ),
    );
  }
}

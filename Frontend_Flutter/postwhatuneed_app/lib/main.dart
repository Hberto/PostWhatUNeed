import 'package:flutter/material.dart';
import 'package:postwhatuneedapp/loggin_screen.dart';

import 'package:provider/provider.dart';

import 'auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PostWhatUNeed',
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange
          ),
          home: AuthScreen(),
//
//        initialRoute: "/",
          routes: {
//            ProductsOverviewScreen.ROUTNAME: (ctx) => ProductsOverviewScreen(),

          },
        ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PostWhatUNeed"),
      ),
      body: Center(
        child: Text(
          'PoastWhatUNeed',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

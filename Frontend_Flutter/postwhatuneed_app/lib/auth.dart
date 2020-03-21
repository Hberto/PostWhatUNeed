import 'dart:async';
import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';



///Modul zur Verarbeitung des Login
///
/// !!!!!!!MUSS NOCH STARK ÜBERARBEITET WERDEN!!!!!!!
///
/// von Andreas B.


class Auth with ChangeNotifier {


  String _token;
  DateTime _expiryDate;
  String _userId;

  Timer _authTimer;

  String get userId => _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter((DateTime.now())) &&
        _token != null) {
      return _token;
    }
    return null;
  }

//  Future<void> authenticate(String email, String password, bool signIn) async {
//    try {
//      http.Response response = await http.post(
//        signIn ? signInUrl : signUpUrl,
//        body: json.encode({
//          "email": email,
//          "password": password,
//          "returnSecureToken": true,
//        }),
//      );
//
//      var responseData = json.decode(response.body);
//
//      if (responseData["error"] != null) {
////        print("Error in responseDate (login)");
////        print(responseData["error"]["message"]);
//        throw HttpException(responseData["error"]["message"]);
//      }
//
//      _token = responseData["idToken"];
//      _userId = responseData["localId"];
//      _expiryDate = DateTime.now()
//          .add(Duration(seconds: int.parse(responseData["expiresIn"])));
//      _autoLogout();
//      notifyListeners();
//
//      //Speichern der Daten lokal auf dem Handy
//      final prefs = await SharedPreferences.getInstance();
//      final userData = json.encode({
//        //Daten werden zu einem inzigen String umgewandelt
//        "token": _token,
//        "userId": _userId,
//        "expiryDate": _expiryDate.toIso8601String()
//      });
//      prefs.setString("userData", userData); //Daten werden gespeichert.
//
//    } on Exception catch (e) {
//      throw e;
//    }
//  }

//  Future<void> signIn(String email, String password) async {
//    return authenticate(email, password, true);
//  }
//
//  Future<void> signUp(String email, String password) async {
//    return authenticate(email, password, false);
//  }

//  Future<bool> tryAutoLogin() async {
//    final prefs = await SharedPreferences.getInstance();
//    if (!prefs.containsKey("userData")) {
//      return false;
//    }
//    final extractedData =
//    json.decode(prefs.getString("userData")) as Map<String, dynamic>;
//    final expiryDate = DateTime.parse(extractedData["expiryDate"]);
//
////    print("Token: " + extractedData["token"]);
//    if (expiryDate.isBefore(DateTime.now())) {
//      return false;
//    }
//
//    _token = extractedData["token"];
//    _userId = extractedData["userId"];
//    _expiryDate = expiryDate;
//    _autoLogout();
//    return true;
//  }

  /// Nutzer ausloggen
  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("userData");
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    var zeitspanne = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: zeitspanne),
        logout); //Nach einer bestimmten Zeit wird logout() aufgerufen.
  }
}

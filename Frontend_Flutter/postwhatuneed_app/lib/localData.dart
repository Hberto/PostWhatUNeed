
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


///Modul zur Verwaltung der Lokalen Datan
///
/// von Andreas B.


class LocalData{

  String userName = '';
  String userId = '';
  List favPLZ = [];



  ///Lädt die Nuter-Daten vom Handy
  Future<void> loadLocalData() async{
    final data = await SharedPreferences.getInstance();
    if (!data.containsKey("userData")) {
      return false;
    }
    final extractedData =
    json.decode(data.getString("userData")) as Map<String, dynamic>;

    userName = extractedData['userName'];
    userId = extractedData['userId'];
    favPLZ = extractedData['favPLZ'];
  }

  ///Speichert die Nutzer-Daten auf dem Handy
  Future<void> setLocalData() async{
    final data = await SharedPreferences.getInstance();

    //Speichern der Daten lokal auf dem Handy
    final userData = json.encode({
      "userName": userName,
      "userId": userId,
      "favPLZ": favPLZ,
    });
    data.setString("userData", userData);
  }


}
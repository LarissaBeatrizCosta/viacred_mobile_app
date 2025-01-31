import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

///Classe responsável pelo banco
class DbController {
  ///Instancia o banco de dados
  FirebaseFirestore db = FirebaseFirestore.instance;

  ///Adiciona a avaliação no firebase
  Future<void> insertRates({
    int? numberRate,
    int? locationValue,
    int? collaboratorValue,
    int? timeValue,
    String? commentValue,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(Constants.userKey);
      db.collection('cooperatives').doc(token).collection('rates').add({
        'numberRate': numberRate,
        'locationValue': locationValue,
        'collaboratorValue': collaboratorValue,
        'timeValue': timeValue,
        'commentValue': commentValue,
        'time': DateTime.now(),
      });
    } catch (e) {
      Exception(e);
      rethrow;
    }
  }
}

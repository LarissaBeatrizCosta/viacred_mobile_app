import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/snack_bar.dart';

///Controller da HomeView
class RateNumberController extends ChangeNotifier {
  int? _valueRate;

  ///Variavel responsavel pelo valor da avaliação
  int? get valueRate => _valueRate;

  ///Instancia o banco de dados
  FirebaseFirestore db = FirebaseFirestore.instance;

  ///Função responsável pela atualização do valor da avaliação
  void rateNumberValue(int valor) {
    _valueRate = valor;
    notifyListeners();
  }

  ///Adiciona a avaliação no firebase
  Future<void> insertRateValue(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(Constants.userKey);
      db.collection('cooperatives').doc(token).collection('grade_rate').add({
        'valueRate': valueRate,
        'time': DateTime.now(),
      });
      Navigator.pushReplacementNamed(context, '/rateStars');

    } catch (e) {
      SnackBarHelp().showErrorSnackbar();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/snack_bar.dart';

///Controller da RateStars
class RateStarsController extends ChangeNotifier {
  ///Instancia o banco de dados
  FirebaseFirestore db = FirebaseFirestore.instance;

  //todo: retirar essas repetiçoes
  ///Estrelas ponto de atendimento
  int _locationValue = 0;

  ///Estrelas colaboradores
  int _collaboratorValue = 0;

  ///Estrelas tempo
  int _timeValue = 0;

  ///ponto de atendimento
  int get locationValue => _locationValue;

  ///Estrelas colaboradores
  int get collaboratorValue => _collaboratorValue;

  ///Estrelas tempo
  int get timeValue => _timeValue;

  ///Valor da avaliação 1 - posto de atendimento
  void getLocationValue(int valor) {
    _locationValue = valor + 1;
    notifyListeners();
  }

  ///Valor da avaliação 2 -colaboradores
  void getCollaboratorsValue(int valor) {
    _collaboratorValue = valor + 1;
    notifyListeners();
  }

  ///Valor da avaliação 3 -tempo
  void getTimeValue(int valor) {
    _timeValue = valor + 1;
    notifyListeners();
  }

  ///Adiciona a avaliação de estrelas do posto de atendimento no firebase
  Future<void> insertLocationRate(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(Constants.userKey);
      db
          .collection('cooperatives')
          .doc(token)
          .collection('star_rate_local')
          .add({
        'valueRate': locationValue,
        'time': DateTime.now(),
      });

      db
          .collection('cooperatives')
          .doc(token)
          .collection('star_rate_collaborators')
          .add({
        'valueRate': collaboratorValue,
        'time': DateTime.now(),
      });

      db
          .collection('cooperatives')
          .doc(token)
          .collection('star_rate_time')
          .add({
        'valueRate': timeValue,
        'time': DateTime.now(),
      });

      Navigator.pushReplacementNamed(context, '/confirmCpf');

    } catch (e) {
      SnackBarHelp().showErrorSnackbar();
    }
  }
}

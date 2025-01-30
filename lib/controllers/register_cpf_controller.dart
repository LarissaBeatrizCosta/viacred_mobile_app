import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/snack_bar.dart';

///Controla a tela onde insere o cpf
class RegisterCpfController extends ChangeNotifier {
  ///Controller da digitação do cpf
  TextEditingController controllerText = TextEditingController();

  ///Firebase inicialização
  FirebaseFirestore db = FirebaseFirestore.instance;

  ///Deleta o ultimo digito
  void delete() {
    if (controllerText.text.isNotEmpty) {
      var numberText = controllerText.text.replaceAll(RegExp(r'\D'), '');
      numberText = numberText.substring(0, numberText.length - 1);

      controllerText.text = CpfInputFormatter()
          .formatEditUpdate(
            TextEditingValue.empty,
            TextEditingValue(text: numberText),
          )
          .text;

      notifyListeners();
    }
  }

  ///Pega o cpf e atualiza pra tela
  void getCpf(String number) {
    var numberText = controllerText.text.replaceAll(RegExp(r'\D'), '') + number;

    controllerText.text = CpfInputFormatter()
        .formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: numberText),
        )
        .text;

    notifyListeners();
  }

  ///Verifica Validez do CPF e chama o banco para adicionar
  Future<void> checkCpf(BuildContext context) async {
    var cpfUnformatted = controllerText.text.replaceAll(RegExp(r'\D'), '');

    if (GetUtils.isCpf(cpfUnformatted)) {
      insertCpf();
      Navigator.pushReplacementNamed(context, '/comments');
    } else {
      SnackBarHelp().showCpfErrorSnackbar();
    }
  }

  ///Adiciona o cpf no firebase
  Future<void> insertCpf() async {
    var cpfUnformatted = controllerText.text.replaceAll(RegExp(r'\D'), '');

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(Constants.userKey);
      db.collection('cooperatives').doc(token).collection('cpf').add({
        'valueRate': cpfUnformatted,
      });
    } catch (e) {
      Exception(e);
    }
  }
}

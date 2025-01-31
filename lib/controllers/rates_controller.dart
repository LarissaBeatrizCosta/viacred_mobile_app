import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../utils/snack_bar.dart';
import 'db_controller.dart';

///Controller das avaliações
class RatesController extends ChangeNotifier {
  ///Instancia do controller do banco de dados
  DbController db = DbController();

  ///Variavel responsavel pelo valor da avaliação
  int? _valueRate;

  ///Estrelas ponto de atendimento
  int _locationValue = 0;

  ///Estrelas colaboradores
  int _collaboratorValue = 0;

  ///Estrelas tempo
  int _timeValue = 0;

  /// Getters
  int? get valueRate => _valueRate;

  ///ponto de atendimento
  int get locationValue => _locationValue;

  ///Estrelas colaboradores
  int get collaboratorValue => _collaboratorValue;

  ///Estrelas tempo
  int get timeValue => _timeValue;

  ///Valor do texto colocado na avaliação
  TextEditingController commentText = TextEditingController();

  ///Controller da digitação do cpf
  TextEditingController cpfText = TextEditingController();



  ///Função responsável pela atualização do valor da avaliação
  void rateNumberValue(int valor) {
    _valueRate = valor;
    notifyListeners();
  }

  ///Reseta valor das estrelas
  void resetRate() {
    _locationValue = 0;
    _collaboratorValue = 0;
    _timeValue = 0;

    notifyListeners();
  }

  ///Reseta cpf
  void resetCpf() {
    cpfText.clear();
    notifyListeners();

    notifyListeners();
  }

  ///Reseta comentário
  void resetComment() {
    commentText.clear();
    notifyListeners();

    notifyListeners();
  }

  ///Deleta o ultimo digito
  void delete() {
    if (cpfText.text.isNotEmpty) {
      var numberText = cpfText.text.replaceAll(RegExp(r'\D'), '');
      numberText = numberText.substring(0, numberText.length - 1);

      cpfText.text = CpfInputFormatter()
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
    var numberText = cpfText.text.replaceAll(RegExp(r'\D'), '') + number;

    cpfText.text = CpfInputFormatter()
        .formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: numberText),
        )
        .text;

    notifyListeners();
  }

  ///Verifica Validez do CPF e chama o banco para adicionar
  Future<void> checkCpf(BuildContext context) async {
    var cpfUnformatted = cpfText.text.replaceAll(RegExp(r'\D'), '');

    if (GetUtils.isCpf(cpfUnformatted)) {
      Navigator.pushReplacementNamed(context, '/comments');
    } else {
      SnackBarHelp().showCpfErrorSnackbar();
    }
  }

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

  ///Chama a função de inserir dados do banco
  Future<void> insertRates(BuildContext context) async {
    try {
      await db.insertRates(
        numberRate: valueRate,
        locationValue: locationValue,
        collaboratorValue: collaboratorValue,
        timeValue: timeValue,
        commentValue: commentText.text,
      );

      Navigator.pushReplacementNamed(context, '/thanks');
    } catch (e) {
      SnackBarHelp().showErrorSnackbar();
    }
  }
}

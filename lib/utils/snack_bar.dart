import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

///Classe responsável pela snackbar
class SnackBarHelp {
  ///SnackBarDefaultErro
  void showErrorSnackbar() {
    final style = TextStyle(
      fontSize: 30,
      color: ColorsHome().colorMap[11],
    );
    final text = Text(
      'Não foi possível enviar sua avaliação, tente novamente mais tarde.',
      style: style,
    );
    Get.snackbar(
      '',
      '',
      titleText: text,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(left: 16),
      backgroundColor: ColorsHome().colorMap[15],
      colorText: ColorsHome().colorMap[11],
      duration: const Duration(seconds: 3),
    );
  }

  ///SnackBarDefaultErro
  void showEmptyValueSnackbar() {
    final style = TextStyle(
      fontSize: 30,
      color: ColorsHome().colorMap[11],
    );
    final text = Text(
      'Preencha o campo para enviar!',
      style: style,
    );
    Get.snackbar(
      '',
      '',
      titleText: text,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(left: 16),
      backgroundColor: ColorsHome().colorMap[15],
      colorText: ColorsHome().colorMap[11],
      duration: const Duration(seconds: 3),
    );
  }

  ///SnackBar Erro CPF
  void showCpfErrorSnackbar() {
    final style = TextStyle(
      fontSize: 30,
      color: ColorsHome().colorMap[11],
    );
    final text = Text(
      'Por favor, digite um CPF válido!',
      style: style,
    );
    Get.snackbar(
      '',
      '',
      titleText: text,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(left: 16),
      backgroundColor: ColorsHome().colorMap[15],
      colorText: ColorsHome().colorMap[11],
      duration: const Duration(seconds: 3),
    );
  }
}

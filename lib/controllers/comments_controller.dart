import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/snack_bar.dart';

///Controla a avaliação comentada
class CommentsController extends ChangeNotifier {
  ///Valor do texto colocado na avaliação
  TextEditingController controllerText = TextEditingController();

  ///Instancia o banco de dados
  FirebaseFirestore db = FirebaseFirestore.instance;

  ///Adiciona a avaliação comentada no firebase
  Future<void> insertCommentRate(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(Constants.userKey);
      db.collection('cooperatives').doc(token).collection('comment_rate').add({
        'valueRate': controllerText.text,
        'time': DateTime.now(),
      });
      Navigator.pushReplacementNamed(context, '/thanks');

    } catch (e) {
      SnackBarHelp().showErrorSnackbar();
    }
  }
}

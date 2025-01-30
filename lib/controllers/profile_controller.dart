import 'package:flutter/material.dart';

import '../views/profile_view.dart';

///Controlla a pagina de profile
class ProfileController extends ChangeNotifier {
  ///Abre o modal com os botões
  void showModal(dynamic context) {
    showDialog(
      context: context,
      builder: (context) {
        return ProfileView();
      },
    );
  }
}

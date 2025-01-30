import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

///Tela de perfil
class ProfileView extends StatelessWidget {
  ///Construtor
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textSignOut = Text(
      'Sair',
      style: TextStyle(fontSize: 30),
    );
    final textDelete = Text(
      'Excluir Conta',
      style: TextStyle(fontSize: 30),
    );

    final styleSignOut = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: ColorsHome().colorMap[13],
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      minimumSize: Size(200, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final styleDelete = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: ColorsHome().colorMap[2],
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      minimumSize: Size(200, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return AlertDialog(
      content: SizedBox(
        height: 155,
        width: 30,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: styleSignOut,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  final prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: textSignOut,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.currentUser?.delete();
                final prefs = await SharedPreferences.getInstance();
                prefs.remove(Constants.userKey);

                Navigator.pushReplacementNamed(context, '/login');
              },
              style: styleDelete,
              child: textDelete,
            ),
          ],
        ),
      ),
    );
  }
}

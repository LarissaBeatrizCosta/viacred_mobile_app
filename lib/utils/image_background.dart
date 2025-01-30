import 'package:flutter/cupertino.dart';

///Classe para declarar imagem de fundo
class ImageBackground extends StatelessWidget {
  ///Construtor
  const ImageBackground({super.key, this.showLogo = true});

  ///Determina se a logo será exibida
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if(showLogo)
          Positioned(
            left: 420,
            child: Image.asset(
              'assets/images/logo.png',
              width: 400,
              height: 200,
            ),
          ),
          Positioned(
            left: 1090,
            child: Image.asset('assets/images/desenho.png', width: 200),
          ),
        ],
      ),
    );
  }
}

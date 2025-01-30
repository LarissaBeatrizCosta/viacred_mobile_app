import 'package:flutter/cupertino.dart';

import 'image_background.dart';

///Tela imagem
class ScreenDefault extends StatelessWidget {
  ///Contrutor
  const ScreenDefault(
      {super.key,
      required this.child,
      this.showLogo = true,
      this.marginTop});

  ///Widget child
  final Widget child;

  ///Determina se a logo será exibida
  final bool showLogo;

  ///Determina o margintop
  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageBackground(showLogo: showLogo),
        Container(
          margin: EdgeInsets.only(top: marginTop ?? 120),
          child: child,
        ),
      ],
    );
  }
}

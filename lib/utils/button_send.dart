import 'package:flutter/material.dart';
import 'colors.dart';

///Botão de enviar
class ButtonSend extends StatelessWidget {
  ///Contrutor
  const ButtonSend({super.key, this.onTap, this.color});

  ///Função tap
  final GestureTapCallback? onTap;

  ///Cor do botão
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 50,
        );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 250,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(55),
        ),
        child: Center(
          child: Text(
            'Enviar',
            style: style?.copyWith(
              color: ColorsHome().colorMap[11],
            ),
          ),
        ),
      ),
    );
  }
}

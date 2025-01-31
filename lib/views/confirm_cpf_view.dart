import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/rates_controller.dart';
import '../utils/colors.dart';
import '../utils/screen_default.dart';

///Tela de confirmação de cpf
class ConfirmCpfView extends StatelessWidget {
  ///tela de confirmação de cpf
  const ConfirmCpfView({super.key});

  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RatesController>(context);

    return ScreenDefault(
      marginTop: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TextInfo(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Button(
                text: 'Sim',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/register_cpf');
                },
                color: ColorsHome().colorMap[9],
              ),
              _Button(
                text: 'Não',
                onTap: () async {
                  await state.insertRates(context);
                  Navigator.pushReplacementNamed(context, '/thanks');
                },
                color: ColorsHome().colorMap[5],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TextInfo extends StatelessWidget {
  const _TextInfo();

  @override
  Widget build(BuildContext context) {
    final text = 'Gostaria de confirmar seu CPF?';

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 75,
        );

    final padding = 20.0;
    return Padding(
      padding: EdgeInsets.only(bottom: 50, right: padding, left: padding),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({this.onTap, this.color, required this.text});

  ///Função tap
  final GestureTapCallback? onTap;

  ///Cor do botão
  final Color? color;

  ///Texto do botão
  final String text;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 70,
        );
    return Padding(
      padding: const EdgeInsets.only(right: 70),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10),
          width: 250,
          height: 120,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(70),
          ),
          child: Center(
            child: Text(
              text,
              style: style?.copyWith(
                color: ColorsHome().colorMap[11],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

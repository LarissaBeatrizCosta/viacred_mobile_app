import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/rates_controller.dart';
import '../utils/colors.dart';
import '../utils/screen_default.dart';

///Tela final de agradecimento pela avaliação
class ThanksView extends StatelessWidget {
  ///Construtor
  const ThanksView({super.key});

  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    context.read<RatesController>().resetSelectButton();
    context.read<RatesController>().resetRateHome();

    return ScreenDefault(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TextInfo1(),
          _TextInfo2(),
        ],
      ),
    );
  }
}

class _TextInfo1 extends StatelessWidget {
  const _TextInfo1();

  @override
  Widget build(BuildContext context) {
    final text = 'Obrigado!';

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 160,
          color: ColorsHome().colorMap[13],
        );

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}

class _TextInfo2 extends StatelessWidget {
  const _TextInfo2();

  @override
  Widget build(BuildContext context) {
    final text2 = 'sucesso!';
    final text = 'Seus dados foram enviados com ';

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: ColorsHome().colorMap[14],
        );

    final style2 = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: ColorsHome().colorMap[5],
        );

    return Padding(
      padding: EdgeInsets.only(bottom: 65),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: style,
            children: [
              TextSpan(text: text),
              TextSpan(text: text2, style: style2),
            ],
          ),
        ),
      ),
    );
  }
}

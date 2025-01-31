import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/rates_controller.dart';
import '../utils/colors.dart';
import '../utils/screen_default.dart';

///Tela responsável pelos comentários
class CommentsView extends StatelessWidget {
  ///Construtor
  const CommentsView({super.key});

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

    return Scaffold(
      body: ScreenDefault(
        marginTop: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Button(
              color: ColorsHome().colorMap[9],
              onTap: () async {
                await state.insertRates(context);
              },
            ),
            _TextInfo(),
            _TypingArea(),
          ],
        ),
      ),
    );
  }
}

class _TextInfo extends StatelessWidget {
  const _TextInfo();

  @override
  Widget build(BuildContext context) {
    final text = 'Deixe seu comentário';

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 65,
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

class _TypingArea extends StatelessWidget {
  _TypingArea();

  final style = TextStyle(
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RatesController>(context);

    return Container(
      width: 1000,
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(
            color: ColorsHome().colorMap[13] ?? Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: state.commentText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Digite aqui...',
          ),
          style: style,
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  ///Contrutor
  const _Button({this.onTap, this.color});

  ///Função tap
  final GestureTapCallback? onTap;

  ///Cor do botão
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 25,
        );
    return Padding(
      padding: const EdgeInsets.only(right: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(10),
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(70),
              ),
              child: Center(
                child: Text(
                  'Finalizar Comentário',
                  style: style?.copyWith(
                    color: ColorsHome().colorMap[11],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

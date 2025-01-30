import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/register_cpf_controller.dart';
import '../utils/button_send.dart';
import '../utils/colors.dart';
import '../utils/screen_default.dart';

///Tela para register de cpf
class RegisterCpfView extends StatelessWidget {
  ///Constructor
  const RegisterCpfView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterCpfController(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterCpfController>(context);

    return Scaffold(
      body: ScreenDefault(
        marginTop: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _CpfContainer(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonSend(
                color: ColorsHome().colorMap[5],
                onTap: () async {
                  await state.checkCpf(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CpfContainer extends StatelessWidget {
  const _CpfContainer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 550,
        height: 405,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            width: 5,
            color: ColorsHome().colorMap[12] ?? Colors.blue,
          ),
        ),
        child: _Display(),
      ),
    );
  }
}

class _Display extends StatelessWidget {
  const _Display();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Input(),
        _KeyBoard(),
      ],
    );
  }
}

class _Input extends StatelessWidget {
  const _Input();

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 50,
      color: ColorsHome().colorMap[12] ?? Colors.lightBlue[900]!,
    );

    final state = Provider.of<RegisterCpfController>(context);
    return TextField(
      readOnly: true,
      controller: state.controllerText,
      style: style,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsHome().colorMap[12] ?? Colors.lightBlue[900]!,
            width: 5,
          ),
        ),
      ),
    );
  }
}

class _KeyBoard extends StatelessWidget {
  const _KeyBoard();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterCpfController>(context);

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 30,
        );
    return SizedBox(
      height: 300,
      width: 500,
      child: Table(
        defaultColumnWidth: FixedColumnWidth(100),
        children: [
          TableRow(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _KeyButton(
                        context,
                        number: '1',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: '2',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: '3',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _KeyButton(
                        context,
                        number: '4',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: '5',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: '6',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _KeyButton(
                        context,
                        number: '7',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: '8',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: '9',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 160,
                      ),
                      _KeyButton(
                        context,
                        number: '0',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                      _KeyButton(
                        context,
                        number: 'del',
                        style: style,
                        controllerText: state.controllerText,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String number;
  final TextStyle? style;
  final TextEditingController controllerText;

  const _KeyButton(
    BuildContext context, {
    required this.number,
    required this.style,
    required this.controllerText,
  });

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterCpfController>(context);

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 40,
          color: ColorsHome().colorMap[11],
        );
    return GestureDetector(
      onTap: () {
        number == 'del' ? state.delete() : state.getCpf(number);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 55,
        width: 140,
        decoration: BoxDecoration(
          color: ColorsHome().colorMap[12], // Customize color as needed
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: number == 'del'
              ? Icon(Icons.backspace, size: 30, color: Colors.white)
              : Text(
                  number,
                  style: style,
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/rates_controller.dart';
import '../utils/button_send.dart';
import '../utils/colors.dart';
import '../utils/screen_default.dart';
import '../utils/snack_bar.dart';

///Tela de RateBar
class RateStarView extends StatelessWidget {
  ///Contrutor da RateView
  const RateStarView({super.key});

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
        marginTop: 10,
        showLogo: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TextInfo(text: 'Ambiente do Posto de Atendimento'),
              _StarsRate1(),
              _TextInfo(text: 'Atendimento dos colaboradores'),
              _StarsRate2(),
              _TextInfo(text: 'Atendimento dos colaboradores'),
              _StarsRate3(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ButtonSend(
                  color: ColorsHome().colorMap[5],
                  onTap: () async {
                    if (state.collaboratorValue > 0 &&
                        state.locationValue != 0 &&
                        state.timeValue != 0) {
                      context.read<RatesController>().resetCpf();
                      context.read<RatesController>().resetComment();

                      Navigator.pushReplacementNamed(context, '/confirmCpf');
                    } else {
                      SnackBarHelp().showEmptyValueSnackbar();
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class _TextInfo extends StatelessWidget {
  const _TextInfo({required this.text});

  ///Texto
  final String text;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 50,
        );
    return Center(
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class _StarsRate1 extends StatelessWidget {
  const _StarsRate1();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RatesController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  state.getLocationValue(index);
                },
                child: Image.asset(
                  state.locationValue <= index
                      ? 'assets/images/starlight.png'
                      : 'assets/images/estrela_active.png',
                  width: 145,
                  height: 145,
                ),
              ),
              SizedBox(width: 15),
            ],
          );
        },
      ),
    );
  }
}

class _StarsRate2 extends StatelessWidget {
  const _StarsRate2();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RatesController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  state.getCollaboratorsValue(index);
                },
                child: Image.asset(
                  state.collaboratorValue <= index
                      ? 'assets/images/starlight.png'
                      : 'assets/images/estrela_active.png',
                  width: 145,
                  height: 145,
                ),
              ),
              SizedBox(width: 15),
            ],
          );
        },
      ),
    );
  }
}

class _StarsRate3 extends StatelessWidget {
  const _StarsRate3();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RatesController>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  state.getTimeValue(index);
                },
                child: Image.asset(
                  state.timeValue <= index
                      ? 'assets/images/starlight.png'
                      : 'assets/images/estrela_active.png',
                  width: 145,
                  height: 145,
                ),
              ),
              SizedBox(width: 15),
            ],
          );
        },
      ),
    );
  }
}

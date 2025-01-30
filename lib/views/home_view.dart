import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';
import '../utils/button_send.dart';
import '../utils/colors.dart';
import '../utils/screen_default.dart';
import '../utils/snack_bar.dart';

///Tela inicial
class HomeView extends StatelessWidget {
  ///Key da tela inicial do app
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RateNumberController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileController(),
        ),
      ],
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RateNumberController>(context);
    final stateModal = Provider.of<ProfileController>(context);

    return GestureDetector(
      onLongPress: () {
        stateModal.showModal(context);
      },
      child: ScreenDefault(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TextInfo(),
            _RateBar(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ButtonSend(
                color: ColorsHome().colorMap[12],
                onTap: () async {
                  if (state.valueRate != null) {
                    await state.insertRateValue(context);
                  } else {
                    SnackBarHelp().showEmptyValueSnackbar();
                  }
                },
              ),
            ),
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
    final text = 'Em uma escala de 0 a 10 o quanto você indicaria a '
        'experiência de hoje para amigos e familiares?';

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 55,
        );

    return Padding(
      padding: EdgeInsets.only(bottom: 50, right: 5, left: 30),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: style,
      ),
    );
  }
}

///Barra de avaliação de 0 a 10
class _RateBar extends StatelessWidget {
  ///Construtor
  const _RateBar();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 65,
        );

    return Consumer<RateNumberController>(
      builder: (_, stateRateNumer, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            11,
            (index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      stateRateNumer.rateNumberValue(index);
                    },
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: ColorsHome().colorMap[index],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: style?.copyWith(
                            color: ColorsHome().colorMap[11],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

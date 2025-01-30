import 'package:flutter/material.dart';

import '../comments_view.dart';
import '../confirm_cpf_view.dart';
import '../home_view.dart';
import '../login_view.dart';
import '../rate_view.dart';
import '../register_cpf_view.dart';
import '../thanks_view.dart';

// ignore: avoid_classes_with_only_static_members
/// Gerencia rotas
class Routes {
  ///Gerencia as rotas
  static Route<dynamic> createRoutes(RouteSettings routes) {
    switch (routes.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case '/rateStars':
        return MaterialPageRoute(
          builder: (_) => const RateStarView(),
        );
      case '/confirmCpf':
        return MaterialPageRoute(
          builder: (_) => const ConfirmCpfView(),
        );
      case '/thanks':
        return MaterialPageRoute(
          builder: (_) => const ThanksView(),
        );
      case '/register_cpf':
        return MaterialPageRoute(
          builder: (_) => const RegisterCpfView(),
        );
      case '/comments':
        return MaterialPageRoute(
          builder: (_) => const CommentsView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('Página não encontrada'),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/views/errores/page_errores_view.dart';
import 'package:rick_and_morty/views/screen_1.dart';
import 'package:rick_and_morty/views/screen_2.dart';


class RutasConstantes {
  static const String screen_1 = 'home';
  static const String screen_2 = 'detalles-personaje';
}

class MyGoRouter {

  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: RutasConstantes.screen_1,
          path: '/',
          builder: (context, state) => const ScreenUno(),
          routes: [
            GoRoute(
              name: RutasConstantes.screen_2,
              path: 'details/:id',
              builder: (context, state) => ScreenDos(
                id: state.params['id'],
              ),
            )
          ]
        ),

      ],
      errorBuilder: (context, state) => PageErrores(error: state.error.toString()),
    );

    return router;
  }
}
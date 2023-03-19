import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/generics/widgets/widgets.dart';
import 'package:rick_and_morty/providers/personajeData.dart';
import 'package:rick_and_morty/views/details.dart';
import 'package:rick_and_morty/views/errores/page_errores_view.dart';

class ScreenDos extends ConsumerStatefulWidget {
  final String? id;

  const ScreenDos({
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenDosState();
}

class _ScreenDosState extends ConsumerState<ScreenDos> {
  @override
  Widget build(BuildContext context) {
    return WG.esqueletoAppBar(context,
      titleAppBar: Text(
        'Detalles Personaje',
        style: GoogleFonts.creepster(
          fontSize: 30,
          color: Colors.blue
        )
      ),

      contenido: _singlePersonajeApi()
    );
  }



  Widget _singlePersonajeApi(){
    final _data = ref.watch(personajeSingleDataProvider(widget.id));

    return _data.when(
      data: (personaje) {
        return ProfileScreen(personaje: personaje);
      },
      error: (err, s) {
        print('>> Error Screen 2: |${err.toString()}|');
        return PageErrores(error: err.toString());
      },

      loading: () => const Center(
          child: CircularProgressIndicator()
      )
    );
  }
}

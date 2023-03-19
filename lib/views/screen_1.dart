import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/generics/widgets/grid_view.dart';
import 'package:rick_and_morty/generics/widgets/widgets.dart';
import 'package:rick_and_morty/models/personaje.dart';
import 'package:rick_and_morty/providers/personajeData.dart';
import 'package:rick_and_morty/routers/my_go_router.dart';
import 'package:rick_and_morty/views/errores/page_errores_view.dart';

class ScreenUno extends ConsumerStatefulWidget {
  const ScreenUno({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenUnoState();
  // @override
  // State<ScreenUno> createState() => _ScreenUnoState();
}

class _ScreenUnoState extends ConsumerState<ScreenUno> {

  Personaje personajeSelected = Personaje(id: 0);
  List<GridDataModel> allPersonajes = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      //allPersonajes = await _apiController.allCharacters();
      //setState(() { });
    });
  }


  @override
  Widget build(BuildContext context) {

    return WG.esqueletoAppBar(context,
        titleAppBar: Text('Rick and Morty', style: GoogleFonts.creepster(
            fontSize: 30,
            color: Colors.blue
        )),
        hiddenButtonBack: true,
        buttonAppBar: TextButton(
            onPressed: _resetAllPersonajes,
            child: const Icon(
              Icons.rotate_left_rounded,
              size: 35,
              color: Colors.white,
            )
        ),
        scroll: false,
        contenido: _allPersonajesApi()
    );
  }

  _resetAllPersonajes(){
    for(GridDataModel model in allPersonajes){
      model.isCheck = false;
    }

    personajeSelected = Personaje(id: 0);

    setState(() { });
  }


  Widget _allPersonajesApi() {
    final _data = ref.watch(personajeDataProvider);
    // List<GridDataModel> allModels = [];

    /*
    return ;
     */

    return _data.when(
      data: (data) {
        // print('Data => ${data.length}');
        allPersonajes = data.map((item) {
          return GridDataModel(
            id: item.id,
            img: item.image ?? '',
            title: item.name ?? '',
            isCheck: false,
            item: item
          );
        }).toList();

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridViewList(
                models: allPersonajes,
                callback: ({index, model}) {
                  personajeSelected = model?.item as Personaje;
                  print('>>>>>>>>>>> Callback');
                  print(personajeSelected?.id);
                  print(personajeSelected?.name);
                },
                unique: true,
              ),
            ),
            // /*
            WG.botonAccion(
              'Ver Detalles',
              fondo: Colors.green,
              margin: null,
              borderRadius: 0,
              evento: () {
                print('> Yendo');
                GoRouter.of(context).goNamed(
                  RutasConstantes.screen_2,
                  params: { 'id':  personajeSelected.id.toString() ?? 'none'}
                );
              }
            )
             // */
        ],
        );
      },
      error: (err, s) => PageErrores(error: err.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator()
      )
    );
  }
}

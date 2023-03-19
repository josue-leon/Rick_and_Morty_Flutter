import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/models/personaje.dart';
import 'package:rick_and_morty/services/ApiServices.dart';

final personajeDataProvider = FutureProvider<List<Personaje>>((ref) async {
  return ref.watch(personajeProvider).allCharacters();
});

final personajeSingleDataProvider = FutureProvider.family(
    (ref, id) {
      return ApiServices().singleCharacters(id);
    },
);
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:rick_and_morty/models/personaje.dart';

class ApiServices {

  Future<List<Personaje>> allCharacters() async {
    Response response = await get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if(response.statusCode == 200){
      final Map<String, dynamic> respuesta = jsonDecode(response.body) as Map<String, dynamic>;
      List<Personaje> allData = [];

      for(dynamic d in respuesta['results']){
        allData.add(Personaje.fromJson(d));
      }
      return allData;
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Personaje> singleCharacters(id) async {
    // var d = 100 ~/ 0;
    // print('Digito: $d');

    Response response = await get(Uri.parse('https://rickandmortyapi.com/api/character/$id'));
    if(response.statusCode == 200){
      final Map<String, dynamic> respuesta = jsonDecode(response.body) as Map<String, dynamic>;

      return Personaje.fromJson(respuesta);
    }else{
      print('> Log: ${response.reasonPhrase}');
      throw Exception(response.reasonPhrase);
    }
  }

}



final personajeProvider = Provider<ApiServices>((ref)=>ApiServices());

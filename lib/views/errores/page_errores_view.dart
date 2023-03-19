import 'package:flutter/material.dart';
import 'package:rick_and_morty/views/errores/not_found.dart';

class PageErrores extends StatefulWidget {

  final String? error;

  const PageErrores({
    Key? key,
    this.error = 'default'
  }) : super(key: key);

  @override
  State<PageErrores> createState() => _PageErroresState();
}

class _PageErroresState extends State<PageErrores> {
  @override
  Widget build(BuildContext context) {
    return _switchErrores();
  }

  Widget _switchErrores() {
    print('>> Lanzando Error: ${widget.error}');

    switch(widget.error){
      case 'Exception: Not Found':
        return Error404Screen();
      default:
        return const Text('Se ha generado un error inesperado, intente de nuevo!');
    }
  }
}

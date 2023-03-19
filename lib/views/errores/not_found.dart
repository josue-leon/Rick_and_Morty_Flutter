import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Error404Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(28, 34, 34, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/img/error-4044.png",
                fit: BoxFit.contain,
              ),
              Text(
                'No se ha seleccionado ningún personaje',
                textAlign: TextAlign.center,
                style: GoogleFonts.creepster(
                  color: const Color.fromRGBO(95, 227, 26, 1),
                  fontSize: 24,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

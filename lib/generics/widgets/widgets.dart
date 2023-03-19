import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WG {

  static Widget botonAccion(
      texto, {
        VoidCallback? evento,
        Color? fondo = Colors.blue,
        margin = const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        EdgeInsetsGeometry? paddingText,
        bool disable = false,
        double borderRadius = 15,
        double height = 50,
        double width = double.infinity,
        TextStyle? textStyle,
        ButtonStyle? styleElevate,
        Decoration? decoration,
        bool transparente = false,
        BorderSide? styleBorder,
      }) {
    return Center(
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: decoration,
        // color: Colors.red,
        // decoration: const BoxDecoration(
        //   color: Colors.transparent,
        //   backgroundBlendMode: BlendMode.src,
        // ),
        child: ElevatedButton(
          onPressed: disable ? null : evento,
          style: styleElevate ?? ElevatedButton.styleFrom(
            primary: fondo,
            backgroundColor: fondo,
            shadowColor: transparente ? Colors.transparent.withOpacity(0.014) : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: styleBorder ?? BorderSide.none
            ),
            // padding: const EdgeInsets.symmetric(vertical: 0)
            padding: paddingText,
          ),
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: textStyle ?? GoogleFonts.roboto(
                fontSize: 18
            ),
          ),
        ),
      ),
    );
  }

  static Widget esqueletoAppBar(context,
      {
        Widget? contenido,
        AppBar? appBar,
        Widget? titleAppBar,
        Widget? buttonAppBar,
        Color? fondoAppBar,
        Color fondo = Colors.white,
        VoidCallback? onActionLeading,
        bool scroll = true,
        TabBar? tabBar,
        int? defaultLengthTabs,
        hiddenButtonBack = false,
      }){

    final Scaffold scaffold = Scaffold(
        backgroundColor: fondo,
        appBar: appBar ?? AppBar(
          backgroundColor: fondoAppBar ?? const Color.fromRGBO(0, 0, 0, 0.8),
          title: titleAppBar,
          actions: [
            if(buttonAppBar != null) buttonAppBar
          ],
          leading: hiddenButtonBack ? null : BackButton(
            onPressed: onActionLeading,
          ),
          bottom: tabBar,
        ),
        body: scroll ? SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight)
              ),
              child: contenido
          ),
        ) : contenido
    );

    return WillPopScope(
        //onWillPop: () async => await SalirApp.onWillPop(context),
        onWillPop: () async {
          print('>> Saliendo none');
          return true;
        },
        child: tabBar != null ?
        DefaultTabController(
          length: defaultLengthTabs ?? 0,
          child: scaffold,
        ) : scaffold
    );
  }



}
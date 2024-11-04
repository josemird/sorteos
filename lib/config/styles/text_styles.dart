import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppy3/config/theme/theme.dart';


//TEXTOS ///////////////////////////////////////////////////////////////////////

///Lineas
const int MAXLINES = 2;

///Pesos
const FontWeight TEXTO_NORMAL = FontWeight.normal;
const FontWeight TEXTO_BOLD = FontWeight.bold;


///Tamaños
const double TEXTO_EXTRAGRANDE_SIZE = 28;
const double TEXTO_TITULO_SIZE = 19;
const double TEXTO_SUBTITULO_SIZE = 15;
const double TEXTO_BODY_SIZE = 13;
const double TEXTO_BOTON_SIZE = 12;
const double TEXTO_CAPTION_SIZE = 10;
const double TEXTO_SMALL_SIZE = 8;



//GET ESTILOS //////////////////////////////////////////////////////////////////
getEstilo(double size, FontWeight peso, Color color, {double letterspacing = 0, bool sombra = false, bool subrayado = false, double heigth = 1.2}){

  return GoogleFonts.montserrat(
      fontSize: size,
      letterSpacing: letterspacing,
      decoration: subrayado ? TextDecoration.underline : null,
      fontWeight: peso,
      color: color,
      height: heigth,
      shadows: sombra ? <Shadow>[
        const Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 5.0,
          color: COLOR_TEXT,
        ),
      ] : null
  );

}

//ESTILOS //////////////////////////////////////////////////////////////////////

TextStyle estiloExtragrande({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BOLD, double size = TEXTO_EXTRAGRANDE_SIZE}){

  return getEstilo(size, fontWeight, color);

}

TextStyle estiloTitulo({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BOLD, double size = TEXTO_TITULO_SIZE}){

  return getEstilo(size, fontWeight, color);

}

TextStyle estiloSubtitulo({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BOLD, double size = TEXTO_SUBTITULO_SIZE}){

  return getEstilo(size, fontWeight, color);

}

TextStyle estiloBody({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_NORMAL, double size = TEXTO_BODY_SIZE, bool subrayado = false}){

  return getEstilo(size, fontWeight, color, subrayado: subrayado);

}

TextStyle estiloHint({Color color = COLOR_SUBTEXT, FontWeight fontWeight = TEXTO_NORMAL, double size = TEXTO_BODY_SIZE}){

  return getEstilo(size, fontWeight, color);

}

TextStyle estiloBoton({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BOLD, double size = TEXTO_BOTON_SIZE}){

  return getEstilo(size, fontWeight, color);

}

TextStyle estiloCaption({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_NORMAL, double size = TEXTO_CAPTION_SIZE}){

  return getEstilo(size, fontWeight, color);

}

TextStyle estiloSmall({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_NORMAL, double size = TEXTO_SMALL_SIZE}){

  return getEstilo(size, fontWeight, color);

}



//WIDGETS //////////////////////////////////////////////////////////////////////

Widget TextoExtragrande(String texto, {Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_NORMAL, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(TEXTO_EXTRAGRANDE_SIZE, fontWeight, color, letterspacing: espacioLetras)
  );

}

Widget TextoTitulo(String texto, {Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_BOLD, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(TEXTO_TITULO_SIZE, fontWeight, color, letterspacing: espacioLetras)
  );

}

Widget TextoSubtitulo(String texto, {double fontSize = TEXTO_SUBTITULO_SIZE, Color color = COLOR_TEXT,  bool sombra = false, FontWeight fontWeight = TEXTO_BOLD, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(fontSize, fontWeight, color, letterspacing: espacioLetras)
  );

}

Widget TextoBody(String texto, {double fontSize = TEXTO_BODY_SIZE, Color color = COLOR_TEXT,bool sombra = false, FontWeight fontWeight = TEXTO_NORMAL, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines == 0 ? null : maxlines,
      style: getEstilo(TEXTO_BODY_SIZE, fontWeight, color, letterspacing: espacioLetras)
  );

}

Widget TextoBoton(String texto, {double fontSize = TEXTO_BOTON_SIZE, bool sombra = false, Color color = COLOR_TEXT_BUTTONS, FontWeight fontWeight = TEXTO_BOLD, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(fontSize, fontWeight, color, letterspacing: espacioLetras)

  );

}

Widget TextoCaption(String texto, {double fontSize = TEXTO_CAPTION_SIZE,Color color = COLOR_SUBTEXT, bool sombra = false, FontWeight fontWeight = TEXTO_NORMAL, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(fontSize, fontWeight, color, letterspacing: espacioLetras)
  );

}

Widget TextoSmall(String texto, {Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_NORMAL, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(TEXTO_SMALL_SIZE, fontWeight, color, letterspacing: espacioLetras)
  );

}

Widget TextoCustom(String texto, {double fontSize = TEXTO_BOTON_SIZE, bool sombra = false, Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BOLD, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(fontSize, fontWeight, color, letterspacing: espacioLetras)

  );

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppy3/config/styles/text_styles.dart';


//COLORES  /////////////////////////////////////////////////////////////////////
///BACKGROUNDS
const Color COLOR_BACKGROUND = Color(0xffF7F8FD);
const Color COLOR_BACKGROUND_SECONDARY = Color(0xffFFFFFF);

///ACCENT
const Color COLOR_ACCENT = Color(0xffD90216);
const Color COLOR_ACCENT_PRESSED = Color(0xffbc0215);
const Color COLOR_ACCENT_HOVER = Color(0xff9a0310);

const Color COLOR_ACCENT_SECONDARY = Color(0xFFF4BA26);

///TEXT
const Color COLOR_TEXT = Color(0xFF1C1F2E);
const Color COLOR_SUBTEXT = Color(0xFF6E7373);
const Color COLOR_TEXT_BUTTONS = Color(0xFFFFFFFF);

///BORDER
const Color COLOR_BORDER = Color(0xFF1C1F2E);

///ALERTS
const Color COLOR_ERROR = Color.fromRGBO(243, 26, 26, 1.0);
const Color COLOR_ALERT = Color.fromRGBO(253, 221, 59, 1.0);
const Color COLOR_DONE = Color.fromRGBO(3, 218, 198, 1);
const Color COLOR_CONNECTED = Colors.blueAccent;

///UTILS
const Color COLOR_HINT = Color(0xffe4e5ec);
const Color COLOR_DIVIDER = Color(0xffC6C2BE);

// DOUBLES /////////////////////////////////////////////////////////////////////
/// Valores dimensionales
const double RADIUS = 10;

///Textfields
const double SIZE_BORDE = 1;
const double SIZE_BORDER_FOCUS = 1;

const double ESPACIO_APPBAR = 20;
const double ESPACIO_REFRESH_OFFSET = 30;

//Espacios
const double ESPACIO_EXTRAGRANDE = 80;
const double ESPACIO_GRANDE = 40;
const double ESPACIO_MEDIANO = 25;
const double ESPACIO_PEQUENO = 10;
const double ESPACIO_EXTRAPEQUENO = 5;

//FORMATOS /////////////////////////////////////////////////////////////////////
const double DOUBLE_PADDING_APP = 20;
EdgeInsets PADDING_APP = const EdgeInsets.only(left: DOUBLE_PADDING_APP, right: DOUBLE_PADDING_APP);
EdgeInsets PADDING_APP_ALL = const EdgeInsets.all(DOUBLE_PADDING_APP);
EdgeInsets PADDING_APP_ALL_SMALL = const EdgeInsets.all(DOUBLE_PADDING_APP/2);
EdgeInsets PADDING_TOP = const EdgeInsets.only(top: 50);

ThemeData theme() {
  return ThemeData(
    //applyElevationOverlayColor: true,
    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

    platform: TargetPlatform.iOS,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: COLOR_ACCENT,
      onPrimary: COLOR_TEXT,
      surface: COLOR_TEXT,
      onSurface: COLOR_ACCENT,
      secondary: COLOR_ACCENT,
      onSecondary: COLOR_ACCENT,
      error: COLOR_ERROR,
      onError: COLOR_TEXT_BUTTONS,
    ),

    ///BACKGROUDNS
    //brightness: Brightness.dark,
    scaffoldBackgroundColor: COLOR_BACKGROUND,

    ///CARDS
    //cardColor: COLOR_BACKGROUND_SECUNDARIO,
    cardTheme: CardTheme(
        color: COLOR_BACKGROUND_SECONDARY,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))),

    ///TEXTFIELDS
    inputDecorationTheme: InputDecorationTheme(

      ///Estilo Inicio
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
        borderSide: BorderSide(color: COLOR_TEXT, width: SIZE_BORDE),
      ),

      ///Estilo Focus
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
        borderSide: BorderSide(color: COLOR_ACCENT, width: SIZE_BORDER_FOCUS),
      ),

      ///Estilo error
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
        borderSide: BorderSide(color: COLOR_ERROR, width: SIZE_BORDER_FOCUS),
      ),

      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
        borderSide: BorderSide(color: COLOR_ERROR, width: SIZE_BORDER_FOCUS),
      ),

      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
        borderSide: BorderSide(color: COLOR_HINT, width: SIZE_BORDER_FOCUS),
      ),

      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
        borderSide: BorderSide(color: COLOR_TEXT, width: SIZE_BORDER_FOCUS),
      ),


      ///Estilo textos
      labelStyle: estiloHint(),
      hintStyle: estiloHint(),
      helperStyle: estiloHint(),
      floatingLabelStyle: estiloHint(color: COLOR_ACCENT),

      ///Relleno
      filled: false,
      fillColor: COLOR_BACKGROUND_SECONDARY,

      contentPadding: const EdgeInsets.all(20),

      ///Color de prefix icon
      prefixIconColor: COLOR_TEXT,
      suffixIconColor: COLOR_TEXT,
    ),

    ///BUTTONS
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      ///Estilo borde
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return const BorderSide(color: COLOR_ACCENT_PRESSED, width: 0);
        }
        return const BorderSide(color: COLOR_ACCENT, width: 0);
      }),

      ///Forma
      shape: WidgetStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        );
      }),

      ///Fondo
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        // If the button is pressed, return COLOR_ACCENT, otherwise color_accent
        if (states.contains(WidgetState.pressed)) {
          return COLOR_ACCENT_PRESSED;
        } else if (states.contains(WidgetState.hovered)) {
          return COLOR_ACCENT_HOVER;
        }
        return COLOR_ACCENT;
      }),
    )),

    ///APPBAR
    appBarTheme: const AppBarTheme(
      backgroundColor: COLOR_BACKGROUND,
      surfaceTintColor: COLOR_BACKGROUND,
      iconTheme: IconThemeData(color: COLOR_TEXT),
    ), // Estilo de appBar

    ///DIVIDER
    dividerTheme: const DividerThemeData(
        color: COLOR_DIVIDER,
        space: ESPACIO_GRANDE,
        indent: 100,
        endIndent: 100,
        thickness: 1),

    ///ICONS
    iconTheme: const IconThemeData(color: COLOR_TEXT),

    ///CHECKBOX
    checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          // If the button is pressed, return COLOR_ACCENT, otherwise color_accent
           if (states.contains(WidgetState.selected)) {
            return COLOR_ACCENT;
          }else{
            return COLOR_BACKGROUND;
          }

        }),
        checkColor: WidgetStateProperty.resolveWith((states) {
          // If the button is pressed, return COLOR_ACCENT, otherwise color_accent
          if (states.contains(WidgetState.pressed)) {
            return COLOR_ACCENT_SECONDARY;
          } else if (states.contains(WidgetState.hovered)) {
            return COLOR_ACCENT_SECONDARY;
          }
          return COLOR_ACCENT_SECONDARY;
        }),
        side: const BorderSide(color: COLOR_HINT)),

    ///DRAWER
    drawerTheme: const DrawerThemeData(
        width: 200, backgroundColor: COLOR_BACKGROUND, elevation: 10),

    ///SWITCH
    switchTheme: SwitchThemeData(



      thumbColor: WidgetStateProperty.resolveWith((states) {
        // If the button is pressed, return COLOR_ACCENT, otherwise color_accent
        if (states.contains(WidgetState.pressed)) {
          return COLOR_ACCENT_PRESSED;
        } else if (states.contains(WidgetState.hovered)) {
          return COLOR_ACCENT_HOVER;
        }
        return COLOR_ACCENT;
      }),

      trackColor: WidgetStateProperty.resolveWith((states) {
        // If the button is pressed, return COLOR_ACCENT, otherwise color_accent
        if (states.contains(WidgetState.selected)) {
          return COLOR_ACCENT_PRESSED;
        } else if (states.contains(WidgetState.hovered)) {
          return COLOR_HINT;
        } else if (states.contains(WidgetState.focused)) {
          return COLOR_HINT;
        } else if (states.contains(WidgetState.disabled)) {
          return COLOR_HINT;
        } else {
          return COLOR_HINT;
        }
      }),
    ),

    ///CURSOR
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: COLOR_ACCENT,
        selectionHandleColor: COLOR_ACCENT,
        selectionColor: COLOR_ACCENT.withOpacity(0.3)), //Textfields

    ///SNACKBAR
    snackBarTheme: SnackBarThemeData(
        backgroundColor: COLOR_BACKGROUND,
        behavior: SnackBarBehavior.floating,
        contentTextStyle: estiloCaption(),
        elevation: 5),

    ///DROPDOWN
    canvasColor: COLOR_BACKGROUND_SECONDARY,

    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: estiloBody(),
        inputDecorationTheme: InputDecorationTheme(

            ///Estilo Inicio
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
              borderSide: BorderSide(color: COLOR_HINT, width: SIZE_BORDE),
            ),

            ///Estilo Focus
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(RADIUS)),
              borderSide:
                  BorderSide(color: COLOR_ACCENT, width: SIZE_BORDER_FOCUS),
            ),

            ///Relleno
            filled: true,

            ///Color de prefix icon
            prefixIconColor: COLOR_HINT,
            hintStyle: estiloBody(color: COLOR_SUBTEXT))),

    bottomAppBarTheme:
        const BottomAppBarTheme(color: COLOR_BACKGROUND, elevation: 10),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: COLOR_BACKGROUND, elevation: 10),

    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: COLOR_BACKGROUND, elevation: 10),

    //bannerTheme: const MaterialBannerThemeData(),
    //buttonBarTheme: const ButtonBarThemeData(),
    //elevatedButtonTheme: const ElevatedButtonThemeData(),

    //buttonTheme: ButtonThemeData(), //This class is planned to be deprecated in a future release. Use "TextButtonThemeData" instead.

    chipTheme: const ChipThemeData(),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: COLOR_BACKGROUND,
      sizeConstraints: BoxConstraints(minHeight: 70, minWidth: 70),
    ),

    cupertinoOverrideTheme: const CupertinoThemeData(),

    dataTableTheme: const DataTableThemeData(),

    dialogTheme: const DialogTheme(),

    expansionTileTheme: const ExpansionTileThemeData(),

    /*
    //TEMAS
    textTheme: TextTheme(

      //DISPLAY
      displayLarge: getEstilo(57, TEXTO_NEGRITA, COLOR_TEXTO_DARK), ///USE
      displayMedium : getEstilo(45, TEXTO_NEGRITA, COLOR_TEXTO_DARK),
      displaySmall: getEstilo(36, TEXTO_NEGRITA, COLOR_TEXTO_DARK),

      //HEADLINE
      headlineLarge: getEstilo(32, TEXTO_NORMAL, COLOR_TEXTO_DARK), ///USE
      headlineMedium : getEstilo(28, TEXTO_NORMAL, COLOR_TEXTO_DARK),
      headlineSmall: getEstilo(24, TEXTO_NORMAL, COLOR_TEXTO_DARK),

      //TITLE
      titleLarge: getEstilo(22, TEXTO_NEGRITA, COLOR_TEXTO_DARK), ///USER
      titleMedium : getEstilo(16, TEXTO_NEGRITA, COLOR_TEXTO_DARK),
      titleSmall: getEstilo(14, TEXTO_NEGRITA, COLOR_TEXTO_DARK),

      //LABEL
      labelLarge: getEstilo(14, TEXTO_NEGRITA, COLOR_TEXTO_DARK),
      labelMedium : getEstilo(12, TEXTO_NEGRITA, COLOR_TEXTO_DARK),
      labelSmall: getEstilo(11, TEXTO_NEGRITA, COLOR_TEXTO_DARK), ///USER

      //BODY
      bodyLarge: getEstilo(16, TEXTO_NORMAL, COLOR_TEXTO_DARK), ///USER
      bodyMedium : getEstilo(14, TEXTO_NORMAL, COLOR_TEXTO_DARK),
      bodySmall: getEstilo(12, TEXTO_NORMAL, COLOR_TEXTO_DARK),


    ),
     */

    // Estilos de textfields

    listTileTheme: const ListTileThemeData(),

    navigationBarTheme: const NavigationBarThemeData(),

    outlinedButtonTheme: const OutlinedButtonThemeData(),

    pageTransitionsTheme: const PageTransitionsTheme(),

    primaryIconTheme: const IconThemeData(),

    popupMenuTheme: const PopupMenuThemeData(),

    primaryTextTheme: const TextTheme(),

    progressIndicatorTheme: const ProgressIndicatorThemeData(),

    radioTheme: const RadioThemeData(),

    scrollbarTheme: const ScrollbarThemeData(),

    sliderTheme: const SliderThemeData(),

    tabBarTheme: const TabBarTheme(),

    /*
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: COLOR_ACCENT,
        onPrimary: COLOR_ACCENT,
        secondary: COLOR_ACCENT,
        onSecondary: COLOR_ACCENT,
        error: COLOR_ACCENT,
        onError: COLOR_ACCENT,
        background: COLOR_ACCENT,
        onBackground: COLOR_ACCENT,
        surface: COLOR_ACCENT,
        onSurface: COLOR_ACCENT
    ),

    disabledColor: COLOR_BACKGROUND_DARK, //The color used for widgets that are inoperative, regardless of their state. For example, a disabled checkbox (which may be checked or unchecked).
    dividerColor: COLOR_BACKGROUND_DARK, //The color of Dividers and PopupMenuDividers, also used between ListTiles, between rows in DataTables, and so forth.
    dialogBackgroundColor: COLOR_BACKGROUND_SECUNDARIO_DARK, //The background color of Dialog elements.
    focusColor: COLOR_BACKGROUND_SECUNDARIO_DARK,  //The focus color used indicate that a component has the input focus
    highlightColor: COLOR_BACKGROUND_DARK, //The highlight color used during ink splash animations or to indicate an item in a menu is selected.
    hintColor: COLOR_BACKGROUND_DARK, //The color to use for hint text or placeholder text, e.g. in TextField fields.
    hoverColor: COLOR_BACKGROUND_DARK, //The hover color used to indicate when a pointer is hovering over a component.
    indicatorColor: COLOR_ACCENT, //The color of the selected tab indicator in a tab bar.
    scaffoldBackgroundColor: COLOR_BACKGROUND_DARK, //The default color of the Material that underlies the Scaffold. The background color for a typical material app or a page within the app.
    secondaryHeaderColor: COLOR_BACKGROUND_DARK, //The color of the header of a PaginatedDataTable when there are selected rows.
    shadowColor: COLOR_BACKGROUND_DARK, //The color that the Material widgets uses to draw elevation shadows.
    splashColor: COLOR_BACKGROUND_DARK, //The color of ink splashes.
    primaryColor: COLOR_ACCENT, //The background color for major parts of the app (toolbars, tab bars, etc)
    primaryColorDark: COLOR_BACKGROUND_SECUNDARIO_DARK, //A darker version of the primaryColor.
    primaryColorLight: COLOR_BACKGROUND_SECUNDARIO_DARK, //A lighther version of the primaryColor.
    unselectedWidgetColor: COLOR_BACKGROUND_DARK,


     */

    timePickerTheme: const TimePickerThemeData(),

    toggleButtonsTheme: const ToggleButtonsThemeData(),

    tooltipTheme: const TooltipThemeData(),

    typography: Typography(),

    visualDensity: const VisualDensity(),
  );
}

//FUNCTIONS
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

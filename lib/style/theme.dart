import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static bool isDark=true; //3ayz al variable da connect m3 al themedmood

  static Color lightPrimary=Colors.white ; //law bst5dm al color da fe kza mkan a3ml fe variable ahsn
  static Color lightsecondary=Color( 0xff004182) ;

  static Color darkPrimary=Color( 0xff141922) ;
  static Color darksecondary=Colors.white ;


  static ThemeData lighttheme=ThemeData(


    colorScheme: ColorScheme.fromSeed(
      onPrimaryContainer: Colors.white,
      seedColor: lightPrimary,
      primary: lightPrimary ,
      onPrimary: Colors.black   ,
      secondary:lightsecondary,
      onSecondary:lightsecondary ,//login
      tertiary: Colors.white,
    ),

    //dividerColor: lightPrimary,

    textTheme: TextTheme(
      //predefine style htla2e al app byst5dmha wenta msh 3arf bs adr aghyrha w ast5dmha 3ady mynf3sh tst5dm etnen mn material design mokhtlfen
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600, //da semi bold,
        color:lightsecondary,
      ),

      labelMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),

 /*     bodyMedium: TextStyle(
        color: lightsecondary,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),*/

      labelSmall: TextStyle(
        fontSize: 16,
        color: Color(0xff1F1F1F),
        fontWeight: FontWeight.w300,

      ),

      labelLarge: TextStyle(
        fontSize: 20,
        color: lightPrimary,
        fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: lightsecondary,

      ),


    ),






  );

  static ThemeData Darktheme=ThemeData(


    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimary,
      primary: darkPrimary ,
      onPrimary: Colors.white ,
      secondary:darksecondary ,
      onSecondary:Colors.white ,
      tertiary: Color(0xff343538),
      onPrimaryContainer:Colors.black,

    ),

    //dividerColor: lightPrimary,

    textTheme: TextTheme(
      //predefine style htla2e al app byst5dmha wenta msh 3arf bs adr aghyrha w ast5dmha 3ady mynf3sh tst5dm etnen mn material design mokhtlfen
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600, //da semi bold,
        color:darksecondary,
      ),

      labelMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),

      /*     bodyMedium: TextStyle(
        color: lightsecondary,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),*/

      labelSmall: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w300,

      ),

      labelLarge: TextStyle(
          fontSize: 20,
          color: darksecondary ,
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: darksecondary ,

      ),


    ),






  );

}
/*
 * Class Activity 2 - Scaled Down
 * Anshuk Arun
 * 
 * I've created a custom ThemeClass
 * that holds custom ThemeData for a pastel and purple theme
 * the scaffoldBackground, text, and Buttons change according to the theme.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

/* Custom Colors */
class ThemeClass {
  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData();

  static ThemeData pastelTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(254, 250, 224, 1.000), //Color: Cornsilk for ScaffoldBackground
    //primaryColor: Color.fromRGBO(250, 237, 205, 1.000),
    //secondaryHeaderColor: Colors.black,
    textTheme: Typography.blackCupertino,
    //shadowColor: Color.fromRGBO(204, 213 , 174, 1.000),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromRGBO(212, 164, 115, 1.000), //Color: Buff for Text
        backgroundColor: Color.fromRGBO(250, 237, 205, 1.000)  //Color: Papya Whip for button
      )
    )
  );
  

  static ThemeData purpleTheme = ThemeData(
    scaffoldBackgroundColor:Color.fromRGBO(134, 97, 193, 1), // Amethyst for Scaffold
    //primaryColor: Color.fromRGBO(202, 156, 225, 1.000),
    //secondaryHeaderColor: Colors.white,
    textTheme: Typography.whiteCupertino,
    //shadowColor: Color.fromRGBO(129, 0, 129, 1.000)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromRGBO(129, 0, 129, 1), // Purple for Text
        backgroundColor: Color.fromRGBO(203, 156, 242, 1) //Color: Wisteria for Button Background
      )
    ) 
  );

}
//ThemeClass _themeClass = ThemeClass();
/* Custom Colors END */


class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  // use this method method to change the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeClass.pastelTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.blue,
      //     brightness: Brightness.light,
      //   ),
      // ),

      // standard dark theme
      darkTheme: ThemeClass.purpleTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Class Act 02 - AnshukArun '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose your device Theme:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        changeTheme(ThemeMode.light); //Pastel
                      },
                      child: Text('Pastel Mode')),
                  ElevatedButton(
                      onPressed: () {
                        changeTheme(ThemeMode.dark);  //Purple
                      },
                      child: Text('Purple Mode')),
                ],
                // Create two buttons here and change the theme when the button is pressed. use children[] and create two button inside it.
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      changeTheme(ThemeMode.system);
        
                    },
                    child: Text('System Mode'))
                ],
                // Create a third button here, below the previous two buttons, and change the theme to a Purple mode when button is pressed.
              )
            ],
          ),
        ),
      ),
    );
  }
}
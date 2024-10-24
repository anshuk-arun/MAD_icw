import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Aquarium());
}

class Aquarium extends StatelessWidget {
  const Aquarium({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Aquarium',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AquariumHome(title: 'Virtual Aquarium'),
    );
  }
}

class AquariumHome extends StatefulWidget {
  const AquariumHome({super.key, required this.title});

  final String title;

  @override
  State<AquariumHome> createState() => _AquariumState();
}

// Fish Class
class Fish {
  Offset position;
  FishColor fishColor;
  bool direction;




  
  Fish({this.position = const Offset(100, 100), required this.fishColor, this.direction = true});
}

// Color of the Fish
enum FishColor {
    blue("Blue", Colors.blue),
    red("Red", Colors.red),
    green("Green", Colors.green),
    orange("Orange", Colors.orange),
    black("Black", Colors.black);

    const FishColor(this.label, this.color);
    final String label;
    final Color color;
  }



class _AquariumState extends State<AquariumHome> {

  List<Fish> fishies = [];
  List<Widget> fishWidgets = <Widget>[];
  double _swimSliderValue = 2;
  final TextEditingController _fishColorController = TextEditingController();
  FishColor? selectedFishColor;

  // AnimationController _controller;
  // @override
  // void initState() {
  // _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
  // // Add your animation logic here.
  // super.initState();
  // }

  // Add a new Fish with random color and direction
  void _addFish(){
    setState(() {
      var addfishX = Random().nextDouble() * 100;
      var addfishY = Random().nextDouble() * 100;
      fishies.add(Fish(position: Offset(addfishX, addfishY), fishColor: _randomFishColor(), direction: Random().nextBool()));
    });
  }

  // Helper Function for _addFish()
  // Random Fish Color
  FishColor _randomFishColor(){

    var rand = Random().nextInt(5);
    switch (rand) {
      case 0:
        return FishColor.blue;
      case 1:
        return FishColor.red;
      case 2:
        return FishColor.green;
      case 3:
        return FishColor.orange;
      case 4:
        return FishColor.black;
      default:
        return FishColor.orange;
    }
  }

  // Save Settings WIP
  void _saveSettings(){

  }

  @override
  Widget build(BuildContext context) {

    // // Initial Fish
    // _addFish();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            // Aquarium Box
            Container(
              width: 300,
              height: 300,
              color: Colors.lightBlueAccent,
              //Fishies
              // Each Fish into the aquarium
              child: ListView(
                children: [
                  for (Fish f in fishies) 
                    (Positioned(
                      left: f.position.dx,
                      top: f.position.dy,
                      child: Transform.flip(
                        flipX: f.direction,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 20, maxHeight: 10),
                          width: 20,
                          height: 10,
                          color: f.fishColor.color),)))
                ],
              ),
            ),

            // First Row of Buttons: AddFish, SaveSettings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: <Widget>[

                // Add new Fish
                ElevatedButton(
                  onPressed: _addFish,
                  child: const Text ("Add New Fish"),
                ),

                // Save Settings
                ElevatedButton(
                  onPressed: _saveSettings,
                  child: const Text("Save Settings"),
                ),

              ],
            ),
            // Slider 1 : Swimming Speed
            Slider(
              value: _swimSliderValue,
              max: 5,
              divisions: 5,
              label: _swimSliderValue.round().toString(),
              onChanged: (double value){
                setState((){
                  _swimSliderValue = value;
                });
              },
            ),
            // Dropdown Fish Colors
            DropdownMenu<FishColor>(
              initialSelection: FishColor.orange,
              controller: _fishColorController,
              requestFocusOnTap: true,
              label: const Text("Fish Color"),
              onSelected: (FishColor? color){
                setState((){
                  selectedFishColor = color;
                });
              },
              dropdownMenuEntries: FishColor.values
                  .map<DropdownMenuEntry<FishColor>>(
                      (FishColor color) {
                return DropdownMenuEntry<FishColor>(
                  value: color,
                  label: color.label,
                  enabled: color.label != 'Grey',
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
                );
              }).toList(),
            ),


          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

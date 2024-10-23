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

// // Fish Class
// Fish {
//   FishColor fc;
//   double swimspeed;

//   Fish({this.fc, this.swimspeed});
// }

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

  List<String> fishies = [];
  double _swimSliderValue = 2;
  final TextEditingController _fishColorController = TextEditingController();
  FishColor? selectedFishColor;

  void _addFish(){

  }

  void _saveSettings(){

  }

  @override
  Widget build(BuildContext context) {
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

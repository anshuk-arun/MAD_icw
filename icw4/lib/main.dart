import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// Application name
      title: 'Stateful Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
// A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final TextEditingController _controller = TextEditingController();
  var text;
  
  //initial counter and increment value
  int _counter = 0;
  final int _incrValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: Text(
                    // displays current value of counter
                    '$_counter',
                    style: TextStyle(fontSize: _counter+10),
                  ),
                ),
                // Take User Input, currently doesn't do anything meaningful with it.
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter Increment Value',
                  ),
                  onChanged: (value){
                    setState(){
                      text = value;
                    }
                  }, //onChanged
                ),
              ],
            ), 
          ),

          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Decrement Counter by 1
              ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: (){
                  setState(() {
                    // Min Counter Limit = 0
                    if (_counter > 0){
                      _counter = _counter - 1;
                    }
                  });
                },
                child: const Text('Decrement'),
              ),
                            
              // Reset Counter to 0
              ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20.0)),
                onPressed: (){
                  setState(() {
                    _counter = 0;
                  });
                },
                child: const Text('Reset'),
              ),
              
              // Increment Counter by 1
              ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: (){
                  setState((){
                    // Max Counter Limit = 100
                    if (_counter < 100){
                      _counter = _counter + 1;
                    }
                    // if (text == null){
                    //   _counter += 1;
                    // }
                    // else if (int.parse(text) is int){
                    //   _counter = _counter + int.parse(text);
                    // }
                  });
                },
                child: const Text('Increment'),
              ),

            ],
          ),
        ],
      ),
    );
  } 
}

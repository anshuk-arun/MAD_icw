import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  // MyApp({super.key, required this.controller}) :
  
  // opacity = Tween<double>(
  //   begin: 0.0,
  //   end: 1.0,
  // ).animate(
  //   CurvedAnimation(
  //     parent: controller, 
  //     curve: const Interval(
  //       0.0,
  //       0.100,
  //       curve: Curves.easeInOut,
  //     ),
  //   ),
  // );
  
  // final AnimationController controller;
  // final Animation<double> opacity;
  // final Animation<double> width;
  // final Animation<double> height;
  // final Animation<EdgeInsets> padding;
  // final Animation<BorderRadius?> borderRadius;
  // final Animation<Color?> color;

  // Widget _buildAnimation(BuildContext context, Widget? child){
  //   return Container(
  //     alignment: Alignment.center,
  //     child: Opacity(opacity: opacity.value,
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.red,
  //           border: Border.all(
  //             color: Colors.blue,
  //             width: 3,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // return AnimatedBuilder(
    //   builder: _buildAnimation,
    //   animation: controller,
    //   home: FadingTextAnimation(),
    // )
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  const FadingTextAnimation({super.key});

  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> with TickerProviderStateMixin {
  bool _isVisible = true;
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void cyclone(){
    setState(() {
    });
  }
    // AnimationController _anictrl = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500),
    // );
    
      

  @override
  Widget build(BuildContext context) {

    /*
    Animation colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(_anictrl);
    Animation sizeAnimation;


    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(_anictrl);

    _anictrl.addListener((){
      setState(() {});
    });
    */


    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading Text Animation'),
      ),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: toggleVisibility,
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Column(
                children: [
                  Text(
                    'Hello, Flutter!',
                    style: TextStyle(
                    fontSize: 24
                    ),
                  ),
                  Image.asset("doggie.png"),
                ],
              ),
            ),  
          ),    
        ),
            /*
            Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              color: colorAnimation.value,
              padding: EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap: colorAnimation.animate(_anictrl),
            
            ),
            */
      ),  
          
      
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

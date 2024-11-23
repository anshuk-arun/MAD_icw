import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawingApp(),
      );
    }
}

class DrawingApp extends StatefulWidget {
  const DrawingApp({super.key});

  @override
  _DrawingAppState createState() => _DrawingAppState();
}

class _DrawingAppState extends State<DrawingApp> {
  List<List<Offset>> lines = []; // Use a list of lists for each line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing App'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as
  RenderBox;
            final localPosition =
              renderBox.globalToLocal(details.globalPosition);
            if (lines.isEmpty || lines.last.isEmpty) {
              lines.add([localPosition]);
            } else {
              lines.last.add(localPosition);
            }
          });
        },
        onPanEnd: (_) {
          setState(() {
            lines.add([]);
          });
        },
        child: CustomPaint(
          painter: MyPainter(lines),
          size: Size.infinite,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lines.clear();
          });
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<List<Offset>> lines;
  MyPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {

    
    // Paint paint = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..color = Colors.yellow
    //   ..strokeWidth = 4.0;
    // Path path = Path();

    /* SHAPES
    Paint paintShape = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 5.0;
    Path pathShape = Path();
    // Paint a Square
    pathShape.moveTo(100, 250);
    pathShape.lineTo(300, 250);
    pathShape.lineTo(300, 450);
    pathShape.lineTo(100, 450);
    pathShape.lineTo(100, 250);

    // Paint a Circle
    pathShape.moveTo(100, 150);
    pathShape.addOval(Rect.fromCircle(center: Offset(100, 150), radius: 50));

    // Draw it
    canvas.drawPath(pathShape, paintShape);
    */
    
    
    // EMOJI
    // Face
    Paint paintFace = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.yellow;
    Path path = Path();
    path.addOval(Rect.fromCircle(center: const Offset(200, 250), radius: 100));
    canvas.drawPath(path, paintFace);
    path.reset();

    Paint paintFeatures = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    //Eyes
    //top right of eye, before curve
    double eyeX = 165;
    double eyeY = 190;
    path.moveTo(eyeX, eyeY);
    path.quadraticBezierTo(eyeX+10, eyeY+25, eyeX, eyeY+50);
    path.lineTo(eyeX-10, eyeY+50);
    path.quadraticBezierTo(eyeX-20, eyeY+25, eyeX-10, eyeY);
    path.lineTo(eyeX, eyeY);
    //Second Eye
    eyeX = 240;
    eyeY = 190;
    path.moveTo(eyeX, eyeY);
    path.quadraticBezierTo(eyeX+10, eyeY+25, eyeX, eyeY+50);
    path.lineTo(eyeX-10, eyeY+50);
    path.quadraticBezierTo(eyeX-20, eyeY+25, eyeX-10, eyeY);
    path.lineTo(eyeX, eyeY);

    //Smile
    path.moveTo(135, 275);
    path.quadraticBezierTo(200, 350, 265, 275);
    path.quadraticBezierTo(200, 375, 135, 275);
    canvas.drawPath(path, paintFeatures);
    

    /*
    // Heart WIP
    Paint paintHeart = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 5.0;
    Path pathHeart = Path();

    pathHeart.moveTo(200, 300);
    pathHeart.addArc(Rect.fromCenter(center: Offset(200, 300), width: 1, height: 1), 135, 135);
    pathHeart.arcToPoint(Offset(150, 250), clockwise: false);
    pathHeart.addArc(Rect.fromCenter(center: Offset(200, 300), width: 1, height: 1), 45, 45);
    canvas.drawPath(pathHeart, paintHeart);
    */

    // Paint paint = Paint()
    //   ..color = Colors.blue
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 5.0;
    // for (final line in lines) {
    //   for (int i = 0; i < line.length - 1; i++) {
    //     canvas.drawLine(line[i], line[i + 1], paint);
    //   }
    // }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
  }
}
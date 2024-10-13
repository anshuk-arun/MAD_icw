import 'package:flutter/material.dart';

void main() {
  runApp(const MatchGame());
}

class MatchGame extends StatelessWidget {
  const MatchGame({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Game',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: MatchGameScreen(),
    );
  }
}

class MatchGameScreen extends StatefulWidget {
  const MatchGameScreen({super.key});

  @override
  State<MatchGameScreen> createState() => _MatchGameScreenState();
}

class Card {
  final Image _backDesign = Image.asset("purple-card-back.jpg");
  late String _cardText;
  late bool _isFaceUp;

  Card (String cardText){
    _backDesign;
    _cardText = cardText;
    _isFaceUp = false;
  }

}
class _MatchGameScreenState extends State<MatchGameScreen> {
 
  List<Card> cards = [
    Card("Hello"),
    Card("World"),
  ];


  void flipCard(int index){
    setState(() {
      cards[index]._isFaceUp = !cards[index]._isFaceUp;
    });
  }

  // do cards match?
  // delete from cards list
  void deleteCard(int index){
    setState(() {
      cards.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: cards.length,
            itemBuilder: (context, index){
              return GridTile(
                child: Text(cards[index]._cardText),
              );
            },
          ),
        ),

      ),
    );

  }
}

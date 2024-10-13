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

/*
Card Widget
if facedown, shows backside
if faceup shows cardText
*/
class _MatchGameScreenState extends State<MatchGameScreen> {
 
  List<Card> cards = [
    Card("A"),
    Card("B"),
    Card("A"),
    Card("B"),
    Card("A"),
    Card("B"),
    Card("A"),
    Card("B"),
    
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

  Widget showCardImage(int index){
    // FaceDown
    if (!cards[index]._isFaceUp){
      return Image(image: AssetImage('assets/images/purple-card-back.jpg'));
    }
    // FaceUp
    else{
      return Container(
        // Front of Card Image
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage('assets/images/grey-card-full.jpg'),
            fit: BoxFit.contain,
          ),
        ),
        // Card Text
        child: Center(
          child: Text(cards[index]._cardText),
        ),
      );
      //return Image(image: AssetImage('assets/images/grey-card-full.jpg'));
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: cards.length,
            itemBuilder: (context, index){
              return GridTile(
                // child: Text(cards[index]._cardText),
                child: GestureDetector(
                  child: showCardImage(index),
                  onTap: (){
                    flipCard(index);
                  },
                )
                
              );
            },
        ),

      ),
    );

  }
}

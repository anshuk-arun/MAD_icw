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

class Card extends StatefulWidget{
  final Widget? child;

  Card ({
    super.key,
    this.child,
  });

  // Card (String cardText{
  //   super.key,
  
  //   this.child,
  //   // _backDesign;
  //   // _cardText = cardText;
  //   // _isFaceUp = false;
  // });
  
  @override
  State<Card> createState() => _CardState();

}

class _CardState extends State<Card> {

  final Image _backDesign = Image.asset("purple-card-back.jpg");
  late String _cardText;
  late bool _isFaceUp;

  void createCard(String ct){
    _cardText = ct;
    _isFaceUp = false;
  }

  void flipCard(){
    _isFaceUp = !_isFaceUp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/purple-card-back.jpg'),
            fit: BoxFit.contain,
          ),
          shape: BoxShape.rectangle,
        ),
      child: GestureDetector(
        onTap: flipCard,
      ),
    );
  }

}

class _MatchGameScreenState extends State<MatchGameScreen> {
  
  List<Card> cards = [];
  // cards[0] = Card.
  // List<Card> cards = [
  //   Card("Hello"),
  //   Card("World"),
  // ];

  


  // void flipCard(int index){
  //   setState(() {
  //     cards[index]._isFaceUp = !cards[index]._isFaceUp;
  //   });
  // }

  // do cards match?
  // delete from cards list
  // void deleteCard(int index){
  //   setState(() {
  //     cards.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,

        ),
      )

    );
    // return Scaffold(
    //   backgroundColor: Colors.lightBlueAccent,
    //   body: Center(
    //       child: GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    //         itemCount: cards.length,
    //         itemBuilder: (context, index){
    //           return GridTile(
    //             child: Text(cards[index]._cardText),
    //           );
    //         },
    //     ),

    //   ),
    // );

  }
}

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
  late bool _isFaceDown;
  //late bool _isMatched;

  Card (String cardText){
    _backDesign;
    _cardText = cardText;
    _isFaceDown = true;
    //_isMatched = false;
  }

  // Compare Two Cards together for if their cardTexts match
  bool equalsCard(Card c){
    if (this._cardText == c._cardText){
      return true;
    }
    else{
      return false;
    }
  }

}

/*
Card Widget
if facedown, shows backside
if faceup shows cardText
*/
class _MatchGameScreenState extends State<MatchGameScreen> {
 
  List<Card> cards = [
    // Row 1
    Card("A"),
    Card("B"),
    Card("A"),
    Card("B"),

    // Row 2
    Card("F"),
    Card("C"),
    Card("F"),
    Card("D"),
    
    // Row 3
    Card("E"),
    Card("F"),
    Card("F"),
    Card("E"),
    
    // Row 4
    Card("C"),
    Card("B"),
    Card("D"),
    Card("B"),
    
  ];

  List<Card> matches = [];
  int score = 0;

  // Flip the card face up
  void flipCardFaceUp(int index){
    // Flip the card
    setState(() {
        
      // Face Down Cards can be flipped face up
      if (cards[index]._isFaceDown){
        cards[index]._isFaceDown = !cards[index]._isFaceDown;
        
        // add card to possible matches
        matches.add(cards[index]);
        
        // Check Match
        checkMatch();
      }
      // Face UP Cards are not allowed to flip manually
    });
  }

  void checkMatch(){
    setState(() {
      // 2 cards up for match
      if (matches.length == 2){
        if (matches[0].equalsCard(matches[1])){
          // They Match!
          addPoint();
        }
        else{
          // Reset Cards
          matches[0]._isFaceDown = true;
          matches[1]._isFaceDown = true;
        }
        // Clear the possible matches list regardless of pair was correct match or not
        matches.clear();
      }
      // not enough cards for match, ignore 
    });
  }

  // Add a point for matching a pair
  void addPoint(){
    setState(() {
      score += 1;
    });
  }

  // // delete from cards list
  // void deleteCard(int index){
  //   setState(() {
  //     cards.removeAt(index);
  //   });
  // }

  // Displays either back of Card or front of Card
  Widget showCardImage(int index){
    // FaceDown
    if (cards[index]._isFaceDown){
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
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // App Bar that gives title of app
      appBar: AppBar(
        title: Text('Matching Game'),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.lightBlueAccent,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Score Display
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text('$score'),
          ),
          // Grid of Cards
          Expanded(
            child: SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemCount: cards.length,
                itemBuilder: (context, index){
                  return GridTile(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          // when a card is clicked, if it is facedown, it'll be flippedFaceUp
                          // then it'll be checked if matches
                          flipCardFaceUp(index);
                          // // Then Check if current card matches with another flippedFaceUpCard
                          // checkMatch();                         
                        });
                      },
                      child: showCardImage(index),
                    )
                    
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );

  }
}

      // Face down cards are allowed to be flipped face up
      // if (cards[index]._isFaceDown){
      //   //flipCount += 1;     
      //   cards[index]._isFaceDown = !cards[index]._isFaceDown;
      // }


        // // if this is first card, put this as "prevCard"
        // if (prevCard._cardText == ""){
        //   prevCard = cards[index];
        //   prevIndex = index;
        // }
      
      // else if (flipFaceDownAllowed){
      //   cards[prevIndex]._isFaceDown = !
      // }
      // // Face up cards can't manually be flipped face down
      // // There are 2 face up cards, check if they match, then cleanup variables
      // if (flipCount == 2){
      //   // check if they match
      //   if (prevCard._cardText == cards[index]._cardText){
      //     // Match increments score

      //   }
      //   // Not match, reset
      //   else{
      //     // Flip the cards face down

      //   }

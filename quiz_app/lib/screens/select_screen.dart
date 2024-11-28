import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import '../models/question.dart';
import '../services/api_service.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

// DropdownMenuEntry labels and values for the first dropdown menu.
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

// DropdownMenuEntry labels and values
enum NumQsLabel {
  five('5', 5),
  ten('10', 10),
  fifteen('15', 15);

  const NumQsLabel(this.label, this.num);
  final String label;
  final int num;
}


class _SelectScreenState extends State<SelectScreen> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController numQscontroller = TextEditingController();
  ColorLabel? selectedColor;
  NumQsLabel? selectedNumQs;

  // The Number of Questions in the Quiz. (i.e 5, 10, 15)
  int _selectNumQs = 0;
  //final List<DropdownMenuEntry<int>> numQsEntries = List<DropdownMenuEntry<int>(5, 10, 15);

  // The Trivia Category (i.e General Knowledge, Sports, Movies)
  String _selectCategory = "";

  // Easy, Medium, or Hard
  String _selectDifficulty = "";
  
  //  stores the User's selected question type. (MultipleChoice or True/False)
  String _selectType = "";

  // Used for CategoryLookup function
  // Stores the entire list of (Category, ID) in the Database
  List<(String, int)> _categoryLookup = [];

  
  
  @override
  void initState() {
    super.initState();
  }

  // Widget _buildOptionButton(String option) {
  //   return ElevatedButton(
  //     onPressed: _answered ? null : () => _submitAnswer(option),
  //     style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
  //     child: Text(option),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // if (_loading) {
    //   return Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }
    // if (_currentQuestionIndex >= _questions.length) {
    //   return Scaffold(
    //     body: Center(
    //       child:
    //           Text('Quiz Finished! Your Score: $_score/${_questions.length}'),
    //     ),
    //   );
    // }
    //final question = _questions[_currentQuestionIndex];
  
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Quiz Setup',
              style: TextStyle(fontSize: 20),
            ),
            // DropdownMenu<int>(
            //   initialSelection: 5,
            //   label: const Text('Number of Questions'),
            //   onSelected: (int? numQ){
            //     setState(() {
            //       _selectNumQs = numQ!;
            //     });
            //   },
            //   dropdownMenuEntries: NumQsLabel.values.map<DropdownMenuEntry<NumQsLabel>>(
            //     (NumQsLabel entry) {
            //       return DropdownMenuEntry<NumQsLabel>(
            //         value: entry,
            //         label: entry.label,
            //       );
            //   }).toList(),
            // ),
            DropdownMenu<ColorLabel>(
              initialSelection: ColorLabel.green,
              controller: colorController,
              // requestFocusOnTap is enabled/disabled by platforms when it is null.
              // On mobile platforms, this is false by default. Setting this to true will
              // trigger focus request on the text field and virtual keyboard will appear
              // afterward. On desktop platforms however, this defaults to true.
              requestFocusOnTap: true,
              label: const Text('Color'),
              onSelected: (ColorLabel? color) {
                setState(() {
                  selectedColor = color;
                });
              },
              dropdownMenuEntries: ColorLabel.values
                  .map<DropdownMenuEntry<ColorLabel>>(
                      (ColorLabel color) {
                return DropdownMenuEntry<ColorLabel>(
                  value: color,
                  label: color.label,
                  enabled: color.label != 'Grey',
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  QuizScreen();
                });
              }, 
              child: const Text("Go to Default Quiz")
            ),
            // SizedBox(height: 16),
            // Text(
            //   question.question,
            //   style: TextStyle(fontSize: 18),
            // ),
            // SizedBox(height: 16),
            // ...question.options.map((option) => _buildOptionButton(option)),
            // SizedBox(height: 20),
            // if (_answered)
            //   Text(
            //     _feedbackText,
            //     style: TextStyle(
            //       fontSize: 16,
            //       color: _selectedAnswer == question.correctAnswer
            //           ? Colors.green
            //           : Colors.red,
            //     ),
            //   ),
            // if (_answered)
            //   ElevatedButton(
            //     onPressed: _nextQuestion,
            //     child: Text('Next Question'),
            //   ),

          ],
        ),
      ),
    );
  }
}

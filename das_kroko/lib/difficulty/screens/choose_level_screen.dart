import 'package:das_kroko/app/getit/getit_setup.dart';
import 'package:das_kroko/card/screens/word_card_screen.dart';
import 'package:das_kroko/corpus/logic/mobx/corpus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChooseLevelScreen extends StatefulWidget {
  static const String routeName = '/';


  const ChooseLevelScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLevelScreen> createState() => _ChooseLevelScreenState();
}

class _ChooseLevelScreenState extends State<ChooseLevelScreen> {
   final Corpus _corpus=getIt<Corpus>();

  @override
  void initState() {
    super.initState();
    _corpus.initIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Difficulty Level'),
      ),
      body: Observer(builder: (context) {
        return Center(
          child: _body(context),
        );
      }),
    );
  }

  Widget _body(BuildContext context) {
    if (_corpus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _levelButtons(context),
      );
    }
  }

  List<Widget> _levelButtons(BuildContext context) {
    return List.generate(
      3,
      (level) => SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              WordCardScreen.routeName,
              arguments: WordCardScreenArguments(difficultyLevel: level + 1),
            );
          },
          child: Text('Level ${level + 1}'),
        ),
      ),
    );
  }
}

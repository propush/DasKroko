import 'package:das_kroko/app/getit/getit_setup.dart';
import 'package:das_kroko/card/logic/mobx/word.dart';
import 'package:das_kroko/card/screens/countdown_timer_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class WordCardScreenArguments {
  final int difficultyLevel;

  WordCardScreenArguments({
    required this.difficultyLevel,
  });
}

class WordCardScreen extends StatefulWidget {
  static const routeName = '/word_card_screen';
  final int difficultyLevel;

  const WordCardScreen({Key? key, required this.difficultyLevel})
      : super(key: key);

  @override
  State<WordCardScreen> createState() => _WordCardScreenState();
}

class _WordCardScreenState extends State<WordCardScreen> {
  final Word _word = getIt<Word>();

  @override
  void initState() {
    super.initState();
    _word.setDifficultyLevel(widget.difficultyLevel);
  }

  @override
  void dispose() {
    _word.finishGame();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Card'),
      ),
      body: Observer(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Level: ${_word.difficultyLevel}',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: _word.state != WordState.started,
                child: Text(
                  _word.word,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              const SizedBox(height: 16),
              _startWidget(context),
            ],
          ),
        );
      }),
    );
  }

  Widget _startWidget(BuildContext context) {
    switch (_word.state) {
      case WordState.initial:
        return ElevatedButton(
          onPressed: () => _word.startGame(),
          child: const SizedBox(
            width: 300,
            child: Text(
              'Start',
              textAlign: TextAlign.center,
            ),
          ),
        );
      case WordState.started:
        return Column(
          children: [
            CountDownTimerWidget(
              warningSeconds: 10,
              countdownSeconds: _word.timerSeconds,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () => _word.finishGame(),
                child: const Text('Stop'),
              ),
            ),
            const SizedBox(height: 50),
            _hintWidget(context),
          ],
        );
      case WordState.finished:
        return Column(
          children: [
            Text(
              'Finished',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Play again')),
            )
          ],
        );
    }
  }

  Widget _hintWidget(BuildContext context) {
    String hint = 'Tap to show word';
    if (_word.hintShown) {
      hint = _word.word;
    }
    return SizedBox(
      width: 300,
      child: InkWell(
        child: Text(
          hint,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black26),
        ),
        onTap: () => _word.toggleHint(),
      ),
    );
  }
}

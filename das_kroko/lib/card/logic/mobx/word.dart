import 'dart:async';

import 'package:das_kroko/corpus/logic/mobx/corpus.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'word.g.dart';

@injectable
class Word extends _Word with _$Word {
  Word(Corpus corpus) : super(corpus);
}

enum WordState {
  initial,
  started,
  finished,
}

abstract class _Word with Store {
  @observable
  int timerDurationSec = 0;

  final Corpus corpus;

  _Word(this.corpus);

  @observable
  int? difficultyLevel;

  @observable
  WordState state = WordState.initial;

  @observable
  int timerSeconds = 0;

  @observable
  bool hintShown = false;

  @computed
  String get word {
    if (difficultyLevel == null) {
      setError('Difficulty not set');
      return '';
    }
    var word = corpus.getWord(difficultyLevel!);
    if (word == null) {
      print('Word not found');
      setError('No word found for difficulty level $difficultyLevel');
      return '';
    }
    return word;
  }

  @observable
  String error = '';

  Timer? _timer;

  @action
  void setError(String error) {
    this.error = error;
  }

  @action
  void setTimerDurationSec(int timerDurationSec) {
    this.timerDurationSec = timerDurationSec;
  }

  @action
  void setDifficultyLevel(int difficultyLevel) =>
      this.difficultyLevel = difficultyLevel;

  @action
  void startGame() {
    state = WordState.started;
    timerSeconds = timerDurationSec;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // print('Tick $timerSeconds');
      if (timerSeconds > 0) {
        timerSeconds--;
      } else {
        finishGame();
      }
    });
  }

  @action
  void finishGame() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    state = WordState.finished;
  }

  @action
  void toggleHint() => hintShown = !hintShown;
}

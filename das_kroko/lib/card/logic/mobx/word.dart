import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'word.g.dart';

@injectable
class Word extends _Word with _$Word {
  Word();
}

enum WordState {
  initial,
  started,
  finished,
}

abstract class _Word with Store {
  static const int timerDurationSec = 3 * 60;

  @observable
  int? difficultyLevel;

  @observable
  WordState state = WordState.initial;

  @observable
  int timerSeconds = 0;

  @observable
  bool hintShown = false;

  @computed
  String get word => 'word $difficultyLevel';

  Timer? _timer;

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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Word on _Word, Store {
  Computed<String>? _$wordComputed;

  @override
  String get word => (_$wordComputed ??=
          Computed<String>(() => super.word, name: '_Word.word'))
      .value;

  final _$timerDurationSecAtom = Atom(name: '_Word.timerDurationSec');

  @override
  int get timerDurationSec {
    _$timerDurationSecAtom.reportRead();
    return super.timerDurationSec;
  }

  @override
  set timerDurationSec(int value) {
    _$timerDurationSecAtom.reportWrite(value, super.timerDurationSec, () {
      super.timerDurationSec = value;
    });
  }

  final _$difficultyLevelAtom = Atom(name: '_Word.difficultyLevel');

  @override
  int? get difficultyLevel {
    _$difficultyLevelAtom.reportRead();
    return super.difficultyLevel;
  }

  @override
  set difficultyLevel(int? value) {
    _$difficultyLevelAtom.reportWrite(value, super.difficultyLevel, () {
      super.difficultyLevel = value;
    });
  }

  final _$stateAtom = Atom(name: '_Word.state');

  @override
  WordState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(WordState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$timerSecondsAtom = Atom(name: '_Word.timerSeconds');

  @override
  int get timerSeconds {
    _$timerSecondsAtom.reportRead();
    return super.timerSeconds;
  }

  @override
  set timerSeconds(int value) {
    _$timerSecondsAtom.reportWrite(value, super.timerSeconds, () {
      super.timerSeconds = value;
    });
  }

  final _$hintShownAtom = Atom(name: '_Word.hintShown');

  @override
  bool get hintShown {
    _$hintShownAtom.reportRead();
    return super.hintShown;
  }

  @override
  set hintShown(bool value) {
    _$hintShownAtom.reportWrite(value, super.hintShown, () {
      super.hintShown = value;
    });
  }

  final _$errorAtom = Atom(name: '_Word.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_WordActionController = ActionController(name: '_Word');

  @override
  void setError(String error) {
    final _$actionInfo =
        _$_WordActionController.startAction(name: '_Word.setError');
    try {
      return super.setError(error);
    } finally {
      _$_WordActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTimerDurationSec(int timerDurationSec) {
    final _$actionInfo =
        _$_WordActionController.startAction(name: '_Word.setTimerDurationSec');
    try {
      return super.setTimerDurationSec(timerDurationSec);
    } finally {
      _$_WordActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDifficultyLevel(int difficultyLevel) {
    final _$actionInfo =
        _$_WordActionController.startAction(name: '_Word.setDifficultyLevel');
    try {
      return super.setDifficultyLevel(difficultyLevel);
    } finally {
      _$_WordActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startGame() {
    final _$actionInfo =
        _$_WordActionController.startAction(name: '_Word.startGame');
    try {
      return super.startGame();
    } finally {
      _$_WordActionController.endAction(_$actionInfo);
    }
  }

  @override
  void finishGame() {
    final _$actionInfo =
        _$_WordActionController.startAction(name: '_Word.finishGame');
    try {
      return super.finishGame();
    } finally {
      _$_WordActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleHint() {
    final _$actionInfo =
        _$_WordActionController.startAction(name: '_Word.toggleHint');
    try {
      return super.toggleHint();
    } finally {
      _$_WordActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timerDurationSec: ${timerDurationSec},
difficultyLevel: ${difficultyLevel},
state: ${state},
timerSeconds: ${timerSeconds},
hintShown: ${hintShown},
error: ${error},
word: ${word}
    ''';
  }
}

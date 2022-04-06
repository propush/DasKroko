// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_level.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Level on _Level, Store {
  final _$timerSecondsAtom = Atom(name: '_Level.timerSeconds');

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

  final _$_LevelActionController = ActionController(name: '_Level');

  @override
  void setTimerSeconds(int timerSeconds) {
    final _$actionInfo =
        _$_LevelActionController.startAction(name: '_Level.setTimerSeconds');
    try {
      return super.setTimerSeconds(timerSeconds);
    } finally {
      _$_LevelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timerSeconds: ${timerSeconds}
    ''';
  }
}

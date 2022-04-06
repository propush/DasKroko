import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'choose_level.g.dart';

@singleton
class Level extends _Level with _$Level {
  Level();
}

abstract class _Level with Store {
  @observable
  int timerSeconds = 180;

  @action
  void setTimerSeconds(int timerSeconds) {
    this.timerSeconds = timerSeconds;
  }
}

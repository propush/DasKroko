import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

class CountDownTimerWidget extends StatelessWidget {
  final int countdownSeconds;
  final int warningSeconds;

  const CountDownTimerWidget({
    Key? key,
    this.warningSeconds = 0,
    required this.countdownSeconds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (countdownSeconds <= 0) {
      FlutterBeep.beep(false);
    } else if (countdownSeconds <= warningSeconds) {
      FlutterBeep.beep(true);
    }
    return Text(
      _secondsToTimer(countdownSeconds),
      style: TextStyle(
        fontSize: 100,
        fontWeight: FontWeight.bold,
        color: _color(),
      ),
    );
  }

  Color _color() {
    if (countdownSeconds <= 10) {
      return Colors.red;
    } else if (countdownSeconds <= 20) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  String _secondsToTimer(int countdownSeconds) {
    final int minutes = (countdownSeconds / 60).floor();
    final int seconds = (countdownSeconds % 60).floor();

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

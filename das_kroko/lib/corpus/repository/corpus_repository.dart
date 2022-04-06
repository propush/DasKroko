import 'package:das_kroko/corpus/entity/num_entity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@singleton
class CorpusRepository {
  static const String _wordFile = 'assets/words.txt';
  static final Pattern _stringSplitPattern = RegExp(r'\n');
  static final Pattern _splitPattern = RegExp(r'\s+');

  Future<List<NumRow>> loadWords() async {
    print('Loading $_wordFile');
    var loadString = rootBundle.loadString(_wordFile, cache: false);
    loadString
        .then((value) => print('Loaded $_wordFile: ${value.length} bytes'));
    return loadString
        .then((value) => value
            .split(_stringSplitPattern)
            .where((element) => element.isNotEmpty))
        .then((value) => value.map((e) => parseNumRow(e.trim())).toList()
          ..sort((a, b) => a.freq.compareTo(b.freq)));
  }

  NumRow parseNumRow(String value) {
    final split = _split(value, _splitPattern);
    if (split.length != 2) {
      throw FormatException('Invalid row: $value, split: $split');
    }
    return NumRow(
      double.parse(split[0]).toInt(),
      split[1],
    );
  }

  List<String> _split(String value, Pattern splitPattern) {
    final start = value.indexOf(splitPattern);
    if (start == -1) {
      return List.empty();
    }
    return [
      value.substring(0, start),
      value.substring(start + 1),
    ];
  }
}

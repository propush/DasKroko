import 'package:das_kroko/corpus/entity/num_entity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@singleton
class CorpusRepository {
  static const String _adjFile = 'assets/adj.num';
  static const String _nounFile = 'assets/noun.num';
  static final Pattern _stringSplitPattern = RegExp(r'\n');
  static final Pattern _splitPattern = RegExp(r'\s+');

  Future<List<NumRow>> getAllAdj() async => _getAllFromFile(_adjFile);

  Future<List<NumRow>> getAllNoun() async => _getAllFromFile(_nounFile);

  Future<List<NumRow>> _getAllFromFile(String fileName) async {
    print('Loading $fileName');
    var loadString = rootBundle.loadString(fileName, cache: false);
    loadString
        .then((value) => print('Loaded $fileName: ${value.length} bytes'));
    return loadString
        .then((value) => value
            .split(_stringSplitPattern)
            .where((element) => element.isNotEmpty))
        .then((value) => value.map((e) => parseNumRow(e.trim())).toList());
  }

  NumRow parseNumRow(String value) {
    var split = value.split(_splitPattern);
    if (split.length != 4) {
      throw FormatException('Invalid row: $value, split: $split');
    }
    return NumRow(
      double.parse(split[1]).toInt(),
      split[2],
    );
  }
}

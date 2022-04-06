import 'dart:math';

import "package:collection/collection.dart";
import 'package:das_kroko/corpus/entity/num_entity.dart';
import 'package:das_kroko/corpus/repository/corpus_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'corpus.g.dart';

@singleton
class Corpus extends _Corpus with _$Corpus {
  static const int maxInt = 0x7fffffff;

  final int frequencyDistribution = 3;

  final _random = Random(Random().nextInt(maxInt));

  final Map<int, List<int>> _frequencies = {};

  final CorpusRepository _corpusRepository;

  List<NumRow> wordList = List.empty();

  bool isInitialized = false;

  Corpus(this._corpusRepository);

  Future<void> initIfNeeded() async {
    if (isInitialized) {
      return;
    }
    setLoading(true);
    wordList = await _corpusRepository.loadWords();
    _fillFreqs(wordList);
    isInitialized = true;
    setLoading(false);
    print('Corpus initialized, size: ${wordList.length}');
  }

  String? getWord(int difficultyLevel) {
    final from = _frequencies[difficultyLevel]![0];
    final to = _frequencies[difficultyLevel]![1];
    final matchingWords = wordList
        .where((element) => from < to
            ? (element.freq > from && element.freq <= to)
            : (element.freq >= from && element.freq <= to))
        .map((e) => e.data)
        .toList();
    if (matchingWords.isEmpty) {
      return null;
    }
    return _randomElement(matchingWords);
  }

  T _randomElement<T>(List<T> list) => list[_random.nextInt(list.length)];

  void _fillFreqs(List<NumRow> wordList) {
    var distribution = wordList
        .groupListsBy((element) => element.freq)
        .map((key, value) => MapEntry(key, value.length));
    final total = distribution.values.reduce((a, b) => a + b);
    final distributionDelta = total ~/ frequencyDistribution;
    print('total: $total, distributionDelta: $distributionDelta');
    var currentDelta = 0;
    var freqCounter = frequencyDistribution;
    var prevKey = distribution.keys.first;
    distribution.forEach((key, value) {
      currentDelta += value;
      if (currentDelta > distributionDelta) {
        _frequencies[freqCounter] = [prevKey, key];
        currentDelta = 0;
        prevKey = key;
        freqCounter--;
      }
    });
    _frequencies[freqCounter] = [prevKey, maxInt];
    print('_frequencies: $_frequencies');
  }
}

abstract class _Corpus with Store {
  @observable
  bool loading = false;

  @action
  void setLoading(bool loading) {
    this.loading = loading;
  }
}

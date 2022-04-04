import 'dart:math';

import 'package:das_kroko/corpus/entity/num_entity.dart';
import 'package:das_kroko/corpus/repository/corpus_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'corpus.g.dart';

@singleton
class Corpus extends _Corpus with _$Corpus {
  static const int maxInt = 0x7fffffff;

  final _random = Random(Random().nextInt(maxInt));

  final Map<int, List<int>> _frequencies = const {
    1: [60, maxInt, 80, maxInt],
    2: [30, 60, 30, 80],
    3: [0, 30, 0, 30],
  };

  final CorpusRepository _corpusRepository;

  List<NumRow> adjList = List.empty();
  List<NumRow> nounList = List.empty();

  bool isInitialized = false;

  Corpus(this._corpusRepository);

  Future<void> initIfNeeded() async {
    if (isInitialized) {
      return;
    }
    setLoading(true);
    adjList = await _corpusRepository.getAllAdj();
    nounList = await _corpusRepository.getAllNoun();
    adjList.sort((a, b) => a.freq.compareTo(b.freq));
    nounList.sort((a, b) => a.freq.compareTo(b.freq));
    isInitialized = true;
    setLoading(false);
    print('Corpus initialized');
  }

  String getWord(int difficultyLevel) {
    final adjs = adjList
        .where((element) =>
            element.freq > _frequencies[difficultyLevel]![0] &&
            element.freq <= _frequencies[difficultyLevel]![1])
        .map((e) => e.data)
        .toList();
    final nouns = nounList
        .where((element) =>
            element.freq > _frequencies[difficultyLevel]![2] &&
            element.freq <= _frequencies[difficultyLevel]![3])
        .map((e) => e.data)
        .toList();
    final adj = _randomElement(adjs);
    final noun = _randomElement(nouns);
    return 'Word $difficultyLevel: $adj $noun';
  }

  T _randomElement<T>(List<T> list) => list[_random.nextInt(list.length)];
}

abstract class _Corpus with Store {
  @observable
  bool loading = false;

  @action
  void setLoading(bool loading) {
    this.loading = loading;
  }
}

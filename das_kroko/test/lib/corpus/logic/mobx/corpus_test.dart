import 'package:das_kroko/corpus/logic/mobx/corpus.dart';
import 'package:das_kroko/corpus/repository/corpus_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Corpus corpus;
  group('Corpus', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      corpus = Corpus(CorpusRepository());
      await corpus.initIfNeeded();
      assert(corpus.isInitialized);
    });

    test('Get word, difficulty 1', () {
      var word = corpus.getWord(1);
      print(word);
      assert(word != null);
    });

    test('Get word, difficulty 2', () {
      var word = corpus.getWord(2);
      print(word);
      assert(word != null);
    });

    test('Get word, difficulty 3', () {
      var word = corpus.getWord(3);
      print(word);
      assert(word != null);
    });

    test('Get word from empty list', () {
      corpus.wordList = List.empty();
      var word = corpus.getWord(1);
      assert(word == null);
    });
  });
}

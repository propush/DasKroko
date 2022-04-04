import 'package:das_kroko/corpus/logic/mobx/corpus.dart';
import 'package:das_kroko/corpus/repository/corpus_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Corpus corpus;
  group('Corpus', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      corpus = Corpus(CorpusRepository());
      await corpus.initIfNeeded();
      assert(corpus.isInitialized);
    });

    test('Get word, difficulty 1', () {
      var word = corpus.getWord(1);
      print(word);
    });
  });
}

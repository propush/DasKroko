import 'package:das_kroko/corpus/entity/num_entity.dart';
import 'package:das_kroko/corpus/repository/corpus_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final CorpusRepository repository;

  group('CorpusRepository', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      repository = CorpusRepository();
    });

    test('Load adjective list', () async {
      final list = await repository.loadWords();
      assert(list.isNotEmpty);
    });

    test('Parse num row', () {
      assert(repository.parseNumRow('3 острые черты') ==
          const NumRow(3, 'острые черты'));
    });

    test('Parse num row bad line no word', () {
      expect(() => repository.parseNumRow('3'), throwsFormatException);
    });

    test('Parse num row bad line no frequency', () {
      expect(
          () => repository.parseNumRow('острые черты'), throwsFormatException);
    });

    test('Parse num row bad line one arg', () {
      expect(() => repository.parseNumRow('острые'), throwsFormatException);
    });

    test('Parse num row bad line empty', () {
      expect(() => repository.parseNumRow(''), throwsFormatException);
    });
  });
}

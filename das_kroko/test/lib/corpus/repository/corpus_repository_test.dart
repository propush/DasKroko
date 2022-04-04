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
      final list = await repository.getAllAdj();
      assert(list.isNotEmpty);
    });

    test('Load noun list', () async {
      final list = await repository.getAllNoun();
      assert(list.isNotEmpty);
    });

    test('Parse num row', () {
      assert(repository.parseNumRow('8 11398.44 тот adjpron') ==
          const NumRow(11398, 'тот'));
    });
  });
}

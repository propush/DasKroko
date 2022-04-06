// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../card/logic/mobx/word.dart' as _i7;
import '../../corpus/logic/mobx/corpus.dart' as _i6;
import '../../corpus/repository/corpus_repository.dart' as _i4;
import '../../difficulty/logic/mobx/choose_level.dart' as _i5;
import '../router/app_router.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.CorpusRepository>(_i4.CorpusRepository());
  gh.singleton<_i5.Level>(_i5.Level());
  gh.singleton<_i6.Corpus>(_i6.Corpus(get<_i4.CorpusRepository>()));
  gh.factory<_i7.Word>(() => _i7.Word(get<_i6.Corpus>()));
  return get;
}

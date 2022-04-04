// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corpus.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Corpus on _Corpus, Store {
  final _$loadingAtom = Atom(name: '_Corpus.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_CorpusActionController = ActionController(name: '_Corpus');

  @override
  void setLoading(bool loading) {
    final _$actionInfo =
        _$_CorpusActionController.startAction(name: '_Corpus.setLoading');
    try {
      return super.setLoading(loading);
    } finally {
      _$_CorpusActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}

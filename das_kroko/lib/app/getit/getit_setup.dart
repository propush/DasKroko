import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:das_kroko/app/getit/getit_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

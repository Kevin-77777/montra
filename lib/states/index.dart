import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:montra/router/router.dart';
import 'package:montra/utils/i18n.dart';

final Injector appState = AppState();

abstract class Injector {
  T register<T extends Object>(T instance);
  T get<T extends Object>();
  FutureOr<dynamic> unregister<T extends Object>();

  void init();

  GoRouter get router;
  I18n get i18n;
}

class AppState extends Injector {
  final GetIt getIt = GetIt.instance;

  @override
  T register<T extends Object>(T instance, {String? name}) {
    print('registering $instance');
    getIt.registerSingleton<T>(instance, instanceName: name);
    return instance;
  }

  @override
  T get<T extends Object>({String? name}) {
    return getIt.get<T>(instanceName: name);
  }

  @override
  FutureOr<dynamic> unregister<T extends Object>() {
    return getIt.unregister<T>();
  }

  @override
  void init() {
    register<I18n>(I18n.init());
    register<GoRouter>(initRouter());
  }

  @override
  GoRouter get router => get<GoRouter>();
  @override
  I18n get i18n => get<I18n>();
}

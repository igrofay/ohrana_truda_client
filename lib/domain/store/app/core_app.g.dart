// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoreApp on _CoreApp, Store {
  late final _$stateAppAtom = Atom(name: '_CoreApp.stateApp', context: context);

  @override
  StateApp get stateApp {
    _$stateAppAtom.reportRead();
    return super.stateApp;
  }

  @override
  set stateApp(StateApp value) {
    _$stateAppAtom.reportWrite(value, super.stateApp, () {
      super.stateApp = value;
    });
  }

  late final _$_restoreAllAsyncAction =
      AsyncAction('_CoreApp._restoreAll', context: context);

  @override
  Future<void> _restoreAll() {
    return _$_restoreAllAsyncAction.run(() => super._restoreAll());
  }

  late final _$checkUpdateAsyncAction =
      AsyncAction('_CoreApp.checkUpdate', context: context);

  @override
  Future<void> checkUpdate(List<CheckThis> checkMe) {
    return _$checkUpdateAsyncAction.run(() => super.checkUpdate(checkMe));
  }

  late final _$_CoreAppActionController =
      ActionController(name: '_CoreApp', context: context);

  @override
  void disconnect() {
    final _$actionInfo =
        _$_CoreAppActionController.startAction(name: '_CoreApp.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_CoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void connection() {
    final _$actionInfo =
        _$_CoreAppActionController.startAction(name: '_CoreApp.connection');
    try {
      return super.connection();
    } finally {
      _$_CoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void acquaintance() {
    final _$actionInfo =
        _$_CoreAppActionController.startAction(name: '_CoreApp.acquaintance');
    try {
      return super.acquaintance();
    } finally {
      _$_CoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void download() {
    final _$actionInfo =
        _$_CoreAppActionController.startAction(name: '_CoreApp.download');
    try {
      return super.download();
    } finally {
      _$_CoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _resetAll() {
    final _$actionInfo =
        _$_CoreAppActionController.startAction(name: '_CoreApp._resetAll');
    try {
      return super._resetAll();
    } finally {
      _$_CoreAppActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateApp: ${stateApp}
    ''';
  }
}

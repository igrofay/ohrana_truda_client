// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthorizeStore on _AuthorizeStore, Store {
  late final _$messageErrorAuthAtom =
      Atom(name: '_AuthorizeStore.messageErrorAuth', context: context);

  @override
  String? get messageErrorAuth {
    _$messageErrorAuthAtom.reportRead();
    return super.messageErrorAuth;
  }

  @override
  set messageErrorAuth(String? value) {
    _$messageErrorAuthAtom.reportWrite(value, super.messageErrorAuth, () {
      super.messageErrorAuth = value;
    });
  }

  late final _$isErrorInnOrEmailAtom =
      Atom(name: '_AuthorizeStore.isErrorInnOrEmail', context: context);

  @override
  bool get isErrorInnOrEmail {
    _$isErrorInnOrEmailAtom.reportRead();
    return super.isErrorInnOrEmail;
  }

  @override
  set isErrorInnOrEmail(bool value) {
    _$isErrorInnOrEmailAtom.reportWrite(value, super.isErrorInnOrEmail, () {
      super.isErrorInnOrEmail = value;
    });
  }

  late final _$isErrorPasswordAtom =
      Atom(name: '_AuthorizeStore.isErrorPassword', context: context);

  @override
  bool get isErrorPassword {
    _$isErrorPasswordAtom.reportRead();
    return super.isErrorPassword;
  }

  @override
  set isErrorPassword(bool value) {
    _$isErrorPasswordAtom.reportWrite(value, super.isErrorPassword, () {
      super.isErrorPassword = value;
    });
  }

  late final _$requestAuthSessionAsyncAction =
      AsyncAction('_AuthorizeStore.requestAuthSession', context: context);

  @override
  Future<void> requestAuthSession() {
    return _$requestAuthSessionAsyncAction
        .run(() => super.requestAuthSession());
  }

  late final _$_AuthorizeStoreActionController =
      ActionController(name: '_AuthorizeStore', context: context);

  @override
  void setInnOrEmail(String val) {
    final _$actionInfo = _$_AuthorizeStoreActionController.startAction(
        name: '_AuthorizeStore.setInnOrEmail');
    try {
      return super.setInnOrEmail(val);
    } finally {
      _$_AuthorizeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String pas) {
    final _$actionInfo = _$_AuthorizeStoreActionController.startAction(
        name: '_AuthorizeStore.setPassword');
    try {
      return super.setPassword(pas);
    } finally {
      _$_AuthorizeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageErrorAuth: ${messageErrorAuth},
isErrorInnOrEmail: ${isErrorInnOrEmail},
isErrorPassword: ${isErrorPassword}
    ''';
  }
}

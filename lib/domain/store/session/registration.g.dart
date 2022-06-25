// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on _RegistrationStore, Store {
  late final _$messageErrorRegAtom =
      Atom(name: '_RegistrationStore.messageErrorReg', context: context);

  @override
  String? get messageErrorReg {
    _$messageErrorRegAtom.reportRead();
    return super.messageErrorReg;
  }

  @override
  set messageErrorReg(String? value) {
    _$messageErrorRegAtom.reportWrite(value, super.messageErrorReg, () {
      super.messageErrorReg = value;
    });
  }

  late final _$isErrorEmailAtom =
      Atom(name: '_RegistrationStore.isErrorEmail', context: context);

  @override
  bool get isErrorEmail {
    _$isErrorEmailAtom.reportRead();
    return super.isErrorEmail;
  }

  @override
  set isErrorEmail(bool value) {
    _$isErrorEmailAtom.reportWrite(value, super.isErrorEmail, () {
      super.isErrorEmail = value;
    });
  }

  late final _$isErrorPasswordAtom =
      Atom(name: '_RegistrationStore.isErrorPassword', context: context);

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

  late final _$isErrorINNAtom =
      Atom(name: '_RegistrationStore.isErrorINN', context: context);

  @override
  bool get isErrorINN {
    _$isErrorINNAtom.reportRead();
    return super.isErrorINN;
  }

  @override
  set isErrorINN(bool value) {
    _$isErrorINNAtom.reportWrite(value, super.isErrorINN, () {
      super.isErrorINN = value;
    });
  }

  late final _$requestRegSessionAsyncAction =
      AsyncAction('_RegistrationStore.requestRegSession', context: context);

  @override
  Future<void> requestRegSession() {
    return _$requestRegSessionAsyncAction.run(() => super.requestRegSession());
  }

  late final _$_RegistrationStoreActionController =
      ActionController(name: '_RegistrationStore', context: context);

  @override
  void setEmail(String em) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setEmail');
    try {
      return super.setEmail(em);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String pas) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setPassword');
    try {
      return super.setPassword(pas);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setINN(String INN) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setINN');
    try {
      return super.setINN(INN);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messageErrorReg: ${messageErrorReg},
isErrorEmail: ${isErrorEmail},
isErrorPassword: ${isErrorPassword},
isErrorINN: ${isErrorINN}
    ''';
  }
}

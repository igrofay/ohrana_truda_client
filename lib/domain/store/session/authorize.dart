
import 'package:mobx/mobx.dart';

import '../../repository/authentication.dart';
import '../../repository/token.dart';
import '../../utils/errors.dart';
import '../../utils/regular_expressions.dart';
import '../app/core_app.dart';

part 'authorize.g.dart';

class AuthorizeStore = _AuthorizeStore with _$AuthorizeStore;

abstract class _AuthorizeStore with Store{
  final AuthenticationRepository _authenticationRepository;
  final TokenRepository _tokenRepository;
  final CoreApp _coreApp;

  _AuthorizeStore(
      this._authenticationRepository, this._tokenRepository, this._coreApp);

  String innOrEmail = '';

  String password = '';

  @observable
  String? messageErrorAuth;

  @observable
  bool isErrorInnOrEmail = false;

  @observable
  bool isErrorPassword = false;

  @action
  void setInnOrEmail(String val) {
    isErrorInnOrEmail = false;
    innOrEmail = val;
  }

  @action
  void setPassword(String pas) {
    isErrorPassword = false;
    password = pas;
  }

  @action
  Future<void> requestAuthSession() async {
    final email = isEmailInput(innOrEmail) ? innOrEmail : null;
    final inn = isINN_Input(innOrEmail) ? innOrEmail : null;
    isErrorInnOrEmail = email == inn;
    isErrorPassword = !isPasswordInput(password);
    if (isErrorInnOrEmail || isErrorPassword) return;
    try {
      final token = await _authenticationRepository.signIn(email, inn, password);
      _tokenRepository.saveToken(token);
      _coreApp.connection();
    } on Error400 catch (_) {
      messageErrorAuth = "Аккаунт не найден";
    } catch (_) {}
  }
}
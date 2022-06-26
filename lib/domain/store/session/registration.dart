
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../repository/authentication.dart';
import '../../repository/token.dart';
import '../../utils/errors.dart';
import '../../utils/regular_expressions.dart';
import '../app/core_app.dart';

part 'registration.g.dart';

@injectable
class RegistrationStore = _RegistrationStore with _$RegistrationStore;

abstract class _RegistrationStore with Store{
  final AuthenticationRepository _authenticationRepository;
  final TokenRepository _tokenRepository;
  final CoreApp _coreApp;

  _RegistrationStore(this._authenticationRepository, this._tokenRepository,this._coreApp);

  String email = '';

  String password = '';

  String inn = '';

  @observable
  String? messageErrorReg;

  @observable
  bool isErrorEmail = false;

  @observable
  bool isErrorPassword = false;

  @observable
  bool isErrorINN = false;

  @action
  void setEmail(String em) {
    isErrorEmail = false;
    email = em;
  }

  @action
  void setPassword(String pas) {
    isErrorPassword = false;
    password = pas;
  }

  @action
  void setINN(String INN) {
    isErrorINN = false;
    inn = INN;
  }

  @action
  Future<void> requestRegSession() async {
    isErrorEmail = !isEmailInput(email);
    isErrorPassword = !isPasswordInput(password);
    isErrorINN = !isINN_Input(inn);
    if (isErrorEmail || isErrorPassword||isErrorINN) return;
    try {
      final token = await _authenticationRepository.signUp(email, inn, password);
      _tokenRepository.saveToken(token);
      _coreApp.connection();
    }on Error409 catch (_) {
      isErrorINN = true;
      messageErrorReg = "Данный ИНН уже зарегистрирован";
    } catch (_) {}
  }
}
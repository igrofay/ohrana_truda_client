
import 'package:injectable/injectable.dart';

import '../../repository/authentication.dart';
import '../../repository/token.dart';
import '../app/core_app.dart';

@singleton
class Restore{
  final TokenRepository _tokenRepository;
  final CoreApp _coreApp;

  Restore(this._tokenRepository,this._coreApp){
    requestSessionRaising();
  }
  Future<void>  requestSessionRaising() async {
    if (_tokenRepository.getToken() == null) {
      _coreApp.acquaintance();
    }else if (_tokenRepository.getToken() == '') {
      _coreApp.disconnect();
    }else if(_tokenRepository.getToken() != ''){
      _coreApp.connection();
    }
  }
}
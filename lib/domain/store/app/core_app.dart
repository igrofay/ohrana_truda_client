
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'utils_core.dart';
part 'core_app.g.dart';

@singleton
class CoreApp = _CoreApp with _$CoreApp;

enum StateApp { authorized, rejected, launch }

abstract class _CoreApp with Store {
  _CoreApp() {
    observerStateApp = reaction((_) => stateApp, reactionSateApp);
  }

  @observable
  StateApp stateApp = StateApp.launch;

  List<ResetThis> listResetData = [];
  List<RestoreThis> listRestoreData = [];

  late ReactionDisposer observerStateApp;

  void reactionSateApp(StateApp state) {
    switch (state) {
      case StateApp.rejected:
        _resetAll();
        break;
      case StateApp.authorized:
        _restoreAll();
        break;
    }
  }

  @action
  void disconnect() => stateApp = StateApp.rejected;

  @action
  void connection() => stateApp = StateApp.authorized;

  @action
  void download() => stateApp = StateApp.launch;

  @action
  void _resetAll() {
    for (ResetThis i in listResetData) {
      i.resetThis();
    }
  }

  @action
  Future<void> _restoreAll() async {
    for (RestoreThis i in listRestoreData) {
      i.restoreThis();
    }
  }
  @action
  Future<void> checkUpdate(List<CheckThis> checkMe) async {
    for(CheckThis i in checkMe){
      await i.checkThis();
    }
  }
}

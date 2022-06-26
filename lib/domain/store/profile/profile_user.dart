
import 'package:mobx/mobx.dart';

import '../../repository/profile.dart';

abstract class ProfileUserStore with Store{
  final ProfileRepository _profileRepository;

  ProfileUserStore(this._profileRepository);
}
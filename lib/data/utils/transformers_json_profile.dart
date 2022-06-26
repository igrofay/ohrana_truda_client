
import 'package:ohrana_truda/domain/model/profile_user.dart';

import '../../domain/model/passport_organization.dart';

ProfileUser fromJsonToProfileUser(Map<String, dynamic> val){
  final type = val['type']=="Administrator" ? TypeUser.administrator : TypeUser.organizationRepresentative;
  return ProfileUser(val['email'], val['inn'], type);
}

class PO{
  PassportOrganization fromJsonToPassportOrganization(Map<String, dynamic> val){
    return PassportOrganization(
        val['inn'],
        fromJsonToMap(val['tab']),
        _getStatePassport(val['statePassport']),
        val['lastModerateDate'],
        _getStateGoldBadge(val['goldBadge'])
    );
  }

  StatePassport _getStatePassport(String key){
    switch(key){
      case "Success": return StatePassport.success;
      case "Moderate":  return StatePassport.moderate;
      case "Rejected": return StatePassport.rejected;
      case "NotSubmitted" : return StatePassport.notSubmitted;
      default: return StatePassport.notSubmitted;
    }
  }
  StateGoldBadge _getStateGoldBadge(String key){
    switch(key){
      case "Success": return StateGoldBadge.success;
      case "Moderate":  return StateGoldBadge.moderate;
      case "Rejected": return StateGoldBadge.rejected;
      case "NotSubmitted" : return StateGoldBadge.notSubmitted;
      default: return StateGoldBadge.notSubmitted;
    }
  }

  Map<String, List<InputBody>> fromJsonToMap(Map<String, dynamic> val){
    Map<String, List<InputBody>> answer = {};
    for(String key in val.keys){
      answer[key] = _fromJsonToListInputBody(val[key]);
    }
    return answer;
  }

  List<InputBody> _fromJsonToListInputBody(List<dynamic> val){
    List<InputBody> answer = [];
    for(Map<String, dynamic> i in val){
      answer.add(
          _fromToInputBody(i)
      );
    }
    return answer;
  }
  InputBody _fromToInputBody(Map<String, dynamic> val){
    final type = val['typeInput'] == "Files" ? TypeInput.files : TypeInput.editText;
    return InputBody(val['nameInput'], val['valueInput'], type);
  }
}

import '../../domain/model/passport_organization.dart';
import '../utils/from_one_to_another.dart';

class PassportOrganizationBody with ToJsonData{
  PassportOrganization passportOrganization;

  PassportOrganizationBody(this.passportOrganization);

  @override
  Map<String, dynamic> toJsonData() {
    return{
      "inn":passportOrganization.inn,
      "tab": _tap(),
      "statePassport": _statePassport(),
      "lastModerateDate": passportOrganization.lastModerateDate,
      "goldBadge": _goldBadge()
    };
  }

  String _goldBadge(){
    switch(passportOrganization.goldBadge){
      case StateGoldBadge.success:
        return "Success";
      case StateGoldBadge.moderate:
        return "Moderate";
      case StateGoldBadge.rejected:
        return "Rejected";
      case StateGoldBadge.notSubmitted:
        return "NotSubmitted";
    }
  }
  String _statePassport(){
    switch(passportOrganization.statePassport){
      case StatePassport.success:
       return "Success";
      case StatePassport.moderate:
        return "Moderate";
      case StatePassport.rejected:
        return "Rejected";
      case StatePassport.notSubmitted:
        return "NotSubmitted";
    }
  }

  Map<String,List> _tap(){
    Map<String,List> answer ={};
    for(String key in passportOrganization.tab.keys){
      List list = _list(key);
      answer[key] = list;
    }
    return answer;
  }

  List _list(String key){
    List answer = [];
    for(InputBody i in passportOrganization.tab[key]!){
      answer.add(_inputBody(i));
    }
    return answer;
  }
  Map _inputBody(InputBody values){
    final type = values.typeInput == TypeInput.editText ? "EditText" : "Files";
    return{
      "nameInput": values.nameInput,
      "valueInput": values.valueInput,
      "typeInput": type
    };
  }

}
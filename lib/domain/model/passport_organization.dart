
class PassportOrganization{
  String inn;
  Map<String,List<InputBody>> tab;
  StatePassport statePassport;
  String lastModerateDate;
  StateGoldBadge goldBadge;

  PassportOrganization(this.inn, this.tab, this.statePassport,
      this.lastModerateDate, this.goldBadge);
}


enum StatePassport{
  success,
  moderate,
  rejected,
  notSubmitted
}
enum StateGoldBadge{
  success,
  moderate,
  rejected,
  notSubmitted
}

class InputBody{
  String nameInput;
  String valueInput;
  TypeInput typeInput;

  InputBody(this.nameInput, this.valueInput, this.typeInput);
}
enum TypeInput{ editText, files }
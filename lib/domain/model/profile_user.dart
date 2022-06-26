
class ProfileUser{
  final String email;
  final String inn;
  final TypeUser type;

  ProfileUser(this.email, this.inn, this.type);
}

enum TypeUser{
  administrator,
  organizationRepresentative
}
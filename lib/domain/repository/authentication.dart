
mixin AuthenticationRepository{
  Future<String> signUp(String email, String inn, String password);
  Future<String> signIn(String? email, String? inn, String password);
}

mixin TokenRepository{
  String? getToken();
  void saveToken(String token);
  void reset();
}
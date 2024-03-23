// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyUser {
  String username;
  String email;
  String password;
  String occupation;
  String profileUrl;
  int points;
  List<MyUser>? friends;

  MyUser({
    required this.username,
    required this.email,
    required this.password,
    required this.occupation,
    required this.profileUrl,
    required this.points,
    this.friends,
  });
}

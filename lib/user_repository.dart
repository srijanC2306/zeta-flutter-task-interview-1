class UserRepository {
  final List<String> users = [];

  void addUser(String name) {
    if (name.isNotEmpty && name != '') {
      users.add(name);
    }
  }

  List<String> getUser() => List.unmodifiable(users);
}

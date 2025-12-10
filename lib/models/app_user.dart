enum UserRole {
  client,
  owner,
  delivery,
}

class AppUser {
  final String email;
  final String name;
  final UserRole role;

  AppUser({
    required this.email,
    required this.name,
    required this.role,
  });
}

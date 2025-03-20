class User {
  final String id;
  final String? name;
  final String? email;
  final String? imageUrl;
  final DateTime? creationDateTime;
  final DateTime? lastSignInDateTime;

  //df

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.creationDateTime,
    required this.lastSignInDateTime,
  });
}

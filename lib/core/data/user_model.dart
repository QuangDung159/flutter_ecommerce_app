class UserModel {
  final String email, displayName, photoUrl, id;
  final String? clientId;

  UserModel({
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.id,
    this.clientId,
  });
}

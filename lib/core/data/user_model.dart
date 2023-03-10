class UserModel {
  final String email, displayName, photoUrl, id;
  final String? clientId, loginType;

  UserModel({
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.id,
    this.clientId,
    this.loginType,
  });

  factory UserModel.from(Map<String, dynamic> json) {
    {
      return UserModel(
        email: json['email'],
        displayName: json['display_name'],
        photoUrl: json['photo_url'],
        id: json['_id'],
        clientId: json['client_id'],
        loginType: json['login_type'],
      );
    }
  }
}

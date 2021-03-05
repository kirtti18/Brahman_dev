import 'dart:convert';

class AppUser {
  String name;
  String userId;
  String email;
  String imageUrl;
  AppUser({
    this.name,
    this.userId,
    this.email,
    this.imageUrl,
  });

  AppUser copyWith({
    String name,
    String userId,
    String email,
    String imageUrl,
  }) {
    return AppUser(
      name: name ?? this.name,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userId': userId,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppUser(
      name: map['name'],
      userId: map['userId'],
      email: map['email'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(name: $name, userId: $userId, email: $email, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppUser &&
        o.name == name &&
        o.userId == userId &&
        o.email == email &&
        o.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^ userId.hashCode ^ email.hashCode ^ imageUrl.hashCode;
  }
}

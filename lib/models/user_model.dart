// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String userId;
  final String email;
  final String name;
  final String bio;
  final String profilePic;
  final String bannerPic;
  final List<String> followers;
  final List<String> following;
  // final bool isVerified;
  const UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.bio,
    required this.profilePic,
    required this.bannerPic,
    required this.followers,
    required this.following,
    // required this.isVerified,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? bio,
    String? profilePic,
    String? bannerPic,
    List<String>? followers,
    List<String>? following,
    bool? isVerified,
  }) {
    return UserModel(
      userId: uid ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      profilePic: profilePic ?? this.profilePic,
      bannerPic: bannerPic ?? this.bannerPic,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      // isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'name': name,
      'bio': bio,
      'profilePic': profilePic,
      'bannerPic': bannerPic,
      'followers': followers,
      'following': following,
      // 'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      bio: map['bio'] as String,
      profilePic: map['profilePic'] as String,
      bannerPic: map['bannerPic'] as String,
      followers: List<String>.from((map['followers'] as List<String>)),
      following: List<String>.from(
        (map['following'] as List<String>),
      ),
      // isVerified: map['isVerified'] as bool,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $userId, email: $email, name: $name, bio: $bio, profilePic: $profilePic, bannerPic: $bannerPic, followers: $followers, following: $following,)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.bio == bio &&
        other.profilePic == profilePic &&
        other.bannerPic == bannerPic &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following);
    // other.isVerified == isVerified;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        name.hashCode ^
        bio.hashCode ^
        profilePic.hashCode ^
        bannerPic.hashCode ^
        followers.hashCode ^
        following.hashCode;
    // isVerified.hashCode;
  }
}

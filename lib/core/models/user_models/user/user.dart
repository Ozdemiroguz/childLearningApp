import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_type.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String surname,
    required String age,
    required String email,
    required UserType userType,
    required String imageUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

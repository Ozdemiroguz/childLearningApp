// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      age: json['age'] as String,
      email: json['email'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
      'email': instance.email,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'imageUrl': instance.imageUrl,
    };

const _$UserTypeEnumMap = {
  UserType.student: 'student',
  UserType.teacher: 'teacher',
  UserType.parent: 'parent',
};

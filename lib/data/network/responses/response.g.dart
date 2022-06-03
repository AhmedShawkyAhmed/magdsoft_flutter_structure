// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

AccountDataResponse _$AccountDataResponseFromJson(Map<String, dynamic> json) =>
    AccountDataResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['phone'] as String?,
      json['updated_at'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$AccountDataResponseToJson(
        AccountDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse(
      (json['account'] as List<dynamic>?)
          ?.map((e) => AccountDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'account': instance.account,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

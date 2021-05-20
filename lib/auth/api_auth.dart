import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:shashliki/home/home_page.dart';
import 'package:shashliki/non_component/singleton_ds.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginDto {
  LoginDto({required this.login, required this.password});

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
        login: json['login'] as String, password: json['password'] as String);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'login': this.login, 'password': this.password};

  final String login;
  final String password;
}

@JsonSerializable()
class LoginResultDto {
  LoginResultDto({required this.id, required this.token});

  factory LoginResultDto.fromJson(Map<String, dynamic> json) {
    return LoginResultDto(
        id: json['id'] as int, token: json['token'] as String);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': this.id, 'token': this.token};

  final int id;
  final String token;
}

@JsonSerializable()
class RegisterDto {
  RegisterDto(
      {required this.username, required this.login, required this.password});

  factory RegisterDto.fromJson(Map<String, dynamic> json) {
    return RegisterDto(
        username: json['username'] as String,
        login: json['login'] as String,
        password: json['password'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'username': this.username,
        'login': this.login,
        'password': this.password
      };

  final String username;
  final String login;
  final String password;
}

@JsonSerializable()
class RegisterResultDto {
  RegisterResultDto({required this.id});

  factory RegisterResultDto.fromJson(Map<String, dynamic> json) {
    return RegisterResultDto(id: json['id'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'id': this.id};

  final int id;
}

@JsonSerializable()
class InviteDto {
  InviteDto(
      {required this.id,
      required this.issuerId,
      required this.issuerUsername,
      required this.recipientId,
      required this.recipientUsername,
      required this.groupId,
      required this.groupTitle,
      required this.issuedAt,
      required this.resolvedAt});

  factory InviteDto.fromJson(Map<String, dynamic> json) {
    return InviteDto(
        id: json['id'] as int,
        issuerId: json['issuerId'] as int,
        issuerUsername: json['issuerUsername'] as String,
        recipientId: json['recipientId'] as int,
        recipientUsername: json['recipientUsername'] as String,
        groupId: json['groupId'] as int,
        groupTitle: json['groupTitle'] as String,
        issuedAt: json['issuedAt'] as String,
        resolvedAt: json['resolvedAt'] as String?);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'issuerId': this.issuerId,
        'issuerUsername': this.issuerUsername,
        'recipientId': this.recipientId,
        'recipientUsername': this.recipientUsername,
        'groupId': this.groupId,
        'groupTitle': this.groupTitle,
        'issuedAt': this.issuedAt,
        'resolvedAt': this.resolvedAt
      };

  final int id;
  final int issuerId;
  final String issuerUsername;
  final int recipientId;
  final String recipientUsername;
  final int groupId;
  final String groupTitle;
  final String issuedAt;
  final String? resolvedAt;
}

@JsonSerializable()
class InvitesDto {
  InvitesDto({required this.invites});

  factory InvitesDto.fromJson(List<dynamic> json) {
    return InvitesDto(
        invites: json
            .map((e) => InviteDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'invites': this.invites};

  final List<InviteDto> invites;
}

String baseUrl = "https://akiana.io:8443/api";

Future<void> login(LoginDto LoginDto, BuildContext context) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  print('object');
  print(baseUrl + '/user/login');
  print(json.encode(LoginDto));

  final response = await ioClient.post(Uri.parse(baseUrl + '/user/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode(LoginDto));

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    SingletonDS inst = SingletonDS();
    inst.token = LoginResultDto.fromJson(json.decode(response.body)).token;
    inst.userId = LoginResultDto.fromJson(json.decode(response.body)).id;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

Future<void> register(RegisterDto registerDto, BuildContext context) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  print('object');
  print(baseUrl + '/api/user/create');
  print(json.encode(registerDto));

  final response = await ioClient.post(Uri.parse(baseUrl + '/user/create'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: json.encode(registerDto));

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Succ"),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.statusCode.toString()),
    ));
  }
}

Future<void> acceptAllInvites() async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/invite/getreceived?id=' + ds.userId.toString());

  final response = await ioClient.get(
    Uri.parse(baseUrl + '/invite/getreceived?id=' + ds.userId.toString()),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'auth-token': ds.token
    },
  );

  print(response.statusCode);
  print(response.body);

  InvitesDto.fromJson(json.decode(response.body)).invites.forEach((element) {
    acceptInvite(element.id);
  });
}

Future<void> acceptInvite(int id) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  print('object');
  print(baseUrl + '/invite/accept');

  SingletonDS ds = SingletonDS();

  final response = await ioClient.get(
    Uri.parse(baseUrl + '/invite/accept?id=' + id.toString()),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'auth-token': ds.token
    },
  );

  print(response.statusCode);
  print(response.body);
}

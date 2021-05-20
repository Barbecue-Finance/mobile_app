import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:shashliki/home/home_page.dart';
import 'package:shashliki/non_component/singleton_ds.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetUserByIdRequest {
  GetUserByIdRequest({required this.id});

  factory GetUserByIdRequest.fromJson(Map<String, dynamic> json) {
    return GetUserByIdRequest(id: json['id'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'id': this.id};

  final int id;
}

@JsonSerializable()
class GetUserByIdResponse {
  GetUserByIdResponse(
      {required this.id, required this.username, required this.login});

  factory GetUserByIdResponse.fromJson(Map<String, dynamic> json) {
    return GetUserByIdResponse(
        id: json['id'] as int,
        username: json['username'] as String,
        login: json['login'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'username': this.username,
        'login': this.login
      };

  final int id;
  final String username;
  final String login;
}

String baseUrl = "https://akiana.io:8443/api";

Future<String> getUserName() async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS inst = SingletonDS();

  print('object');
  print(baseUrl + '/user/getbyid?id=' + inst.userId.toString());

  final response = await ioClient.get(
    Uri.parse(baseUrl + '/user/getbyid?id=' + inst.userId.toString()),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'auth-token': inst.token
    },
  );

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    return GetUserByIdResponse.fromJson(json.decode(response.body)).username;
  }

  return "Error";
}

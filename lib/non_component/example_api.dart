import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:shashliki/home/home_page.dart';
import 'package:shashliki/non_component/singleton_ds.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Request {
  Request({required this.id});
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(id: json['id'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'id': this.id};

  final int id;
}

@JsonSerializable()
class Response {
  Response({required this.text});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(text: json['text'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'text': this.text};

  final String text;
}

String baseUrl = "https://akiana.io:8443/api";

Future<void> login(BuildContext context) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/user/login');

  Request request = Request(id: ds.userId);

  final response = await ioClient.post(Uri.parse(baseUrl + '/user/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'auth-token': ds.token
      },
      body: json.encode(request));

  print(response.statusCode);
  print(response.body);

  String val = Response.fromJson(json.decode(response.body)).text;
}

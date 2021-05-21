import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:shashliki/home/books/group_item.dart';
import 'package:shashliki/home/home_page.dart';
import 'package:shashliki/non_component/singleton_ds.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shashliki/shared_book/operation_model.dart';

@JsonSerializable()
class GroupCreateRequest {
  GroupCreateRequest({required this.title, required this.creatorId});

  factory GroupCreateRequest.fromJson(Map<String, dynamic> json) {
    return GroupCreateRequest(
        title: json['title'] as String, creatorId: json['creatorId'] as int);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'title': this.title, 'creatorId': this.creatorId};

  final String title;
  final int creatorId;
}

@JsonSerializable()
class GroupCreateResponse {
  GroupCreateResponse({required this.id});

  factory GroupCreateResponse.fromJson(Map<String, dynamic> json) {
    return GroupCreateResponse(id: json['id'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'id': this.id};

  final int id;
}

@JsonSerializable()
class GroupUserDto {
  GroupUserDto({required this.id, required this.username, required this.login});

  factory GroupUserDto.fromJson(Map<String, dynamic> json) {
    return GroupUserDto(
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

@JsonSerializable()
class GroupDto {
  GroupDto({required this.id, required this.title, required this.users});

  factory GroupDto.fromJson(Map<String, dynamic> json) {
    return GroupDto(
        id: json['id'] as int,
        title: json['title'] as String,
        users: (json['users'] as List<dynamic>)
            .map((e) => GroupUserDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'title': this.title,
        'users': this.users
      };

  final int id;
  final String title;
  final List<GroupUserDto> users;
}

@JsonSerializable()
class GroupsDto {
  GroupsDto({required this.groups});

  factory GroupsDto.fromJson(List<dynamic> json) {
    return GroupsDto(
        groups: json
            .map((e) => GroupDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'groups': this.groups};

  final List<GroupDto> groups;
}

@JsonSerializable()
class InviteCreateRequest {
  InviteCreateRequest(
      {required this.issuerId,
      required this.recipientId,
      required this.groupId});

  factory InviteCreateRequest.fromJson(Map<String, dynamic> json) {
    return InviteCreateRequest(
        issuerId: json['issuerId'] as int,
        recipientId: json['recipientId'] as int,
        groupId: json['groupId'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'issuerId': this.issuerId,
        'recipientId': this.recipientId,
        'groupId': this.groupId
      };

  final int issuerId;
  final int recipientId;
  final int groupId;
}

@JsonSerializable()
class PurseDto {
  PurseDto({required this.id, required this.amount});

  factory PurseDto.fromJson(Map<String, dynamic> json) {
    return PurseDto(
        id: json['id'] as int, amount: (json['amount'] as num).toDouble());
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': this.id, 'amount': this.amount};

  final int id;
  final double amount;
}

@JsonSerializable()
class OutOperationDto {
  OutOperationDto(
      {required this.id,
      required this.amount,
      required this.comment,
      required this.dateTime,
      required this.purseId,
      required this.outComeOperationCategoryId,
      required this.outComeOperationCategoryTitle,
      required this.userId,
      required this.userUsername});

  factory OutOperationDto.fromJson(Map<String, dynamic> json) {
    return OutOperationDto(
        id: json['id'] as int,
        amount: (json['amount'] as num).toDouble(),
        comment: json['comment'] as String,
        dateTime: json['dateTime'] as String,
        purseId: json['purseId'] as int,
        outComeOperationCategoryId: json['outComeOperationCategoryId'] as int,
        outComeOperationCategoryTitle:
            json['outComeOperationCategoryTitle'] as String?,
        userId: json['userId'] as int,
        userUsername: json['userUsername'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'amount': this.amount,
        'comment': this.comment,
        'dateTime': this.dateTime,
        'purseId': this.purseId,
        'outComeOperationCategoryId': this.outComeOperationCategoryId,
        'outComeOperationCategoryTitle': this.outComeOperationCategoryTitle,
        'userId': this.userId,
        'userUsername': this.userUsername
      };

  final int id;
  final double amount;
  final String comment;
  final String dateTime;
  final int purseId;
  final int outComeOperationCategoryId;
  final String? outComeOperationCategoryTitle;
  final int userId;
  final String userUsername;
}

@JsonSerializable()
class InOperationDto {
  InOperationDto(
      {required this.id,
      required this.amount,
      required this.comment,
      required this.dateTime,
      required this.purseId,
      required this.incomeOperationCategoryId,
      required this.incomeOperationCategoryTitle,
      required this.userId,
      required this.userUsername});

  factory InOperationDto.fromJson(Map<String, dynamic> json) {
    return InOperationDto(
        id: json['id'] as int,
        amount: (json['amount'] as num).toDouble(),
        comment: json['comment'] as String,
        dateTime: json['dateTime'] as String,
        purseId: json['purseId'] as int,
        incomeOperationCategoryId: json['incomeOperationCategoryId'] as int,
        incomeOperationCategoryTitle:
            json['incomeOperationCategoryTitle'] as String?,
        userId: json['userId'] as int,
        userUsername: json['userUsername'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'amount': this.amount,
        'comment': this.comment,
        'dateTime': this.dateTime,
        'purseId': this.purseId,
        'incomeOperationCategoryId': this.incomeOperationCategoryId,
        'incomeOperationCategoryTitle': this.incomeOperationCategoryTitle,
        'userId': this.userId,
        'userUsername': this.userUsername
      };

  final int id;
  final double amount;
  final String comment;
  final String dateTime;
  final int purseId;
  final int incomeOperationCategoryId;
  final String? incomeOperationCategoryTitle;
  final int userId;
  final String userUsername;
}

@JsonSerializable()
class PurseOperationsDto {
  PurseOperationsDto({required this.outComing, required this.incoming});

  factory PurseOperationsDto.fromJson(Map<String, dynamic> json) {
    return PurseOperationsDto(
        outComing: (json['outComing'] as List<dynamic>)
            .map((e) => OutOperationDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        incoming: (json['incoming'] as List<dynamic>)
            .map((e) => InOperationDto.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'outComing': this.outComing, 'incoming': this.incoming};

  final List<OutOperationDto> outComing;
  final List<InOperationDto> incoming;
}

@JsonSerializable()
class CreateOperationRequest {
  CreateOperationRequest(
      {required this.amount,
      required this.comment,
      required this.purseId,
      required this.operationCategoryTitle,
      required this.userId});

  factory CreateOperationRequest.fromJson(Map<String, dynamic> json) {
    return CreateOperationRequest(
        amount: (json['amount'] as num).toDouble(),
        comment: json['comment'] as String,
        purseId: json['purseId'] as int,
        operationCategoryTitle: json['operationCategoryTitle'] as String,
        userId: json['userId'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': this.amount,
        'comment': this.comment,
        'purseId': this.purseId,
        'operationCategoryTitle': this.operationCategoryTitle,
        'userId': this.userId
      };

  final double amount;
  final String comment;
  final int purseId;
  final String operationCategoryTitle;
  final int userId;
}

@JsonSerializable()
class CreateTransferRequest {
  CreateTransferRequest(
      {required this.amount,
      required this.comment,
      required this.fromPurseId,
      required this.toPurseId,
      required this.userId});

  factory CreateTransferRequest.fromJson(Map<String, dynamic> json) {
    return CreateTransferRequest(
        amount: (json['amount'] as num).toDouble(),
        comment: json['comment'] as String,
        fromPurseId: json['fromPurseId'] as int,
        toPurseId: json['toPurseId'] as int,
        userId: json['userId'] as int);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': this.amount,
        'comment': this.comment,
        'fromPurseId': this.fromPurseId,
        'toPurseId': this.toPurseId,
        'userId': this.userId
      };

  final double amount;
  final String comment;
  final int fromPurseId;
  final int toPurseId;
  final int userId;
}

String baseUrl = "https://akiana.io:8443/api";

Future<void> createGroup(String title) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  GroupCreateRequest request =
      GroupCreateRequest(creatorId: ds.userId, title: title);

  print(json.encode(request));
  print(baseUrl + '/group/create');

  final response = await ioClient.post(Uri.parse(baseUrl + '/group/create'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'auth-token': ds.token
      },
      body: json.encode(request));

  print(response.statusCode);
  print(response.body);
}

Future<List<GroupItem>> getGroups() async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/group/getbyuser?id=' + ds.userId.toString());

  final response = await ioClient.get(
    Uri.parse(baseUrl + '/group/getbyuser?id=' + ds.userId.toString()),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'auth-token': ds.token
    },
  );

  print(response.statusCode);
  print(response.body);

  List<GroupItem> res = [];

  res.addAll(GroupsDto.fromJson(json.decode(response.body))
      .groups
      .map((e) => GroupItem(e.title, e.id, e.users)));

  return res;
}

Future<void> sendInvite(
    int recipientId, int groupId, BuildContext context) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/invite/create');

  InviteCreateRequest request = InviteCreateRequest(
      groupId: groupId, issuerId: ds.userId, recipientId: recipientId);

  final response = await ioClient.post(Uri.parse(baseUrl + '/invite/create'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'auth-token': ds.token
      },
      body: json.encode(request));

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("invite sent"),
    ));
  }
}

Future<int> getPurseIdByGroupId(int id) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/purse/getbygroup?id=' + id.toString());

  final response = await ioClient.get(
    Uri.parse(baseUrl + '/purse/getbygroup?id=' + id.toString()),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'auth-token': ds.token
    },
  );

  print(response.statusCode);
  print(response.body);

  return PurseDto.fromJson(json.decode(response.body)).id;
}

Future<List<OperationModel>> getOperations(int purseId) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/moneyoperation/getbypurse?id=' + purseId.toString());

  final response = await ioClient.get(
    Uri.parse(baseUrl + '/moneyoperation/getbypurse?id=' + purseId.toString()),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      'auth-token': ds.token
    },
  );

  print(response.statusCode);
  print(response.body);

  List<OperationModel> res = [];
  List<OperationModel> out = [];
  List<OperationModel> inc = [];

  out.addAll(PurseOperationsDto.fromJson(json.decode(response.body))
      .outComing
      .map((e) => OperationModel(e.amount, "outcoming", e.comment, e.dateTime,
          e.purseId, e.userId, e.userUsername)));
  inc.addAll(PurseOperationsDto.fromJson(json.decode(response.body))
      .incoming
      .map((e) => OperationModel(e.amount, "incoming", e.comment, e.dateTime,
          e.purseId, e.userId, e.userUsername)));

  while (out.length != 0 && inc.length != 0) {
    if (getMinutes(out[0].dateTime.substring(11, 13),
            out[0].dateTime.substring(14, 16)) <=
        getMinutes(inc[0].dateTime.substring(11, 13),
            inc[0].dateTime.substring(14, 16))) {
      res.add(out[0]);
      out.removeAt(0);
    } else {
      res.add(inc[0]);
      inc.removeAt(0);
    }
  }
  res.addAll(out);
  res.addAll(inc);

  return res;
}

int getMinutes(String hours, String minutes) {
  return int.parse(hours) * 60 + int.parse(minutes);
}

Future<void> createIncome(double amount, String comment, int purseId) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/moneyoperation/createincome');

  CreateOperationRequest request = CreateOperationRequest(
      amount: amount,
      comment: comment,
      purseId: purseId,
      operationCategoryTitle: "general",
      userId: ds.userId);

  final response = await ioClient.post(
      Uri.parse(baseUrl + '/moneyoperation/createincome'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'auth-token': ds.token
      },
      body: json.encode(request));

  print(response.statusCode);
  print(response.body);
}

Future<void> createOutcome(double amount, String comment, int purseId) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/moneyoperation/createoutcome');

  CreateOperationRequest request = CreateOperationRequest(
      amount: amount,
      comment: comment,
      purseId: purseId,
      operationCategoryTitle: "general",
      userId: ds.userId);

  final response = await ioClient.post(
      Uri.parse(baseUrl + '/moneyoperation/createoutcome'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'auth-token': ds.token
      },
      body: json.encode(request));

  print(response.statusCode);
  print(json.encode(request));
  print(response.body);
}

Future<void> createTransfer(
    double amount, String comment, int fromId, int toId) async {
  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);

  SingletonDS ds = SingletonDS();

  print('object');
  print(baseUrl + '/moneyoperation/createtransfer');

  CreateTransferRequest request = CreateTransferRequest(
      amount: amount, comment: comment, fromPurseId: fromId, toPurseId: toId,userId: ds.userId);

  final response = await ioClient.post(
      Uri.parse(baseUrl + '/moneyoperation/createtransfer'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        'auth-token': ds.token
      },
      body: json.encode(request));

  print(response.statusCode);
  print(response.body);
}

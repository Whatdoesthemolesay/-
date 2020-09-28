import 'package:flutter/cupertino.dart';

class Registration{
  final int code;
  final String message;
  String data;

  Registration({@required this.code, @required this.message, this.data});

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
        code: json['code'],
        message: json['message']
    );
  }
}
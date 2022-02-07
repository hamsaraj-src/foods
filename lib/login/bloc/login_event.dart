import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LogInEvent extends Equatable {}

class LoginNextbutton extends LogInEvent {
  String value;
  bool isEmail;
  LoginNextbutton({@required this.value, this.isEmail});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

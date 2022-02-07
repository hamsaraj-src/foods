import 'package:equatable/equatable.dart';

abstract class LogInState extends Equatable {}

class LogInInitialState extends LogInState {
  // LogInInitialState(bool bool);
  final bool isEmail;

  LogInInitialState(this.isEmail);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LogInSuccessState extends LogInState {
  String value;
  bool isEmail;
  LogInSuccessState(
    this.isEmail,
    this.value,
  );
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LogInFailureState extends LogInState {
  String message;
  LogInFailureState(this.message);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

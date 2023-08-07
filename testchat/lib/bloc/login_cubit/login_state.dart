// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loginloading extends LoginState {}

class LoginIsuccess extends LoginState {}

class Loginfailure extends LoginState {
  String errorMessage;
  Loginfailure(
    { 
      required this.errorMessage,
    }
    );
}

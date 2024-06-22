import 'package:equatable/equatable.dart';

abstract class GoogleAuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends GoogleAuthEvent {}

class GoogleSignInRequested extends GoogleAuthEvent {}

class LogoutRequested extends GoogleAuthEvent {}
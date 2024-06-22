import 'package:equatable/equatable.dart';

abstract class GoogleAuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthenticated extends GoogleAuthState {
  final String name;
  final String email;

  GoogleAuthenticated(this.name, this.email);

  @override
  List<Object> get props => [name, email];
}

class GoogleAuthError extends GoogleAuthState {
  final String message;

  GoogleAuthError(this.message);

  @override
  List<Object> get props => [message];
}



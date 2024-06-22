// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_event.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_state.dart';
import 'package:test_code_flutter_fire/repositories/auth_repository.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final AuthRepository _authRepository;

  GoogleAuthBloc(this._authRepository) : super(GoogleAuthInitial()) {
    on<AppStarted>((event, emit) async {
      // Handle initialization logic 
      emit(GoogleAuthInitial());
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(GoogleAuthLoading());

      try {
        final user = await _authRepository.signInWithGoogle();
        if (user == null) {
          emit(GoogleAuthError("Google sign-in was cancelled."));
          return;
        }
        emit(GoogleAuthenticated(user.displayName ?? '', user.email ?? ''));
      } catch (e) {
        emit(GoogleAuthError("An error occurred during Google sign-in."));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await _authRepository.signOut();
      emit(GoogleAuthInitial());
    });
  }
}

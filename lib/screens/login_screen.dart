import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code_flutter_fire/screens/hotels_list_screen.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_bloc.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_event.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            ' Sign-In',
            style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 24),
          )),
      body: BlocListener<GoogleAuthBloc, GoogleAuthState>(
        listener: (context, state) {
          if (state is GoogleAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HotelListScreen(name: state.name, email: state.email)),
            );
          } else if (state is GoogleAuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              minimumSize: const Size(0, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              BlocProvider.of<GoogleAuthBloc>(context)
                  .add(GoogleSignInRequested());
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  width: 50,
                  height: 50,
                ),
                Text(
                  'Sign in with Google',
                  style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

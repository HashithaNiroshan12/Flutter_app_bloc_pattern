import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_bloc.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_event.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.email, required this.name});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            name,
            style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            email,
            style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.tertiary,
                fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle logout logic here
              BlocProvider.of<GoogleAuthBloc>(context).add(LogoutRequested());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 75, 241, 166),
              minimumSize:
                  const Size(200, 45), // Adjust width and height as needed
              shape: RoundedRectangleBorder(
                
                borderRadius:
                    BorderRadius.circular(0), // Set this to 0 for a rectangle
              ),
            ),
            child:  Text('Logout',
            style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

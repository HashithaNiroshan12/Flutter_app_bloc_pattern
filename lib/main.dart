import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:test_code_flutter_fire/repositories/auth_repository.dart';
import 'package:test_code_flutter_fire/repositories/hotels_repository.dart';

import 'package:test_code_flutter_fire/screens/login_screen.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_bloc.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final AuthRepository authRepository = AuthRepository();

  runApp(MyApp(authRepository: authRepository));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.authRepository});

  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HotelRepository>(
          create: (context) => HotelRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GoogleAuthBloc(authRepository)..add(AppStarted()),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   final AuthRepository authRepository;

//   const MyApp({super.key, required this.authRepository});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) =>
//               GoogleAuthBloc(authRepository)..add(AppStarted()),
//         ),
//       ],
//       child: const MaterialApp(
//         home: LoginScreen(),
//       ),
//     );
//   }
// }

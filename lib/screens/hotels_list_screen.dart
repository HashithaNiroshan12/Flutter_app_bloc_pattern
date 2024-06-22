import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_code_flutter_fire/models/hotels.dart';
import 'package:test_code_flutter_fire/repositories/hotels_repository.dart';
import 'package:test_code_flutter_fire/screens/details_screen.dart';
import 'package:test_code_flutter_fire/screens/login_screen.dart';
import 'package:test_code_flutter_fire/shared/widgets/user_details.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_bloc.dart';
import 'package:test_code_flutter_fire/state/google_auth/google_auth_state.dart';
import 'package:test_code_flutter_fire/state/hotels/hotels_bloc.dart';
import 'package:test_code_flutter_fire/state/hotels/hotels_event.dart';
import 'package:test_code_flutter_fire/state/hotels/hotels_state.dart';

class HotelListScreen extends StatelessWidget {
  const HotelListScreen({super.key, required this.email, required this.name});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => HotelsBloc(
        RepositoryProvider.of<HotelRepository>(context),
      )..add(LoadHotelEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[200],
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'List View',
              style: textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 24),
            ),
          ),
        ),
        body: BlocListener<GoogleAuthBloc, GoogleAuthState>(
          listener: (context, state) {
            if (state is GoogleAuthInitial) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          },
          child: BlocBuilder<HotelsBloc, HotelsState>(
            builder: (context, state) {  // if view state is loading show circular progress
              if (state is HotelsInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HotelsLoadedState) {
                List<Hotel> hotelList = state.hotels;
                return Column(
                  children: [
                    UserDetails(name: name, email: email),
                    Expanded(
                      child: ListView.separated(
                        itemCount: hotelList.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(e: hotelList[index]),
                              ));
                            },
                            child: ListTile(
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/profile.jpg',
                                    image: hotelList[index].image['small']!,
                                    fit: BoxFit.cover,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/images/profile.jpg',
                                          fit: BoxFit.cover);
                                    },
                                  ),
                                ),
                              ),
                              title: Text(
                                hotelList[index].title,  //title text
                                style: textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme.onSurface,
                                    fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  hotelList[index].address,
                                  style: textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.outline,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            indent: 20,
                            endIndent: 20,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              //if erroe has occured show error text

              if (state is HotelsErrorState) {
                return Center(
                  child: Text(
                    "Error",
                    style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.secondary,
                        fontSize: 12),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

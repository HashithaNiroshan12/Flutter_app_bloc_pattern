// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';




import 'package:test_code_flutter_fire/repositories/hotels_repository.dart';
import 'package:test_code_flutter_fire/state/hotels/hotels_event.dart';

import 'package:test_code_flutter_fire/state/hotels/hotels_state.dart';



class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final HotelRepository _hotelRepository;
  HotelsBloc(this._hotelRepository) : super(HotelsInitial()) {
    on<HotelsEvent>((event, emit) async {
      emit(HotelsInitial());
      
      try {
        final hotels = await _hotelRepository.fetchItems();
        emit(HotelsLoadedState(hotels));
      } catch (e) {
        emit(HotelsErrorState(e.toString()));
      }
    });
  }
}

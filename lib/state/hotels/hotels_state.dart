import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_code_flutter_fire/models/hotels.dart';


@immutable
abstract class HotelsState extends Equatable {}

//data loading state
class HotelsInitial extends HotelsState {
  @override
  List<Object> get props => [];
}

//data loaded state
class HotelsLoadedState extends HotelsState {
  HotelsLoadedState(this.hotels);
  final List<Hotel> hotels;
  @override
  List<Object> get props => [hotels];
}

//data error loading state
class HotelsErrorState extends HotelsState {
  HotelsErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

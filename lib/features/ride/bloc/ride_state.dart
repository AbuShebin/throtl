part of 'ride_bloc.dart';

@immutable
sealed class RideState {}

final class AddRideInitialState extends RideState {}

final class GetRideInitialState extends RideState {}

final class RideLoadingState extends RideState {}

final class AddRideSuccessState extends RideState {}

final class AddRideFailureState extends RideState {}

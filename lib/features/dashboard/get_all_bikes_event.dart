part of 'get_all_bikes_bloc.dart';

@immutable
sealed class GetAllBikesEvent {}

final class GetAllBikesInitialEvent extends GetAllBikesEvent{}

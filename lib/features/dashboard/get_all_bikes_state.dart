part of 'get_all_bikes_bloc.dart';

@immutable
sealed class GetAllBikesState {}

final class GetAllBikesInitial extends GetAllBikesState {}
final class GetAllBikesSuccess extends GetAllBikesState {
  final List<GetAllBikesModel> getAllBikesModel;

  GetAllBikesSuccess({required this.getAllBikesModel});
}
final class GetAllBIkesFailure extends GetAllBikesState{}
final class GetAllBIkesLoading extends GetAllBikesState{}

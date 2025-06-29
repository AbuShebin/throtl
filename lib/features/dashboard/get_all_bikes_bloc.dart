import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:throtl/features/dashboard/models/getAllBikesModel.dart';
import 'package:throtl/features/dashboard/repository/dashboard_repository.dart';

part 'get_all_bikes_event.dart';
part 'get_all_bikes_state.dart';

class GetAllBikesBloc extends Bloc<GetAllBikesEvent, GetAllBikesState> {
  GetAllBikesBloc() : super(GetAllBikesInitial()) {
    on<GetAllBikesInitialEvent>(_getAllBikes);
  }

  _getAllBikes(GetAllBikesInitialEvent event,Emitter<GetAllBikesState> emit) async {
    emit(GetAllBIkesLoading());
    try{
      DashboardRepository dashboardRepository = DashboardRepository();
      final result =await dashboardRepository.getAllBikesModel();
      result.fold((l) => emit(GetAllBIkesFailure()), (r) => emit(GetAllBikesSuccess(getAllBikesModel: r)));
    }catch(e){
      emit(GetAllBIkesFailure());
    }
  }

  @override
  void onTransition(Transition<GetAllBikesEvent, GetAllBikesState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onEvent(GetAllBikesEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    print("event is $event");
  }
}



import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  RideBloc() : super(GetRideInitialState()) {
    on<AddRideInitialState>((event, emit) {
      
    });


  }

}

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:throtl/features/dashboard/controller/dashboard_controller.dart';
import 'package:throtl/features/dashboard/models/getAllBikesModel.dart';
import 'package:throtl/features/dashboard/repository/dashboard_repository.dart';

final dashBoardProvider = AsyncNotifierProvider<Dashboardproviders,List<GetAllBikesModel>>(() {
  return Dashboardproviders();
},);

class Dashboardproviders extends AsyncNotifier<List<GetAllBikesModel>> {
  @override
  FutureOr<List<GetAllBikesModel>> build() {
    return getAllBikes();
  }

 Future<List<GetAllBikesModel>> getAllBikes()async{
  return  ref.watch(dashBoardControllerProvider.notifier).getAllBikes();
  }

}
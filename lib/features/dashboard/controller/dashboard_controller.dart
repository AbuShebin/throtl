import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:throtl/core/customCommon/customSnackbar.dart';
import 'package:throtl/core/error_handling/error_text.dart';
import 'package:throtl/features/dashboard/models/addBikeModel.dart';
import 'package:throtl/features/dashboard/models/getAllBikesModel.dart';
import 'package:throtl/features/dashboard/repository/dashboard_repository.dart';

final dashBoardControllerProvider = NotifierProvider<DashboardController, bool>(() => DashboardController(),
);

class DashboardController extends Notifier<bool> {
  @override
  bool build() {
  return false;
  }

  addBike({required Addbikemodel addbikemodel,required BuildContext context}) async {
   final res = await ref.read(DashboardRepositoryProvider).addBike(addbikemodel: addbikemodel);
   res.fold((l) => Customsnackbar.showSnackBar(content: l.errMessager, context: context, color: Colors.red), (r) {
     Customsnackbar.showSnackBar(content: "Bike added successfully", context: context, color: Colors.green);
     context.pop();
   });
  }

  Future<List<GetAllBikesModel>> getAllBikes() async {
    final res = await ref.read(DashboardRepositoryProvider).getAllBikesModel();

  return  res.fold((l){
    print("left worked");
    throw Exception( l.toString());
  }, (r) {
    print("right worked$r");
      return r;
    });
  }

}
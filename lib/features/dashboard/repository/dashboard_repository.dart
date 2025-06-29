import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:throtl/core/API_endpoints/API_endpoints.dart';
import 'package:throtl/core/error_handling/failure.dart';
import 'package:throtl/core/error_handling/type_def.dart';
import 'package:throtl/features/dashboard/models/addBikeModel.dart';
import 'package:throtl/features/dashboard/models/getAllBikesModel.dart';

final DashboardRepositoryProvider = StateProvider((ref) {
  return DashboardRepository();
},);

class DashboardRepository {
        Dio dio = Dio();

 FutureEither addBike({required Addbikemodel addbikemodel}) async {
    try{
      print("outgoind requrest to add bike");
      final result =await dio.post(
      "http://192.168.1.43:3000/throtl/addBike",
      data: {"bikeName": "Yamaha Fz16", "model": "version 1", "year": 2016},
    );
print("reuslt is ${result.data}");
    if(result.statusCode == 200) {
      return right(result.data["message"]);
    } else {
      return left(Failure(errMessager: "Failed to add bike"));
    }
    }catch(e,s){
      print(s);
      print(e);
      return left(Failure(errMessager: e.toString()));
    }
  }

  FutureEither<List<GetAllBikesModel>> getAllBikesModel()async{
    try{
      print("get asll bike  request");
    final result = await dio.get("http://192.168.1.43:3000/vehicle/getAllBikes");

    if(result.statusCode == 200) {
      print("result is ${result.data}${result.statusCode}");
      List<GetAllBikesModel> bikes = (result.data["bikes"] as List)
          .map((bike) => GetAllBikesModel.fromJson(bike))
          .toList();
      return right(bikes);
    } else {
      throw "SOmething went wrong"; 
    }}
    catch(e,s){
      print("exception is $e");
      return left(Failure(errMessager: e.toString()));
    }
  }
}

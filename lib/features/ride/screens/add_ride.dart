import 'package:flutter/material.dart';
import 'package:throtl/core/customCommon/customContainer.dart';
import 'package:throtl/core/customCommon/customTextField_common.dart';
import 'package:throtl/core/utils/routes/route_constants.dart';
import 'package:throtl/core/utils/themes/pallete.dart';
import 'package:throtl/features/ride/models/addRideModel.dart';

class AddRideDetailsScreen extends StatelessWidget {
  static const String routeName = RouteConstants.addRideDetailsRouteName;
  const AddRideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    TextEditingController startingKmController = TextEditingController();
    TextEditingController endingKmController = TextEditingController();
    TextEditingController rideDateController = TextEditingController();
    TextEditingController startingPointController = TextEditingController();
    TextEditingController destinationController = TextEditingController();
    TextEditingController startTimeController = TextEditingController();
    TextEditingController endTimeController = TextEditingController();
    TextEditingController fuelAddedController = TextEditingController();
    TextEditingController odometerAtFuelController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: Text("Add ride")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  labelText: "Starting KM",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: startTimeController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "Ending KM",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: endingKmController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "Ride Date",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: rideDateController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "Starting point",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: startingPointController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "Destination",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: destinationController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "startTime",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: startTimeController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "endTime",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: endTimeController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "fuelAdded",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: fuelAddedController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "odometerAtFuel",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: odometerAtFuelController,
                ),
                SizedBox(height: h * 0.01),
                CustomTextField(
                  labelText: "note",
                  h: h,
                  w: w,
                  maxLines: 1,
                  controller: noteController,
                ),
                SizedBox(height: h * 0.01),
                CustomClickableContainer(
                  onTap: () {
                    Addridemodel newRide = Addridemodel(
                      startingKm: int.tryParse(startingKmController.text),
                      endingKm: int.tryParse(endingKmController.text),
                      rideDate: DateTime.tryParse(rideDateController.text),
                      startingPoint: startingPointController.text,
                      destination: destinationController.text,
                      startTime: startTimeController.text,
                      endTime: endTimeController.text,
                      fuelAdded: double.tryParse(fuelAddedController.text),
                      odometerAtFuel: int.tryParse(
                        odometerAtFuelController.text,
                      ),
                      note: noteController.text,
                    );
                    saveRide(newRide: newRide);
                  },
                  text: "Save ride",
                  color: AppColors.buttonColor,
                  textColor: AppColors.iconMain,
                  height: h * 0.06,
                  width: w,
                  borderColor: AppColors.buttonColor,
                  icon: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveRide({required Addridemodel newRide}) {
    
  }
}

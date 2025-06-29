import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throtl/core/error_handling/error_text.dart';
import 'package:throtl/core/utils/loader.dart';
import 'package:throtl/core/utils/routes/route_constants.dart';
import 'package:throtl/features/bike_details/screens/bike_details.dart';
import 'package:throtl/core/utils/themes/fontSyle.dart';
import 'package:throtl/core/utils/themes/pallete.dart';
import 'package:throtl/features/dashboard/controller/dashboard_controller.dart';
import 'package:throtl/features/dashboard/dashboardProviders/dashboardProviders.dart';
import 'package:throtl/features/dashboard/get_all_bikes_bloc.dart';
import 'package:throtl/features/dashboard/models/addBikeModel.dart';
import 'package:throtl/features/maintenace/maintenance_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
    static const routeName = RouteConstants.dashBoardRouteName;

  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAllBikesBloc>().add(GetAllBikesInitialEvent());

  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.01),
            Padding(
              padding: EdgeInsets.only(left: w * .01, right: w * 0.01),
              child: Container(
                width: double.infinity,
                height: h * 0.25,
                decoration: BoxDecoration(color: AppColors.cardBackground),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "TOTAL FUEL EXPENSE",
                      style: AppTextStyles.dashBordMainCardTextStyle.copyWith(
                        fontFamily: 'Orbitron',
                      ),
                    ),
                    Text(
                      "\$5000",
                      style: GoogleFonts.orbitron().copyWith(
                        fontSize: 25,
                        color: Colors.red,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(height: h * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [Text("Avg. Mileage"), Text("50km/ltr.")],
                        ),
                        Column(
                          children: [Text("Avg. Mileage"), Text("50km/ltr.")],
                        ),
                        Column(
                          children: [Text("Avg. Mileage"), Text("50km/ltr.")],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.01),
            
            // My Bikes Section Header with Add Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Bikess",
                    style: AppTextStyles.dashBordMainCardTextStyle.copyWith(
                      fontFamily: 'Tomorrow',
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showAddBikeDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Add Bike",
                            style: GoogleFonts.tomorrow().copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.01),
            SizedBox(
                height: h * 0.22,

            child: BlocBuilder<GetAllBikesBloc,GetAllBikesState>(builder: (context, state) {
                if(state is GetAllBIkesLoading){
                  return ErrorText(errorText: "something went wrong state is Failure state, will come back stronger");
                }


                         if(state is! GetAllBikesSuccess){
               return Loader(isLinear: true,);
                         }
                return ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: EdgeInsets.only(left: w * .01, right: w * 0.01),
                      child: GestureDetector(
                        onTap: () => context.push(BikeDetailsScreen.routeName),
                        child: Container(
                          width: w * .4,
                          height: h * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: h*0.02,),
                              Text(state.getAllBikesModel[index].bikeName,style: AppTextStyles.headline),
                              SizedBox(height: h*0.1,),
                              Text("Last serviced on\n 12/02/2025",style: AppTextStyles.iconTextStyle.copyWith(
                                  fontSize: 12
                              )),
                              SizedBox(height: h*0.02,)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.getAllBikesModel.length, // 3 bikes + 1 add new bike card
                );
              },),
            ),
            // Bikes List with Add New Bike Card

            // SizedBox(
            //   height: h * 0.22,
            //   child: Consumer(
            //     builder: (context, ref, child) {
            //     return  ref.watch(dashBoardProvider).when(
            //       data: (bikeDataList) {
            //         return ;
            //
            //       },
            //     loading: () => Loader(
            //       isLinear: true,
            //     ),
            //     error: (error, stackTrace) => ErrorText(
            //       errorText: error.toString(),
            //     ),
            //     );
            //     }, ),
            // ),
            SizedBox(height: h * 0.01),
            Padding(
              padding: EdgeInsets.only(left: w*0.02, right: w*0.02),
              child: Text(
                "Quick Actions",
                style: AppTextStyles.dashBordMainCardTextStyle.copyWith(
                  fontFamily: 'Tomorrow',
                ),
              ),
            ),
            SizedBox(height: h * 0.01),
            Padding(
              padding: EdgeInsets.only(left: w*0.01, right: w*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickActionButton(
                    context,
                    icon: Icons.local_gas_station,
                    label: "Add Fuel",
                    onTap: () {
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.build,
                    label: "Maintenance",
                    onTap: () {
                      // Maintenance action
                      context.push(MaintenanceScreen.routeName);
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.analytics,
                    label: "Analytics",
                    onTap: () {
                      // Analytics action
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.history,
                    label: "History",
                    onTap: () {
                      // History action
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: h*0.03,),
            // Spare Parts Promo Banner
            Container(
              width: double.infinity,
              height: h * 0.12,
              margin: EdgeInsets.symmetric(horizontal: w * 0.02),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red.shade400, Colors.red.shade600],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(w * 0.04),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Spare Parts Sale!",
                            style: GoogleFonts.orbitron().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Up to 30% off on genuine parts",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.local_offer,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // Add New Bike Card Widget
  Widget _buildAddNewBikeCard(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: w * .01, right: w * 0.01),
      child: GestureDetector(
        onTap: () => _showAddBikeDialog(context),
        child: Container(
          width: w * .4,
          height: h * 0.2,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(
              color: Colors.red.withOpacity(0.3),
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: h * 0.02),
              Text(
                "ADD NEW\nBIKE",
                style: GoogleFonts.tomorrow().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show Add Bike Dialog
  void _showAddBikeDialog(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.motorcycle, color: Colors.red),
              SizedBox(width: 10),
              Text(
                "Add New Bike",
                style: GoogleFonts.tomorrow().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Container(
            width: w * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Bike Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.motorcycle),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Model",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.info_outline),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Addbikemodel newBike = Addbikemodel(
                  bikeName: "New Bike",
                  model: "Model X",
                  year: 2023,
                );

                ref.read(dashBoardControllerProvider.notifier).addBike(addbikemodel: newBike, context: context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Add Bike",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildQuickActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w * 0.2,
        height: h * 0.1,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: AppColors.iconMain,
            ),
            SizedBox(height: h * 0.005),
            Text(
              label,
              style:AppTextStyles. iconTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildBikeCard(BuildContext context, int index) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    List<String> bikeNames = ["Royal Enfield", "Honda CB", "Yamaha R15"];
    List<IconData> bikeIcons = [
      Icons.motorcycle,
      Icons.two_wheeler,
      Icons.sports_motorsports
    ];

    return Container(
      width: w * 0.4,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: w * 0.2,
              height: w * 0.2,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                bikeIcons[index],
                size: 40,
                color: Colors.red,
              ),
            ),
            SizedBox(height: h * 0.02),
            Text(
              bikeNames[index],
              style: GoogleFonts.tomorrow().copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: h * 0.005),
            Text(
              "Last service: 2 days ago",
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
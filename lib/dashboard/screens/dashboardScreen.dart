import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throtl/bike_details/screens/bike_details.dart';
import 'package:throtl/core/utils/themes/fontSyle.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
            SizedBox(
              height: h * 0.22,
              child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: w * .01, right: w * 0.01),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BikeDetailsScreen(),)),
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
                            Text("BIKE ${index+1}",style: AppTextStyles.headline),
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
                itemCount: 3,
              ),
            ),
            SizedBox(height: h * 0.01),
            Padding(
              padding: EdgeInsetsGeometry.only(left: w*0.02,right: w*0.02),
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
                      // Add fuel action
                      print("Add Fuel tapped");
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.build,
                    label: "Maintenance",
                    onTap: () {
                      // Maintenance action
                      print("Maintenance tapped");
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.analytics,
                    label: "Analytics",
                    onTap: () {
                      // Analytics action
                      print("Analytics tapped");
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.history,
                    label: "History",
                    onTap: () {
                      // History action
                      print("History tapped");
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
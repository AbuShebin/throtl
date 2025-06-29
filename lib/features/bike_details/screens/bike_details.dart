import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throtl/core/utils/routes/route_constants.dart';
import 'package:throtl/core/utils/themes/fontSyle.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

class BikeDetailsScreen extends StatefulWidget {
  static const routeName = RouteConstants.bikeDetailsRoute;
  const BikeDetailsScreen({super.key});

  @override
  State<BikeDetailsScreen> createState() => _BikeDetailsScreenState();
}

class _BikeDetailsScreenState extends State<BikeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        title: Text(
          "Bike Details",
          style: GoogleFonts.orbitron().copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.cardHeading,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.cardHeading),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.red),
            onPressed: () {
              print("Edit bike details");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bike Image and Basic Info Section
            Padding(
              padding:  EdgeInsets.only(left: w*0.01,right: w*0.01),
              child: Container(
                width: double.infinity,
                height: h * 0.3,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: w * 0.4,
                      height: w * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.motorcycle,
                        size: 80,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: h * 0.02),
                    Text(
                      "Royal Enfield Classic 350",
                      style: AppTextStyles.headline,
                    ),
                    SizedBox(height: h * 0.005),
                    Text(
                      "2023 Model • 15,000 km",
                      style: AppTextStyles.subHeadline.copyWith(
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: h * 0.02),

            // Stats Cards Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                     title: "Total Expenses",
                     value:  "₹45,000",
                    icon:  Icons.currency_rupee,
                     color:  Colors.green,
                    ),
                  ),
                  SizedBox(width: w * 0.04),
                  Expanded(
                    child: _buildStatCard(
                     title:  "Avg Mileage",
value:                       "35 km/l",
       icon:                Icons.local_gas_station,
             color:          Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.02),

            // Service Information
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(w * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Service Information",
                      style: AppTextStyles.dashBordMainCardTextStyle.copyWith(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: h * 0.015),
                    _buildServiceInfo(title: "Last Service", value: "15 Feb 2024",icon:  Icons.build),
                    SizedBox(height: h * 0.01),
                    _buildServiceInfo(title: "Next Service", value: "15 May 2024",icon:  Icons.schedule),
                    SizedBox(height: h * 0.01),
                    _buildServiceInfo(title: "Service Due",value: "2,000 km",icon:  Icons.speed),
                  ],
                ),
              ),
            ),

            SizedBox(height: h * 0.02),

            // Quick Actions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Text(
                "Quick Actions",
                style: AppTextStyles.dashBordMainCardTextStyle.copyWith(
                  fontFamily: 'Tomorrow',
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(height: h * 0.015),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickActionButton(
                    context,
                    icon: Icons.local_gas_station,
                    label: "Add Fuel",
                    color: Colors.blue,
                    onTap: () {
                      print("Add Fuel tapped");
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.build,
                    label: "Service",
                    color: Colors.orange,
                    onTap: () {
                      print("Service tapped");
                    },
                  ),
                  _buildQuickActionButton(
                    context,
                    icon: Icons.receipt_long,
                    label: "Expenses",
                    color: Colors.green,
                    onTap: () {
                      print("Expenses tapped");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: h * 0.02),

            // Recent Activities
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(w * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Activities",
                      style: AppTextStyles.dashBordMainCardTextStyle.copyWith(
                        fontFamily: 'Tomorrow',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: h * 0.015),
                    _buildActivityItem("Fuel Added", "₹2,500", "2 days ago", Icons.local_gas_station),
                    _buildActivityItem("Oil Change", "₹800", "1 week ago", Icons.build),
                    _buildActivityItem("Tire Check", "₹200", "2 weeks ago", Icons.tire_repair),
                  ],
                ),
              ),
            ),

            SizedBox(height: h * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title,required  String value,required  IconData icon,required  Color color}) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(w * 0.04),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: color,
          ),
          SizedBox(height: h * 0.01),
          Text(
            value,
            style: GoogleFonts.orbitron().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.cardHeading,
            ),
          ),
          SizedBox(height: h * 0.005),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.cardParagraph,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceInfo({required String title,required  String value,required  IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.red,
        ),
        SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.cardParagraph,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w * 0.25,
        height: h * 0.12,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                size: 22,
                color: color,
              ),
            ),
            SizedBox(height: h * 0.01),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.cardHeading,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String title, String amount, String date, IconData icon) {
    var h = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.015),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.cardHeading,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.cardParagraph,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.orbitron().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
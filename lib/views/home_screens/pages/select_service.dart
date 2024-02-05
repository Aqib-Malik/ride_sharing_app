import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share_app/constants/color.dart';
import 'package:ride_share_app/views/home_screens/pages/create_ride.dart';
import 'package:ride_share_app/views/widgets/cat_widget.dart';

class SelectService extends StatefulWidget {
  const SelectService({super.key});

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _categories = [
 
    const CategoryCard(
        lottieAssetList: [
       'assets/map.json',
        ],
        title: 'Create Ride',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
        screen: CreateRide(),
        icon: Icons.map),
    const CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/8780/8780591.png'
        ],
        title: 'Join Rides',
        primaryColor: Colors.redAccent,
        secondaryColor: Colors.red,
        screen: CreateRide(),
        icon: Icons.map),
    const CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/11472/11472723.png'
        ],
        title: 'My Profile',
        primaryColor: Colors.orangeAccent,
        secondaryColor: Colors.orange,
        screen: CreateRide(),
        icon: Icons.person),
    const CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/2608/2608208.png'
        ],
        title: 'Faq',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
        screen: CreateRide(),
        icon: Icons.question_answer),
    const CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/675/675729.png',
        ],
        title: 'Settings',
        primaryColor: Colors.purpleAccent,
        secondaryColor: Colors.purple,
        screen: CreateRide(),
        icon: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width/3,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kprimarColor,
                    Colors.lightBlue[200]!,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(80),
                  // bottomRight: Radius.circular(80),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width/3,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    
                    Color.fromARGB(255, 227, 102, 102)!,
                    Color.fromARGB(255, 231, 50, 50)!,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(100),
                  // bottomLeft: Radius.circular(80),
                ),
              ),
            ),
          ),
          
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  backgroundColor: Colors.grey[50],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset(
                        'assets/car_animation.json',
                        fit: BoxFit.cover,
                        // alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(_categories),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

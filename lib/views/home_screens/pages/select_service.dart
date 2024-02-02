import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share_app/views/home_screens/pages/create_ride.dart';
import 'package:ride_share_app/views/widgets/cat_widget.dart';

class SelectService extends StatefulWidget {
  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  //  List<Service> services = [
  //   Service('Create Car Pool', 'https://cdn-icons-png.flaticon.com/128/7178/7178653.png'),
  //   Service('Join Pool', 'https://cdn-icons-png.flaticon.com/128/9540/9540585.png'),
  //   Service('My Pools', 'https://cdn-icons-png.flaticon.com/128/8780/8780591.png'),
  //   Service('My Profile', 'https://cdn-icons-png.flaticon.com/128/11472/11472723.png'),
  //   Service('Settings', 'https://cdn-icons-png.flaticon.com/128/675/675729.png'),
  //   Service('Help', 'https://cdn-icons-png.flaticon.com/128/189/189665.png'),
  //   Service('Contact Us', 'https://cdn-icons-png.flaticon.com/128/5075/5075578.png'),
  //   Service('Faq', 'https://cdn-icons-png.flaticon.com/128/2608/2608208.png'),
  //   // Service('Driver', 'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
  //   // Service('Cook', 'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-cooking-daily-routine-wanicon-flat-wanicon.png'),
  // ];
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _categories = [
 
    CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/9540/9540585.png'
        ],
        title: 'Create Ride',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
        screen: CreateRide(),
        icon: Icons.map),
    CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/8780/8780591.png'
        ],
        title: 'Join Rides',
        primaryColor: Colors.redAccent,
        secondaryColor: Colors.red,
        screen: CreateRide(),
        icon: Icons.map),
    CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/11472/11472723.png'
        ],
        title: 'My Profile',
        primaryColor: Colors.orangeAccent,
        secondaryColor: Colors.orange,
        screen: CreateRide(),
        icon: Icons.person),
    CategoryCard(
        lottieAssetList: [
          'https://cdn-icons-png.flaticon.com/128/2608/2608208.png'
        ],
        title: 'Faq',
        primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
        screen: CreateRide(),
        icon: Icons.question_answer),
    CategoryCard(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            image: DecorationImage(
              image: AssetImage('assets/bg-bottom.png'),
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  backgroundColor: Colors.grey[50],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset(
                        'assets/car_animation.json',
                        fit: BoxFit.fill,
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
        ),
      ),
    );
  }
}

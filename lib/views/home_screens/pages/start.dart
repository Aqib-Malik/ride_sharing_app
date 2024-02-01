import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ride_share_app/constants/color.dart';
import 'package:ride_share_app/views/home_screens/animation/FadeAnimation.dart';
import 'package:ride_share_app/views/home_screens/models/service.dart';
import 'package:ride_share_app/views/home_screens/pages/select_service.dart';

class StartPage extends StatefulWidget {
  const StartPage({ Key? key }) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<Service> services = [
    Service('Commute', 'https://cdn-icons-png.flaticon.com/128/3800/3800971.png'),
    Service('Carpool', 'https://cdn-icons-png.flaticon.com/128/2055/2055263.png'),
    Service('Share Ride', 'https://cdn-icons-png.flaticon.com/128/8567/8567438.png'),
    Service('Travel Together', 'https://cdn-icons-png.flaticon.com/128/4793/4793476.png'),
    Service('Ride Companion', 'https://cdn-icons-png.flaticon.com/128/7925/7925129.png'),
   Service('Co-Travel', 'https://cdn-icons-png.flaticon.com/128/2654/2654411.png'),
    Service('Shared Journey', 'https://cdn-icons-png.flaticon.com/128/854/854894.png'),
    Service('Group Commute', 'https://cdn-icons-png.flaticon.com/128/7185/7185630.png'),
    Service('Driver Service', 'https://cdn-icons-png.flaticon.com/128/3012/3012075.png'),
  ];

  int selectedService = 4;

  @override
  void initState() {
    // Randomly select from service list every 2 seconds
    Timer.periodic(Duration(seconds: 2), (timer) { 
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarColor,
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation((1.0 + index) / 4, serviceContainer(services[index].imageURL, services[index].name, index));
              }
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  FadeAnimation(1.5, Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Text(
                        'Share Rides, Share Smiles!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.5, Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Center(
                      child: Text(
                        'Navigate Together, Arrive Happier – Your Commute, Our Commitment!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  )),
                  FadeAnimation(1.5, Padding(
                    padding: EdgeInsets.all(50.0),
                    child: MaterialButton(
                      elevation: 0,
                      color: kprimarColor,
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectService(),
                          ),
                        );
                      },
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index ? Colors.amber: Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(image, height: 30),
            SizedBox(height: 10,),
            Text(name, style: TextStyle(fontSize: 12),)
          ]
        ),
      ),
    );
  }
}

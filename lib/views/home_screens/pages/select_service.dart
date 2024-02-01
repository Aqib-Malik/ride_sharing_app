import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share_app/constants/color.dart';
import 'package:ride_share_app/views/home_screens/animation/FadeAnimation.dart';
import 'package:ride_share_app/views/home_screens/models/service.dart';
import 'package:ride_share_app/views/home_screens/pages/cleaning.dart';

class SelectService extends StatefulWidget {
  const SelectService({ Key? key }) : super(key: key);

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  List<Service> services = [
    Service('Create Car Pool', 'https://cdn-icons-png.flaticon.com/128/7178/7178653.png'),
    Service('Join Pool', 'https://cdn-icons-png.flaticon.com/128/9540/9540585.png'),
    Service('My Pools', 'https://cdn-icons-png.flaticon.com/128/8780/8780591.png'),
    Service('My Profile', 'https://cdn-icons-png.flaticon.com/128/11472/11472723.png'),
    Service('Settings', 'https://cdn-icons-png.flaticon.com/128/675/675729.png'),
    Service('Help', 'https://cdn-icons-png.flaticon.com/128/189/189665.png'),
    Service('Contact Us', 'https://cdn-icons-png.flaticon.com/128/5075/5075578.png'),
    Service('Faq', 'https://cdn-icons-png.flaticon.com/128/2608/2608208.png'),
    // Service('Driver', 'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
    // Service('Cook', 'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-cooking-daily-routine-wanicon-flat-wanicon.png'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: selectedService >= 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CleaningPage(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios, size: 20,),
        backgroundColor: Colors.amber,
        elevation: 4.0,
        splashColor: Colors.white, // Add a splash color for a better visual effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ) : null,
      body:  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: Get.height/2.7,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
  title: Text(
    'Ride Share App',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: kprimarColor, // Change the color to your preference
      fontFamily: 'YourCustomFont', // Replace with your custom font
      shadows: [
        Shadow(
          blurRadius: 5.0,
          color: Color.fromARGB(255, 167, 164, 164),
          offset: Offset(2.0, 2.0),
        ),
      ],
    ),
  ),
  background: Lottie.asset(
    'assets/car_animation.json', // Replace with your logo URL
    fit: BoxFit.cover,
  ),
),

            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeAnimation((1.0 + index) / 4, serviceContainer(services[index].imageURL, services[index].name, index));
                  }
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

 serviceContainer(String image, String name, int index) {
  return GestureDetector(
    onTap: () {
      setState(() {
        if (selectedService == index)
          selectedService = -1;
        else
          selectedService = index;
      });
    },
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            selectedService == index ? kprimarColor : Color.fromARGB(255, 167, 190, 224),
            selectedService == index ? Colors.blue.shade100 : Color.fromARGB(255, 222, 233, 244),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'image$index',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: selectedService == index ? const Color.fromARGB(255, 172, 129, 2) :Color.fromARGB(255, 17, 82, 135),
            ),
          )
        ],
      ),
    ),
  );
}


}

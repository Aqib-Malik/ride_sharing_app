// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share_app/constants/color.dart';
import 'package:ride_share_app/views/home_screens/animation/FadeAnimation.dart';
import 'package:ride_share_app/views/home_screens/pages/date_time.dart';

class CreateRide extends StatefulWidget {
  const CreateRide({Key? key}) : super(key: key);

  @override
  _CreateRideState createState() => _CreateRideState();
}

class _CreateRideState extends State<CreateRide> {

  final List<dynamic> _fields = [
    ['Start Location', 'https://cdn-icons-png.flaticon.com/128/854/854929.png', Colors.teal, 0],
    ['Destination', 'https://cdn-icons-png.flaticon.com/128/3710/3710271.png', Colors.teal, 0],
    
    ['Price', 'https://img.icons8.com/material/96/000000/price-tag--v1.png', Colors.pink, 0],
    ['Phone Number', 'https://cdn-icons-png.flaticon.com/128/5585/5585836.png', Colors.teal, 0],
    
    ['Seat', 'https://cdn-icons-png.flaticon.com/128/6331/6331941.png', Colors.orange, 1],
    ['A C', 'https://cdn-icons-png.flaticon.com/128/7745/7745389.png', Colors.purple, 0],
  ];
  final List<int> _selectedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(
                1,
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
                  child: Column(
                    children: [
                      Lottie.asset('assets/map.json', width: 300, height: 200), // Add this line for the logo
                          const SizedBox(width: 5.0),
                          Text(
                            'Create Ride',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 30),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _fields.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeAnimation((1.2 + index) / 4, room(_fields[index], index));
            },
          ),
        ),
      ),
      bottomNavigationBar:BottomAppBar(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    elevation: 0,
                    color: kprimarColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DateAndTime(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          
    );
  }

  Widget room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index)) {
            _selectedRooms.remove(index);
          } else {
            _selectedRooms.add(index);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selectedRooms.contains(index) ? room[2].shade50.withOpacity(0.5) : Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Image.network(room[1], width: 35, height: 35),
                    const SizedBox(width: 10.0),
                    Text(room[0], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                const Spacer(),
                _selectedRooms.contains(index)
                    ? Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(Icons.check, color: Colors.green, size: 20),
                      )
                    : const SizedBox()
              ],
            ),
            (_selectedRooms.contains(index) && room[3] >= 1)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Text("How many ${room[0]}s?", style: const TextStyle(fontSize: 15)),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  room[3] = index + 1;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                padding: const EdgeInsets.all(10.0),
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: room[3] == index + 1
                                      ? room[2].withOpacity(0.5)
                                      : room[2].shade200.withOpacity(0.5),
                                ),
                                child: Center(child: Text((index + 1).toString(), style: const TextStyle(fontSize: 22, color: Colors.white))),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            // Add TextFields for Price and Phone Number
            if (_selectedRooms.contains(index) &&
                (room[0] == 'Price' || room[0] == 'Phone Number' || room[0] == 'Start Location' || room[0] == 'Destination'))
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: room[0] == 'Price' ? 'Enter Price' : room[0] == 'Phone Number' ? 'Enter Phone Number' : room[0] == 'Start Location' ? 'Enter Start Location' : 'Enter Destination',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

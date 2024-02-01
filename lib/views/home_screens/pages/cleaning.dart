
import 'package:flutter/material.dart';
import 'package:ride_share_app/constants/color.dart';
import 'package:ride_share_app/views/home_screens/animation/FadeAnimation.dart';
import 'package:ride_share_app/views/home_screens/pages/date_time.dart';

class CleaningPage extends StatefulWidget {
  const CleaningPage({ Key? key }) : super(key: key);

  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {

  TextEditingController _pickController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();



  // Rooms to clean
  // Rooms to clean
  final List<dynamic> _rooms = [
    ['Living Room', 'https://img.icons8.com/officel/2x/living-room.png', Colors.red, 0],
    ['Seat', 'https://cdn-icons-png.flaticon.com/128/6331/6331941.png', Colors.orange, 1],
    ['Discount', 'https://img.icons8.com/ios/50/000000/discount--v1.png', Colors.blue, 0], // Updated
    ['A C', 'https://cdn-icons-png.flaticon.com/128/7745/7745389.png', Colors.purple, 0],
    ['Office', 'https://img.icons8.com/color/2x/office.png', Colors.green, 0],
    ['Price', 'https://img.icons8.com/material/96/000000/price-tag--v1.png', Colors.pink, 0], // Added
    ['Phone Number', 'https://img.icons8.com/ios/50/000000/phone.png', Colors.teal, 0], // Added
  ];
  List<int> _selectedRooms = [];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: _selectedRooms.length > 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DateAndTime(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${_selectedRooms.length}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 2),
                  Icon(Icons.arrow_forward_ios, size: 18,),
                ],
              ),
              backgroundColor: Colors.blue,
            )
          : null,
         body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Car Pool',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: TextField(
                          controller: _pickController,
                          decoration: InputDecoration(
                            labelText: 'Start Location',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: TextField(
                          controller: _destinationController,
                          decoration: InputDecoration(
                            labelText: 'Destination',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          ),
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
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 30),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _rooms.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeAnimation((1.2 + index) / 4, room(_rooms[index], index));
            },
          ),
        ),
      ),
    );
  }

  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else
            _selectedRooms.add(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        margin: EdgeInsets.only(bottom: 20.0),
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
                    SizedBox(width: 10.0),
                    Text(room[0], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                _selectedRooms.contains(index)
                    ? Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(Icons.check, color: Colors.green, size: 20),
                      )
                    : SizedBox()
              ],
            ),
            (_selectedRooms.contains(index) && room[3] >= 1)
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Text("How many ${room[0]}s?", style: TextStyle(fontSize: 15)),
                        SizedBox(height: 10.0),
                        Container(
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
                                  margin: EdgeInsets.only(right: 10.0),
                                  padding: EdgeInsets.all(10.0),
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: room[3] == index + 1
                                        ? room[2].withOpacity(0.5)
                                        : room[2].shade200.withOpacity(0.5),
                                  ),
                                  child: Center(child: Text((index + 1).toString(), style: TextStyle(fontSize: 22, color: Colors.white))),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
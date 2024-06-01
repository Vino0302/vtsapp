import 'package:flutter/material.dart';
import 'package:vtsapp/screen/pages/dashboardadmin.dart';
import 'package:vtsapp/screen/pages/vehicleregister.dart';
import 'package:vtsapp/screen/pages/locationtrack.dart';
import 'package:vtsapp/screen/pages/checkavadmin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class Approve extends StatefulWidget {
  const Approve({super.key});

  @override
  State<Approve> createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  Future<void> approveBooking(String id) async {
    await _firestore.collection('bookingdata').doc(id).update({
      'status': 'Approved',
    });
  }

  Future<void> notApproveBooking(String id) async {
    await _firestore.collection('bookingdata').doc(id).update({
      'status': 'Not Approved',
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 35, 102, 1),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/kdu-logo.png"),
              width: 200.0,
              height: 100.0,
            ),
            SizedBox(width: 8),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.account_circle_sharp),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(0, 17, 58, 116),
        elevation: 140.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 38, 86, 130),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardAdmin()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Check Availability',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckAdminAvailablity()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Check Availability',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Register Vehicle',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleRegister()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Track Location',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackLocation()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('bookingdata').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            if (!document.exists) {
              return Container();
            }

            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            if (!data.containsKey('applicant_name')) {
              return Container();
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Applicant Name: ${data['applicant_name']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Date of Required: ${data['date_of_required']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Requirement: ${data['requirement']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Time of Required: ${data['time_of_required']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Vehicle in Charge: ${data['vehicle_in_charge']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Vehicle Type: ${data['vehicle_type']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Address: ${data['address']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Date of Arrival: ${data['date_of_arrival']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Date of Arrival: ${data['dateofarrrival']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Distance: ${data['distance']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Nature of Duty: ${data['natureOfDuty']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Num of Officers: ${data['numofofficers']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Time to be Spent: ${data['timetobespent']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Num of Cadets: ${data['num_of_cadets']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Num of Day Scholars: ${data['num_of_day_scholars']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Time to be Spent: ${data['time_to_be_spent']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  Text('Duty Type: ${data['duty_type']}',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
    SizedBox(height: 8),
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      ElevatedButton(
      onPressed: () {
      // Your 'Ok' button functionality here
      },
      child: Text('Not Approve'),
      ),
      SizedBox(width: 8),
      ElevatedButton(
      onPressed: () {
      // Your 'Cancel' button functionality here
      },
      child: Text('Approve'),
      ),
      ],
      ),
    ),
    ],
    ),
    );
    },
    );
    },
    ),
      ),
    );
  }
}
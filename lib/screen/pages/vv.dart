import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingPage extends StatelessWidget {
  void sendBookingNotification(BuildContext context) async {
    final email = 'mailto:vnacademy7@gmail.com?subject=New Booking&body=A new booking has been made.';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking App'),
        actions: <Widget>[
        ],
      ),
      body:ElevatedButton(
        onPressed: () { sendBookingNotification(context); },
        child: Text('Book Elevated'),
      ),
    );
  }
}
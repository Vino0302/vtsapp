import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EmailSender(),
    );
  }
}

class EmailSender extends StatefulWidget {
  const EmailSender({Key? key}) : super(key: key);

  @override
  State<EmailSender> createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  bool _isSent = false;

  Future<void> _sendEmail() async {
    final smtpServer = gmail(
      'vnacademy7@gmail.com',
      'Linyi@vino00',
    );

    final message = Message()
      ..from = Address('vnacademy7@gmail.com', 'Your Name')
      ..recipients.add('thilankavinodani2000@gmail.com')
      ..subject = 'The subject'
      ..text = 'Mail body.';

    try {
      await send(message, smtpServer);
      setState(() {
        _isSent = true;
      });
    } catch (error) {
      print('Error sending email: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        actions: <Widget>[
          IconButton(
            onPressed: _isSent ? null : _sendEmail,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Center(
        child: Text(_isSent ? 'Email sent' : ''),
      ),
    );
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  void sendSms() async {
    try {
      print("SENDING....");
      final res =
          await dio.post("https://api.textlocal.in/send/", queryParameters: {
        "apikey": "Mzc0NTM3NzM3NTc2NDEzODQ2MzM0YjU1NTc3NTc3Njk=",
        "numbers": "917095832240",
        "message":
            "Hi there, thank you for sending your first test message from Textlocal. See how you can send effective SMS campaigns here: https://tx.gl/r/2nGVj/",
        "sender": "600010",
        "test": true,
      });
      print("DONE...");
      print(res.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Alerter",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 80,
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Numbers (comma separated)'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: 'Text',
                  hintText: 'Input message'),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                sendSms();
              },
              child: Text("Send"),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

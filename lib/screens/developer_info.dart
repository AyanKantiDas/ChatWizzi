import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/media.dart';

class DeveloperInfo extends StatefulWidget {
  const DeveloperInfo({super.key});

  @override
  State<DeveloperInfo> createState() => _DeveloperInfoState();
}

class _DeveloperInfoState extends State<DeveloperInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Developer",
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(50)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: AppLayout.getScreenWidth(),
                height: AppLayout.getHeight(5),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mq.height * 100),
                  border: Border.all(
                    color: Colors.black,
                    width: 5.0, // Adjust the width as needed
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(mq.height * 100),
                  child: Image.asset(
                    "assests/images/ayank.png",
                    width: AppLayout.getWidth(150),
                    height: AppLayout.getHeight(150),
                    fit: BoxFit
                        .cover, // This ensures the image fits within the circular border
                  ),
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(10),
              ),
              Text("Ayan Kanti Das",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              SizedBox(
                height: AppLayout.getHeight(11),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Flutter || Firebase || Java",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
              SizedBox(
                height: AppLayout.getHeight(10),
              ),
              Text("------  Profile Details  -------",
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              TextFormField(
                initialValue: "India",
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.flag_rounded,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text(
                      "Country",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 22,
                          fontStyle: FontStyle.italic),
                    )),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              TextFormField(
                initialValue: "Haldia WB",
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_city_rounded,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Address",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontStyle: FontStyle.italic))),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              TextFormField(
                initialValue: "dasayankanti@gmail.com",
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_rounded,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Email",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontStyle: FontStyle.italic))),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              TextFormField(
                initialValue: "+91 8293033102",
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text("Phone Number",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontStyle: FontStyle.italic))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

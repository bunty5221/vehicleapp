import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicleapp/view/second_screen.dart';
import 'package:vehicleapp/view/widget/bike_widget.dart';
import 'package:vehicleapp/view/widget/car_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final firestore = FirebaseFirestore.instance
      .collection("vehicle")
      .where('vehicletype', isEqualTo: 'Bike')
      .snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("vehicle");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Homepage"),
          bottom: TabBar(tabs: [
            Tab(
              text: "Bike",
              icon: Icon(Icons.electric_bike_rounded),
            ),
            Tab(
              text: "Car",
              icon: Icon(Icons.car_rental),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            BikeWidget(),
            CarWidget(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

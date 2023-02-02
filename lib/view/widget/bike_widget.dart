import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BikeWidget extends StatefulWidget {
  const BikeWidget({Key? key}) : super(key: key);

  @override
  State<BikeWidget> createState() => _BikeWidgetState();
}

class _BikeWidgetState extends State<BikeWidget> {
  final firestore =
  FirebaseFirestore.instance.collection("vehicle") .where('vehicletype', isEqualTo: 'Bike').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("vehicle");
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: firestore,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              if (snapshot.hasError) return Text("some errror");


              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {


                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 80,
                            decoration: BoxDecoration(color: Colors.teal),
                            child: Stack(children: [
                              Positioned(
                                  left: 360,
                                  top: -12,
                                  child: IconButton(
                                      onPressed: () {
                                        ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();

                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent,
                                        size: 30,
                                      ))),
                              Positioned(
                                top: 10,
                                left: 120,
                                child: Text(
                                  snapshot.data!.docs[index]['number']
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 40,
                                left: 120,
                                child: Text(
                                  snapshot.data!.docs[index]['brand']
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 70,
                                left: 120,
                                child: Text(
                                  snapshot
                                      .data!.docs[index]['vehicletype']
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 120,
                                child: Text(
                                  snapshot.data!.docs[index]['fueltype']
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        );
                    }),
              );
            }),
      ],
    );
  }
}

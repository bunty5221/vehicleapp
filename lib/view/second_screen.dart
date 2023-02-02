import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final firestore = FirebaseFirestore.instance.collection('vehicle');

  var selectedBrand, selectedFuel, selectedVehicle;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  TextEditingController VehicleNumber = TextEditingController();
  List<String> _BrandName = <String>[
    'Suzuki',
    'Bmw',
  ];
  List<String> _VehicleType = <String>[
    'Bike',
    'Car',
  ];
  List<String> _FuelType = <String>[
    'Petrol',
    'Diesel',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKeyValue,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'please enter a name':null,

                  controller: VehicleNumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "vehicle number"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      items: _BrandName.map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Color(0xff11b719), fontSize: 18),
                            ),
                            value: value,
                          )).toList(),
                      onChanged: (selectedAccountType) {
                        print('$selectedAccountType');
                        setState(() {
                          selectedBrand = selectedAccountType;
                        });
                      },
                      value: selectedBrand,
                      isExpanded: false,
                      hint: Text(
                        'Choose Brand ',
                        style: TextStyle(color: Color(0xff11b719)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      items: _VehicleType.map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Color(0xff11b719), fontSize: 18),
                            ),
                            value: value,
                          )).toList(),
                      onChanged: (selectedAccountType) {
                        print('$selectedAccountType');
                        setState(() {
                          selectedVehicle = selectedAccountType;
                        });
                      },
                      value: selectedVehicle,
                      isExpanded: false,
                      hint: Text(
                        'Vehicle Type ',
                        style: TextStyle(color: Color(0xff11b719)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      items: _FuelType.map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Color(0xff11b719), fontSize: 18),
                            ),
                            value: value,
                          )).toList(),
                      onChanged: (selectedAccountType) {
                        print('$selectedAccountType');
                        setState(() {
                          selectedFuel = selectedAccountType;
                        });
                      },
                      value: selectedFuel,
                      isExpanded: false,
                      hint: Text(
                        'Fuel Type ',
                        style: TextStyle(color: Color(0xff11b719)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      String id =
                          DateTime.now().microsecondsSinceEpoch.toString();

                      firestore
                          .doc(id)
                          .set({
                            'id': id,
                            'brand': selectedBrand.toString(),
                            'fueltype': selectedFuel.toString(),
                            'number': VehicleNumber.text.toString(),
                            'vehicletype': selectedVehicle.toString(),
                          })
                          .then((value) => {
                                Navigator.pop(context),
                                debugPrint("succesful"),
                              })
                          .onError((error, stackTrace) => {});
                    },
                    child: Text(
                      "submit",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

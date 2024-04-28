import 'package:cattlefarming/Models/otherFarmsClass.dart';
import 'package:flutter/material.dart';

class ViewOtherFarmsScreen extends StatefulWidget {
  const ViewOtherFarmsScreen({super.key});

  @override
  State<ViewOtherFarmsScreen> createState() => _ViewOtherFarmsScreenState();
}

class _ViewOtherFarmsScreenState extends State<ViewOtherFarmsScreen> {
  List<OtherFarmRecord> otherFarmList = [
    OtherFarmRecord(
        FarmName: 'Farm 1',
        managerName: 'Ali Hassan',
        contact: '03123456789',
        totalCattles: 112),
    OtherFarmRecord(
        FarmName: 'Farm 2',
        managerName: 'Asad Abbas',
        contact: '03052567893',
        totalCattles: 140),
    OtherFarmRecord(
        FarmName: 'Farm 3',
        managerName: 'Azhar Iqbal',
        contact: '03336436757',
        totalCattles: 65),
  ];

  List<String> farmItems = [
    'Farm 1',
    'Farm 2',
    'Farm 3',
  ];

  ///bool isFarmSelected = false;
  String? farmSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    farmSelected = farmItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "View Other Farm",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 40),
          child: Container(
            width: 280,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: const Color(0xFF02B7C8)),
            ),
            child: Center(
              child: SizedBox(
                width: 220,
                child: DropdownButton(
                  value: farmSelected,
                  underline: SizedBox(),
                  hint: Text("Select Farm"),
                  items: farmItems.map((String option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (newSelectedVal) {
                    setState(() {
                      this.farmSelected = newSelectedVal!;
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ),
        farmSelected != null
            ? Container(
                child: OtherFarmRecordWidget(
                  otherFarmList.firstWhere(
                    (record) => record.FarmName == farmSelected,
                  ),
                ),
              )
            : Center(
                child: Text('Select a farm'),
              ),
      ]),
    );
  }
}

class OtherFarmRecordWidget extends StatelessWidget {
  final OtherFarmRecord record;

  OtherFarmRecordWidget(this.record);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 40),
          child: Text(
            record.FarmName,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: Container(
            width: 340,
            height: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 3),
              ],
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 10),
                    child: Text(
                      'Manager Name:     ${record.managerName}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Contact No:           ${record.contact}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Text(
                    'Total Cattle:          ${record.totalCattles}',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/customerClass.dart';

import 'package:cattlefarming/Screens/addCustomers.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewCustomersScreen extends StatefulWidget {
  const ViewCustomersScreen({super.key});

  @override
  State<ViewCustomersScreen> createState() => _ViewCustomersScreenState();
}

class _ViewCustomersScreenState extends State<ViewCustomersScreen> {
  TextEditingController namecon = TextEditingController();
  ApiHandler apiHandler = ApiHandler();

  List<CustomerRecord> records = [];

  // @override
  // void initState() {
  //   super.initState();

  //   fetchCustomer(); // Fetch weights initially
  // }

  // Future<void> fetchCustomer() async {
  //   records = await apiHandler.getAllCustomers();
  //   setState(() {});
  // }
  // // Future<void> fetchCustomer() async {
  // //   if (namecon.text.isNotEmpty) {
  // //     setState(() async {
  // //       records = await apiHandler.getCustomerByName(namecon.text);
  // //     });
  // //   } else {
  // //     records = await apiHandler.getAllCustomers();
  // //   }
  // //   setState(() {}); // Update the UI after fetching weights
  // // }

  @override
  void initState() {
    super.initState();
    fetchCustomer(); // Fetch weights initially

    // Add a listener to the TextEditingController
    namecon.addListener(() {
      // Call the filter function whenever text changes
      filterCustomerByName(namecon.text);
    });
  }

  Future<void> fetchCustomer() async {
    records = await apiHandler.getAllCustomers();

    setState(() {});
  }

  Future<void> filterCustomerByName(String query) async {
    // Fetch records based on the provided query
    if (query.isNotEmpty) {
      records = await apiHandler.getCustomerByName(query);
    } else {
      records = await apiHandler.getAllCustomers();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "View Customers",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => WeightScreen()));

          final newRecord = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddCustomersScreen(),
            ),
          );

          // Check if a new record was returned
          if (newRecord != null && newRecord is CustomerRecord) {
            setState(() {
              records.add(newRecord);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: const Color(0xFF02B7C8))),
              child: Center(
                child: TextFormField(
                  controller: namecon,
                  decoration: InputDecoration(
                      hintText: 'Search by Name',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                      suffixIcon: namecon.text.isEmpty
                          ? IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () async {
                                records = await apiHandler
                                    .getCustomerByName(namecon.text);
                                setState(() {});
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () async {
                                // Clear the search field and reset the list
                                records = await apiHandler.getAllCustomers();
                                namecon.clear();
                                setState(() {});
                                // search('');
                              },
                            )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text('Name: ${record.name}'),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 10),
                            child: Text(
                              'Contact: ${record.contact}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17, bottom: 10),
                            child: Text(
                              'Address: ${record.address}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF039BA8)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(90, 15)),
                                ),
                                onPressed: () {},
                                child: Text('Edit'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF039BA8)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(90, 15)),
                                ),
                                onPressed: () {},
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

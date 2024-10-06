import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/customer_model.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomerController with ChangeNotifier {
  final _database = FirebaseDatabase.instance.ref().child('customers');
  final List<Customer> _customers = [];

  List<Customer> get customers => _customers;
  int get totalCustomers => _customers.length;

  // Fetch customers from Realtime Database
  Future<void> fetchCustomers() async {
    _customers.clear();
    DatabaseEvent event = await _database.once(); // Fetch the event of the data
    DataSnapshot snapshot = event.snapshot;
    if (snapshot.exists) {
      // Check if the snapshot contains data
      Map<dynamic, dynamic> customersMap = snapshot.value as Map<dynamic, dynamic>;
      customersMap.forEach((key, value) {
        _customers.add(Customer(
          id: key,
          name: value['name'],
          phone: value['phone'],
          address: value['address'],
          fatherName: value['fatherName'],
        ));
      });
    } else {
      print('No customers found.');
    }

    notifyListeners(); // Notify listeners of state changes
  }

  // Add customer to Realtime Database
  Future<void> addCustomer(String name, String fatherName, String phone, String address) async {
    await _database.push().set({
      'name': name,
      'fatherName': fatherName,
      'phone': phone,
      'address': address,
    });
    await fetchCustomers(); // Refresh list
  }

  // Delete customer from Realtime Database
  Future<void> deleteCustomer(String id) async {
    await _database.child(id).remove();
    await fetchCustomers(); // Refresh list
  }

  // Update customer in Realtime Database
  Future<void> updateCustomer(String id, String name, String fatherName, String phone, String address) async {
    await _database.child(id).update({
      'name': name,
      'fatherName': fatherName,
      'phone': phone,
      'address': address,
    });
    await fetchCustomers(); // Refresh list
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/customer_controller.dart';

class AddCustomerView extends StatelessWidget {
  final _nameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    final customerController = Provider.of<CustomerController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
        backgroundColor: const Color(0xFF3492eb),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _fatherNameController,
              decoration: const InputDecoration(labelText: "Father's Name"),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3492eb)),
              onPressed: () {
                customerController.addCustomer(
                  _nameController.text,
                  _fatherNameController.text,
                  _phoneController.text,
                  _addressController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Add Customer'),
            ),
          ],
        ),
      ),
    );
  }
}

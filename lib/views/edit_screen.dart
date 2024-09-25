import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/customer_controller.dart';
import '../models/customer_model.dart';

class EditScreen extends StatefulWidget {
  final Customer customer;
  const EditScreen({super.key, required this.customer});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _nameController;
  late TextEditingController _fatherNameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with current customer data
    _nameController = TextEditingController(text: widget.customer.name);
    _fatherNameController = TextEditingController(text: widget.customer.fatherName);
    _phoneController = TextEditingController(text: widget.customer.phone);
    _addressController = TextEditingController(text: widget.customer.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _fatherNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _updateCustomer() {
    final customerController = Provider.of<CustomerController>(context, listen: false);
    customerController.updateCustomer(
      widget.customer.id,
      _nameController.text,
      _fatherNameController.text,
      _phoneController.text,
      _addressController.text,
    );
    Navigator.pop(context); // Close the edit screen after updating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Customer'),
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
              decoration: const InputDecoration(labelText: 'Father Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateCustomer,
              child: const Text('Update Customer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3492eb),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




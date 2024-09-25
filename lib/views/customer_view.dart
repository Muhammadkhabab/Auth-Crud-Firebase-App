import 'package:crud_sample/views/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/customer_controller.dart';
import '../models/customer_model.dart';

class ViewCustomersView extends StatefulWidget {
  const ViewCustomersView({super.key});

  @override
  State<ViewCustomersView> createState() => _ViewCustomersViewState();
}

class _ViewCustomersViewState extends State<ViewCustomersView> {
  @override
  void initState() {
    super.initState();
    // Fetch the customers when the view initializes
    Future.microtask(() {
      final customerController = Provider.of<CustomerController>(context, listen: false);
      customerController.fetchCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final customerController = Provider.of<CustomerController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer List'),
        backgroundColor: const Color(0xFF3492eb),
      ),
      body: Consumer<CustomerController>(
        builder: (context, controller, _) {
          if (controller.customers.isEmpty) {
            return const Center(
              child: Text('No Customers added'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.customers.length,
              itemBuilder: (context, index) {
                final customer = controller.customers[index];
                return GestureDetector(
                  onTap: () {
                    _showCustomerOptions(context, customer);
                  },
                  child: ListTile(
                    title: Text(customer.name),
                    subtitle: Text(customer.phone),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _showCustomerOptions(BuildContext context, Customer customer) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context); // Close the modal
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditScreen(customer: customer),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () {
                final customerController = Provider.of<CustomerController>(context, listen: false);
                customerController.deleteCustomer(customer.id);
                Navigator.pop(context); // Close the modal
              },
            ),
          ],
        );
      },
    );
  }
}

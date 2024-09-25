import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/customer_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late CustomerController customerController;

  @override
  void initState() {
    super.initState();
    // Initialize the customer controller
    customerController = Provider.of<CustomerController>(context, listen: false);
    // Fetch the initial customer data
    customerController.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color(0xFF3492eb),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CustomerController>(
              builder: (context, controller, _) {
                return Text(
                  'Total Customers: ${controller.totalCustomers}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3492eb)),
              onPressed: () {
                Navigator.pushNamed(context, '/viewCustomers');
              },
              child: const Text('View Customers'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3492eb),
        onPressed: () async {
          // Wait for the result of the AddCustomerView
          await Navigator.pushNamed(context, '/addCustomer');
          // After returning from the AddCustomerView, fetch updated customers
          await customerController.fetchCustomers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

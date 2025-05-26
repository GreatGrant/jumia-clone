import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentlySearchedScreen extends StatelessWidget {
  const RecentlySearchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recently Searched')),
      body: const Center(child: Text('Recently Searched Items')),
    );
  }
}


// Placeholder for AddressBookScreen
class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Address Book')),
      body: const Center(child: Text('Manage Addresses')),
    );
  }
}
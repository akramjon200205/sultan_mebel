import 'package:flutter/material.dart';

class ClientsManagmentsPage extends StatefulWidget {
  const ClientsManagmentsPage({super.key});

  @override
  State<ClientsManagmentsPage> createState() => _ClientsManagmentsPageState();
}

class _ClientsManagmentsPageState extends State<ClientsManagmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
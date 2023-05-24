import 'package:flutter/material.dart';

class InfoUserScreen extends StatefulWidget {
  const InfoUserScreen({super.key});

  @override
  State<InfoUserScreen> createState() => _InfoUserScreenState();
}

class _InfoUserScreenState extends State<InfoUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(80, 38, 0, 255),
              Color.fromARGB(80, 255, 0, 0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

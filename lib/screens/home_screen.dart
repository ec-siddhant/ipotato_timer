import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 31),
                child: Text(
                  'Potato Timer',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: ListView(
        children: const [],
      ),
    ));
  }
}

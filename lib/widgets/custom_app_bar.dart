import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;

  const CustomAppBar({Key? key, required this.title, this.actions})
      : preferredSize = const Size.fromHeight(100),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      flexibleSpace: Container(
        color: Colors.orange,
        child: Column(
          children: [
            Spacer(),
            Text('4'),
          ],
        ),
      ),
    );
  }
}

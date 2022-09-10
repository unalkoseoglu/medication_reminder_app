import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(BuildContext context,
      {Key? key,
      required String title,
      required Widget child,
      required IconData icon})
      : super(
            key: key,
            iconTheme: const IconThemeData(color: Colors.black, size: 40),
            title: Text(title),
            leading: IconButton(
              icon: Icon(icon),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 50,
            centerTitle: true,
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 5),
                child: FittedBox(child: child),
              )
            ],
            elevation: 0,
            backgroundColor: Colors.transparent);
}

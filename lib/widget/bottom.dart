import 'package:flutter/material.dart';

void showBottomBar(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          children: [
            Text("hello")
          ],
        ),
      );
    },
  );
}

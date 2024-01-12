import 'package:flutter/material.dart';
import 'package:openwaether/widget/bottom.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Manage cities",
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          actions: [
            PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text("Edit",),
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height * 0.09,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Surat",
                    style: TextStyle(fontSize: 20),
                  ),
                  Column(
                    children: [
                      Text(
                        "31`",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Haze",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomBar(context);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

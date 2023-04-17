import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const IconButton(
              onPressed: null, icon: Icon(Icons.arrow_back_ios)),
          title: const Text('NOTIFICATIONS',
              style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            controller: null,
            tabs: [
              Tab(child: Text('General')),
              Tab(
                child: Text('My Events'),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            //for first tab
            height: 400,
            color: Colors.red,
          ),
          Container(
            //for second tab
            height: 400,
            color: Colors.green,
          )
        ]));
  }
}

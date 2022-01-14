import 'dart:developer';

import 'package:demo_app/firebase/firebase_newspapaer.dart';
import 'package:demo_app/model/paper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<NewsPaper> newsPaper = [
  //   NewsPaper(
  //       image: 'assets/images/image1.jpeg',
  //       title: 'Huose may balk at tax bill edits',
  //       description: 'Huose may balk at tax bill edits',
  //       date: '6m ago'),
  //   NewsPaper(
  //       image: 'assets/images/image2.jpeg',
  //       title: 'Huose may balk at tax bill edits',
  //       description: 'Huose may balk at tax bill edits',
  //       date: '6m ago'),
  //   NewsPaper(
  //       image: 'assets/images/image3.jpeg',
  //       title: 'Huose may balk at tax bill edits',
  //       description: 'Huose may balk at tax bill edits',
  //       date: '6m ago'),
  //   NewsPaper(
  //       image: 'assets/images/image2.jpeg',
  //       title: 'Huose may balk at tax bill edits',
  //       description: 'Huose may balk at tax bill edits',
  //       date: '6m ago'),
  //   NewsPaper(
  //       image: 'assets/images/image1.jpeg',
  //       title: 'Huose may balk at tax bill edits',
  //       description: 'Huose may balk at tax bill edits',
  //       date: '6m ago'),
  //   NewsPaper(
  //       image: 'assets/images/image3.jpeg',
  //       title: 'Huose may balk at tax bill edits',
  //       description: 'Huose may balk at tax bill edits',
  //       date: '6m ago'),
  // ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // log('message' + FirebaseNewsPaper.readNewPaper().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.drag_handle_rounded),
        title: const Text(
          'Latest',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.notification_important),
        ],
      ),
      body: _buildListviewNewspaper(),
    );
  }

  Widget _buildListviewNewspaper() {
    return SingleChildScrollView(
        child: StreamBuilder<List<NewsPaper>>(
      stream: FirebaseNewsPaper.readNewPaper(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const SizedBox(height: 30),
              ...List.generate(snapshot.data!.length, (index) {
                NewsPaper newsPaper = snapshot.data![index];
                log('message' + newsPaper.image);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                newsPaper.image,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(newsPaper.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 30),
                              Text(newsPaper.description,
                                  style: const TextStyle(color: Colors.grey)),
                              const SizedBox(height: 20),
                              Text(newsPaper.date,
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      )),
                );
              }),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

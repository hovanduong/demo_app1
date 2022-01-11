import 'package:demo_app/model/paper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsPaper> newsPaper = [
    NewsPaper(
        image: 'assets/images/image1.jpeg',
        title: 'Huose may balk at tax bill edits',
        description: 'Huose may balk at tax bill edits',
        date: '6m ago'),
    NewsPaper(
        image: 'assets/images/image2.jpeg',
        title: 'Huose may balk at tax bill edits',
        description: 'Huose may balk at tax bill edits',
        date: '6m ago'),
    NewsPaper(
        image: 'assets/images/image3.jpeg',
        title: 'Huose may balk at tax bill edits',
        description: 'Huose may balk at tax bill edits',
        date: '6m ago'),
    NewsPaper(
        image: 'assets/images/image2.jpeg',
        title: 'Huose may balk at tax bill edits',
        description: 'Huose may balk at tax bill edits',
        date: '6m ago'),
    NewsPaper(
        image: 'assets/images/image1.jpeg',
        title: 'Huose may balk at tax bill edits',
        description: 'Huose may balk at tax bill edits',
        date: '6m ago'),
    NewsPaper(
        image: 'assets/images/image3.jpeg',
        title: 'Huose may balk at tax bill edits',
        description: 'Huose may balk at tax bill edits',
        date: '6m ago'),
  ];
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
    return ListView.builder(
      itemCount: newsPaper.length,
      itemBuilder: (_, index) {
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
                      child: Image.asset(
                        newsPaper[index].image,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(newsPaper[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 30),
                      Text(newsPaper[index].description,
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 20),
                      Text(newsPaper[index].date,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    _buildSettings(),
                    const SizedBox(height: 30),
                    _buildAvatar(),
                    const SizedBox(height: 20),
                    _buildName(),
                    const SizedBox(height: 20),
                    _buildLocation(),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    _buildItem(
                        icon: Icons.favorite, name: 'My tickets', check: true),
                    _buildItem(
                        icon: Icons.person,
                        name: 'Profile settings',
                        check: true),
                    _buildItem(
                        icon: Icons.payment, name: 'Payment', check: true),
                    _buildItem(
                        icon: Icons.notifications,
                        name: 'Notification',
                        check: false),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildItem(
      {required IconData icon, required String name, required bool check}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Icon(
                  icon,
                  color: Colors.blue,
                  size: 15,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey[500],
                size: 15,
              ),
            ],
          ),
          check == true
              ? Padding(
                  padding: const EdgeInsets.only(left: 38, top: 15),
                  child: Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Container(
      height: 50,
      width: 150,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.favorite,
            size: 15,
            color: Colors.blue,
          ),
          SizedBox(width: 5),
          Text('Paris, France')
        ],
      ),
    );
  }

  Widget _buildName() {
    return const Text('Marvin Mckinney',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
  }

  Widget _buildSettings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        image: DecorationImage(
          image: NetworkImage(
              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

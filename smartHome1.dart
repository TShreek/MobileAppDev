import 'package:flutter/material.dart';

void main() {
  runApp(SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Control',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Home Control'),
      ),
      drawer: AppDrawer(),
      body: _tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AboutUsScreen when the floating action button is clicked
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        },
        child: Icon(Icons.info),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Shamac Belliappa'),
            accountEmail: Text('123@msrit.edu'),
            currentAccountPicture: Image.network(
              'https://static.statusqueen.com/dpimages/thumbnail/dp_image48-1093.jpg',
              width: 90.0,
              height: 90.0,
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('FAQ'),
            onTap: () {
              // Handle the FAQ action
              Navigator.pop(context);
              // You can navigate to the FAQ screen or perform the desired action
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () {
              // Handle the Feedback action
              Navigator.pop(context);
              // You can navigate to the Feedback screen or perform the desired action
            },
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to your Smart Home!',
            style: TextStyle(fontSize: 24),
          ),
          
          RoomCard(name: 'Living Room'),
          RoomCard(name: 'Bedroom'),
        ],
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String name;

  RoomCard({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchRow(label: 'Bulb 1', icon: Icons.lightbulb),
          SwitchRow(label: 'Bulb 2', icon: Icons.lightbulb),
          FanControl(),
        ],
      ),
    );
  }
}

class SwitchRow extends StatefulWidget {
  final String label;
  final IconData icon;

  SwitchRow({required this.label, required this.icon});

  @override
  _SwitchRowState createState() => _SwitchRowState();
}


class _SwitchRowState extends State<SwitchRow> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.label),
      trailing: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
      ),
    );
  }
}

class FanControl extends StatefulWidget {
  @override
  _FanControlState createState() => _FanControlState();
}

class _FanControlState extends State<FanControl> {
  double fanSpeed = 0.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.air),
      title: Text('Fan'),
      subtitle: Column(
        children: <Widget>[
          Text('Speed: ${fanSpeed.toStringAsFixed(1)}'),
          Slider(
            value: fanSpeed,
            onChanged: (value) {
              setState(() {
                fanSpeed = value;
              });
            },
            min: 0,
            max: 5,
            divisions: 5,
          ),
        ],
      ),
    );
  }
}


          class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isAutoAddDeviceEnabled = false;
  bool isDeviceUpdateEnabled = true;
  bool isAppNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Settings',
            style: TextStyle(fontSize: 24),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add devices Automatically'),
            trailing: Switch(
              value: isAutoAddDeviceEnabled,
              onChanged: (value) {
                setState(() {
                  isAutoAddDeviceEnabled = value;
                  
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Auto Software Update'),
            trailing: Switch(
              value: isDeviceUpdateEnabled,
              onChanged: (value) {
                setState(() {
                  isDeviceUpdateEnabled = value;
                  // Implement your device update logic here
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('App Notifications'),
            trailing: Switch(
              value: isAppNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  isAppNotificationsEnabled = value;
                  // Implement your app notifications logic here
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              // Handle the "About Us" action
             Navigator.push(
context,
MaterialPageRoute(builder: (context) => AboutUs()),
);// Close the drawer
              // You can navigate to the "About Us" screen or perform the desired action
            },), ], ),); }}
class AboutUs extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('About Us'),
backgroundColor: Colors.orange,
),
body: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('About Us\n\nShreekrishna T\n\nHello! Im Shreekrishna T, a second-year computer science student. I have a strong passion for technology and software development. I am always eager to learn and apply my knowledge to solve real-world problems.\n\n*Areas of Interest:*\n- Mobile App Development\n- Web Development\n- Data Science\n\nI am constantly exploring new technologies and improving my coding skills. When Im not coding, you can find me reading tech blogs, playing video games, or enjoying a good cup of coffee.\n'),
Text('---\n\nShamac M Belliappa\n\nGreetings! Im Shamac M Belliappa, also a second-year computer science student. I am enthusiastic about the world of computer science and its endless possibilities. My goal is to contribute to the field through innovative solutions.\n\n*Areas of Interest:*\n- Artificial Intelligence\n- Cybersecurity\n- Software Engineering\n\nI believe in the power of collaboration and am always excited to work on exciting projects. In my free time, I enjoy hacking away at coding challenges, exploring the latest tech trends, and playing the guitar.\n\n---\n\nWe are both dedicated to our studies and are actively involved in various coding competitions and open-source projects. We are looking forward to applying our knowledge to make a positive impact on the world of technology and computer science.\n\nFeel free to reach out to us for collaboration, project ideas, or just to chat about the latest tech developments. We are always up for a good tech conversation!'),
],),);}}

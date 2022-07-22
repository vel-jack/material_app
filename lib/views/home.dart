import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.app_shortcut),
              title: Text('New Scaffold'),
              trailing: Icon(Icons.add),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.smartphone),
              title: Text('HomePage'),
            ),
          ],
        ),
      ),
    );
  }
}

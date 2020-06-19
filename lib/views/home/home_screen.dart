import 'package:ashtree/services/web_api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:dio/dio.dart'; // Import the Counter

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
    await Api()
        .login(1592392597014, 'nonce1234567', '990460889@qq.com', 'Iamaman.');
    // await Api().listSets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                'Home',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

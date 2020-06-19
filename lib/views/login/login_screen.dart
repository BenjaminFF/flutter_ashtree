import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Import the Counter

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Counter'),
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
                'Login',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: widget.counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

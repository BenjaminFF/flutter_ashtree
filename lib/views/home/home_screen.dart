import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:ashtree/services/web_api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    // var res = await Api().login(new DateTime.now().millisecondsSinceEpoch,
    //     'nonce12435678', '990460889@qq.com', 'Iamaman.');
    // String uid = res['data']['uid'], token = res['data']['token'];
    // String session ="uid=${uid};${uid}=${token}";
    // await SharedPreferanceService().setSession(session);
    var res = await Api().listSets();
    print(res['data']);
    // List<String> session=await SharedPreferanceService().getSession();
    // print(session);
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
                'Hoe',
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

import 'package:ashtree/models/home/home_store.dart';
import 'package:ashtree/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeStore = HomeStore();
  @override
  void initState() {
    super.initState();
    _homeStore.onInit();
  }

  renderInput() {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 48),
      child: TextFormField(
        maxLength: 30,
        maxLines: 1,
        style: TextStyle(fontSize: 16.0),
        onChanged: (String value) {
          _homeStore.onChanged(value: value);
        },
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 1),
          helperStyle: TextStyle(height: 1),
          helperText: '',
          counterText: '',
          filled: true,
          fillColor: Color(0xffebeef5),
          contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  renderListItemCircle(item) {
    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: item['color'],
        shape: BoxShape.circle,
      ),
      child: Text(
        item['name'].substring(0, 1).toUpperCase(),
        style: TextStyle(
            fontSize: 26, color: Colors.white, fontWeight: FontWeight.w300),
      ),
    );
  }

  renderListItemIntro(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            item['name'],
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, top: 4),
          child: Text(
            item['description'].length > 60
                ? item['description'].substring(0, 60) + '...'
                : item['description'],
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }

  renderListItem(index) {
    List sets = _homeStore.curSets;
    return Container(
      margin: EdgeInsets.only(left: 8, bottom: 16, right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          await Navigator.pushNamed(context, Router.learnRoute,
              arguments: LearnScreenArguments(
                sets[index]['sid'],
                sets[index]['origin_id'],
              ));
        },
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: renderListItemCircle(sets[index]),
              ),
              Expanded(
                flex: 10,
                child: renderListItemIntro(sets[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderList() {
    List sets = _homeStore.curSets;
    return sets != null
        ? Flexible(
            child: ListView.builder(
              itemCount: sets.length,
              itemBuilder: (BuildContext context, int index) {
                return renderListItem(index);
              },
            ),
          )
        : Center(
            child: Text('加载中...'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        },
        child: Observer(
          builder: (_) => SafeArea(
            child: Column(
              children: [renderInput(), renderList()],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await SharedPreferanceService().setSession('');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

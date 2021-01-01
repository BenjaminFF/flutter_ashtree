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
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (String value) {
          _homeStore.onChanged(value: value);
        },
        decoration: InputDecoration(
          helperText: '',
          counterText: '',
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
            style: Theme.of(context).textTheme.headline6,
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
      margin: EdgeInsets.only(left: 8, bottom: 20, right: 8),
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
            child: RefreshIndicator(
              child: ListView.builder(
                itemCount: sets.length,
                itemBuilder: (BuildContext context, int index) {
                  return renderListItem(index);
                },
              ),
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1), () {
                  _homeStore.onInit();
                  return null;
                });
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
          await Navigator.pushNamed(context, Router.builderRoute);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

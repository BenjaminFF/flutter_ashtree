import 'package:ashtree/components/button/button_comp.dart';
import 'package:ashtree/models/pagecomps/wordcomb/wordcomb_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class WordComb extends StatefulWidget {
  const WordComb({
    @required this.term,
    @required this.definition,
    @required this.callBack,
    @required this.row,
  });

  final String term, definition;
  final int row;
  final Function(int) callBack;

  @override
  _MultichoiceState createState() => _MultichoiceState();
}

class _MultichoiceState extends State<WordComb> {
  final _mcStore = WordCombStore();
  @override
  void initState() {
    super.initState();
    _mcStore.onInit(widget.term, widget.definition, widget.row);
  }

  getDefinitionColor() {
    switch (_mcStore.status) {
      case 0:
        return null;
      case 1:
        return Theme.of(context).colorScheme.primary;
      case 2:
        return Theme.of(context).colorScheme.error;
    }
  }

  renderUS() {
    List usArr = _mcStore.usArr;
    List<Widget> children = List<Widget>();
    usArr.forEach((item) {
      children.add(
        Container(
          width: item['text'] == "" || item['isSpace'] ? 20 : null,
          margin: !item['isSpace'] && item['text'] == ""
              ? EdgeInsets.only(left: 5, right: 5)
              : null,
          child: Text(
            item['text'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: getDefinitionColor(),
            ),
          ),
          decoration: item['text'] == "" && !item['isSpace']
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.5,
                    ),
                  ),
                )
              : null,
        ),
      );
    });
    return GestureDetector(
      onTap: () {
        _mcStore.retreat();
        setState(() {});
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  renderDefinition() {
    return Container(
      margin: EdgeInsets.only(bottom: 32, top: 32),
      child: Text(
        widget.definition,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: getDefinitionColor(),
        ),
      ),
    );
  }

  renderSG() {
    List sgArr = _mcStore.sgArr;
    return sgArr != null
        ? Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: Container(
                width: 260,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: sgArr.length,
                  itemBuilder: (context, index) {
                    return Button(
                      margin: EdgeInsets.only(top: 0),
                      buttonType: _mcStore.getButtonType(index),
                      text: sgArr[index]['text'],
                      onTap: () {
                        _mcStore.onItemTap(index, widget.callBack);
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ),
          )
        : Center(
            child: Text(
              '加载中...',
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Observer(
        builder: (_) => SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                renderUS(),
                renderDefinition(),
                renderSG(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

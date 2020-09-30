import 'package:ashtree/components/button/button_comp.dart';
import 'package:ashtree/models/pagecomps/multichoice/multichoice_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Multichoice extends StatefulWidget {
  const Multichoice({
    @required this.term,
    @required this.definition,
    @required this.otherOptions,
    @required this.callBack,
  });

  final String term, definition;
  final List otherOptions;
  final Function(int) callBack;

  @override
  _MultichoiceState createState() => _MultichoiceState();
}

class _MultichoiceState extends State<Multichoice> {
  final _mcStore = MultiChoiceStore();
  @override
  void initState() {
    super.initState();
    _mcStore.onInit(
      widget.term,
      widget.definition,
      widget.otherOptions,
    );
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

  renderOptions() {
    List options = _mcStore.options;
    return options != null
        ? Flexible(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return Button(
                    margin: EdgeInsets.only(top: 16),
                    buttonType: _mcStore.getButtonType(index),
                    text: options[index]['text'],
                    onTap: () {
                      _mcStore.onItemTap(index, widget.callBack);
                    },
                  );
                },
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
              children: [
                renderDefinition(),
                renderOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

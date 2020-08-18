import 'package:ashtree/models/pagecomps/multichoice/multichoice_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Import the Counter

class Multichoice extends StatefulWidget {
  const Multichoice({
    @required this.term,
    @required this.definition,
    @required this.otherOptions,
    @required this.callBack,
  });

  final String term, definition;
  final List otherOptions;
  final Function callBack;

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

  renderDefinition() {
    return Container(
      child: Text(
        widget.definition,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }

  renderOptions() {
    List options = _mcStore.options;
    return options != null
        ? Flexible(
            child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 1),
                        blurRadius: 4.0)
                  ],
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black26
                  ),
                  color: Colors.white,
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(4.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        options[index]['text'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        : Center(
            child: Text(
              '加载中...',
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, left: 16, right: 16),
            child: Expanded(
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
      ),
    );
  }
}

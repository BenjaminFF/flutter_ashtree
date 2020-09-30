import 'package:ashtree/components/pagecomps/multichoice/multichoice_comp.dart';
import 'package:ashtree/components/pagecomps/wordcomb/wordcomb_comp.dart';
import 'package:ashtree/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LearnScreen extends StatefulWidget {
  final int sid;
  final String origin_id;

  const LearnScreen({
    Key key,
    @required this.sid,
    @required this.origin_id,
  }) : super(key: key);

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => SafeArea(
          child: WordComb(
            term: 'answer correct',
            definition: 'dlkasfjasjkf asdlfkjasfjlkasjkfakjsfjk  adsklfjasjf',
            row: 3,
            callBack: (status) {
              print(status);
            },
          ),
        ),
      ),
    );
  }
}

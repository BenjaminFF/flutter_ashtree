import 'package:ashtree/components/pagecomps/Multichoice.dart';
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
          child: Multichoice(
            term: 'answer',
            definition: 'dlkasfjasjkf asdlfkjasfjlkasjkfakjsfjk  adsklfjasjf',
            otherOptions: ['term1', 'term2', 'term3'],
            callBack: null,
          ),
        ),
      ),
    );
  }
}

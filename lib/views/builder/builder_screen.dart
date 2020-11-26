import 'package:ashtree/models/builder/builder_store.dart';
import 'package:ashtree/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen();

  @override
  _BuilderScreenState createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  final _builderStore = BuilderStore();
  @override
  void initState() {
    super.initState();
    // _builderStore.onInit();
  }

  renderInput({String type, int index}) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 48),
      child: TextFormField(
        maxLength: type == 'term' ? 30 : 255,
        maxLines: type == 'term' ? 1 : 5,
        minLines: type == 'term' ? 1 : 2,
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: (String value) {
          // _homeStore.onChanged(value: value);
        },
        decoration: InputDecoration(
          helperText: '',
          counterText: '',
        ),
      ),
    );
  }

  renderItemBuilder() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => SafeArea(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

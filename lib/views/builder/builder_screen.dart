import 'package:ashtree/models/builder/builder_store.dart';
import 'package:ashtree/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:form_field_validator/form_field_validator.dart';

class BuilderScreen extends StatefulWidget {
  const BuilderScreen();

  @override
  _BuilderScreenState createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  final _builderStore = BuilderStore();
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _builderStore.onInit();
  }

  renderInput({String type, int index, String id}) {
    var term = _builderStore.terms[index];
    return Container(
      padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: type == 'term' ? 16 : 12,
          bottom: type == 'term' ? 0 : 16),
      child: TextFormField(
        key: ValueKey(type + id),
        focusNode: type == 'term' ? term['termFocus'] : term['defFocus'],
        maxLength: type == 'term' ? 30 : 255,
        maxLines: type == 'term' ? 1 : 5,
        minLines: type == 'term' ? 1 : 2,
        // validator: RequiredValidator(errorText: '请输入文本'),
        style: Theme.of(context).textTheme.bodyText2,
        controller: new TextEditingController(
            text: type == 'term' ? term['term'] : term['definition']),
        onChanged: (String value) {
          _builderStore.onValueChange(type, index, value);
        },
        decoration: InputDecoration(
          helperText: null,
          counterText: '',
        ),
      ),
    );
  }

  slideItem(int index, BuildContext context) {
    var term =
        index < _builderStore.terms.length ? _builderStore.terms[index] : null;
    return term != null
        ? Slidable(
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 0.25,
            child: Card(
              elevation: 3,
              margin: EdgeInsets.only(
                  left: 16, right: 16, bottom: 24, top: index == 0 ? 32 : 0),
              child: Column(
                children: <Widget>[
                  renderInput(
                      type: 'term', index: index, id: term['id'].toString()),
                  renderInput(
                    type: 'definition',
                    index: index,
                    id: term['id'].toString(),
                  ),
                ],
              ),
            ),
            secondaryActions: <Widget>[
              Builder(
                builder: (_) => Container(
                  child: FloatingActionButton(
                    onPressed: () async {
                      listKey.currentState.insertItem(
                        index + 1,
                        duration: const Duration(milliseconds: 500),
                      );
                      _builderStore.insertItem(index + 1);
                      Slidable.of(_).close();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Builder(
                builder: (_) => Container(
                  child: FloatingActionButton(
                    onPressed: () async {
                      Slidable.of(_).close();
                      listKey.currentState.removeItem(
                        index,
                        (_, animation) =>
                            listAnim(context, index, animation, term),
                        duration: const Duration(milliseconds: 500),
                      );
                      _builderStore.removeItem(index);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          )
        : null;
  }

  listAnim(BuildContext context, int index, animation, term) {
    return SizeTransition(
      key: ValueKey(term['id']),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: slideItem(index, context),
    );
  }

  renderItemBuilder() {
    List terms = _builderStore.terms;
    return Flexible(
      child: AnimatedList(
        key: listKey,
        initialItemCount: terms.length,
        itemBuilder: (context, index, animation) {
          return listAnim(context, index, animation, terms[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => SafeArea(
          child: Column(
            children: [
              Form(
                key: _formKey,
                autovalidate: true,
                child: renderItemBuilder(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // _formKey.currentState.validate();
          _builderStore.onValidate();
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _builderStore.disposeFocus();
    super.dispose();
  }
}

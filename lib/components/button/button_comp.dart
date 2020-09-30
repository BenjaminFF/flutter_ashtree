import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ButtonType {
  Success,
  Error,
  Plain,
  Primary,
  Active,
}

bool onTapDowned = false;

class Button extends StatefulWidget {
  const Button({
    Key key,
    this.buttonType = ButtonType.Plain,
    this.text,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final ButtonType buttonType;
  final String text;
  final GestureTapCallback onTap;
  final EdgeInsets margin;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  renderButton(context) {
    Color splashColor, highlightColor, backgroundColor, textColor;
    switch (widget.buttonType) {
      case ButtonType.Plain:
        splashColor = Colors.transparent;
        highlightColor = Theme.of(context).colorScheme.secondary;
        backgroundColor = Colors.white;
        break;
      case ButtonType.Active:
        splashColor = Colors.transparent;
        highlightColor = Theme.of(context).colorScheme.secondary;
        backgroundColor = Theme.of(context).colorScheme.secondary;
        break;
      case ButtonType.Success:
        splashColor = Colors.transparent;
        highlightColor = Colors.transparent;
        backgroundColor = Theme.of(context).colorScheme.primary;
        textColor = Colors.white;
        break;
      case ButtonType.Error:
        splashColor = Colors.transparent;
        highlightColor = Colors.transparent;
        backgroundColor = Theme.of(context).colorScheme.error;
        textColor = Colors.white;
        break;
      case ButtonType.Primary:
        splashColor = Colors.transparent;
        highlightColor = Colors.transparent;
        backgroundColor = Theme.of(context).colorScheme.primary;
        textColor = Colors.white;
        break;
      default:
        splashColor = Colors.transparent;
        highlightColor = Colors.grey.withOpacity(0.1);
        backgroundColor = Colors.white;
        textColor = Colors.white;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(4.0),
      child: Ink(
        child: InkWell(
          splashColor: splashColor,
          highlightColor: highlightColor,
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            setState(() {
              onTapDowned = false;
            });
            if (widget.onTap != null) {
              widget.onTap();
            }
          },
          onTapDown: (details) {
            setState(() {
              onTapDowned = true;
            });
          },
          onTapCancel: () {
            setState(() {
              onTapDowned = false;
            });
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: widget.buttonType == ButtonType.Plain
            ? Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withOpacity(!onTapDowned ? 0.05 : 0),
                width: 1.0,
              )
            : null,
        boxShadow: widget.buttonType == ButtonType.Plain && !onTapDowned
            ? [
                BoxShadow(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.02),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                )
              ]
            : null,
      ),
      child: renderButton(context),
    );
  }
}

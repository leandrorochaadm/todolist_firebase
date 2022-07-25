import 'package:flutter/material.dart';

import 'ui_state.dart';

class BasePageWidget extends StatefulWidget {
  final Widget child;
  final ValueNotifier<UIState> state;
  final String title;

  const BasePageWidget({
    Key? key,
    required this.child,
    required this.state,
    required this.title,
  }) : super(key: key);

  @override
  State<BasePageWidget> createState() => _BasePageWidgetState();
}

class _BasePageWidgetState extends State<BasePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(widget.title), centerTitle: true),
        body: Stack(
          children: [
            SafeArea(child: widget.child),
            /* if (widget.state.value is UILoadingState)
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xA8000000),
                  child: const Center(child: CircularProgressIndicator()))*/
            /* else if (widget.state.value is UIErrorState)
              ShowErrorDialog(
                context: context,
                contentText: widget.state.value.description,
              )*/
          ],
        ));
  }
}

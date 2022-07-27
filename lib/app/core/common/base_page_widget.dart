import 'package:flutter/material.dart';

import 'show_error_dialog.dart';
import 'ui_state.dart';

class BasePageWidget extends StatefulWidget {
  Widget child;
  final ValueNotifier<UIState> state;
  final String title;

  BasePageWidget({
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
  void initState() {
    widget.state.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('base ${widget.state.value}');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(widget.title), centerTitle: true),
        body: Stack(
          children: [
            SafeArea(
                child: AnimatedBuilder(
                    animation: widget.state,
                    builder: (__, _) {
                      return widget.child;
                    })),
            if (widget.state.value is UILoadingState)
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xA8000000),
                  child: const Center(child: CircularProgressIndicator()))
            else if (widget.state.value is UIErrorState)
              ShowErrorDialog(
                context: context,
                contentText: widget.state.value.description,
              )
          ],
        ));
  }
}

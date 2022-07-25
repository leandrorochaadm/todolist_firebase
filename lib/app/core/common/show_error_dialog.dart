import 'package:flutter/material.dart';

class ShowErrorDialog extends StatelessWidget {
  final String contentText;
  final BuildContext context;
  const ShowErrorDialog(
      {Key? key, required this.contentText, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Erro'),
      content: Text(contentText),
      actions: <Widget>[
        TextButton(
            child: const Text("Fechar"),
            onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}

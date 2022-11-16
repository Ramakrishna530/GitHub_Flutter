import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  const AppErrorWidget(this.message);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          '$message',
        ),
      );
}

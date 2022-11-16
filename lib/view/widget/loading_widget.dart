import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String message;

  const LoadingWidget({this.message = "Loading..."});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 8,
            ),
            Text(
              message,
            ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.center,
        child:
            Expanded(
              child: Text('There is an Error')
            ),
      );
  }
}
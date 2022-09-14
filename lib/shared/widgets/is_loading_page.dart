import 'package:flutter/material.dart';

class IsLoadingPage extends StatelessWidget {
  const IsLoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}

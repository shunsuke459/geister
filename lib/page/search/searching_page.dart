import 'package:flutter/material.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('対戦相手を探しています...'),
      ),
    );
  }
}

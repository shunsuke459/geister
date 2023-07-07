import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final needUserRegistration = useState(false);

    Future(() async {
      final prefs = await SharedPreferences.getInstance();
      print('===');
      prefs.setString('test', 'shunsuke');
    });

    print('---');
    print(needUserRegistration.value);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final t = prefs.getString('ddd');
            print(t);
            // final document = <String, dynamic>{
            //   'name': 'test',
            //   'age': 20,
            // };
            // FirebaseFirestore.instance.collection('user').doc().set(document);
          },
          child: const Text('Test Page'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geister',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Geister'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const arrowLeft = Icon(
      Icons.arrow_back_rounded,
      color: Colors.black,
    );
    const arrowRight = Icon(
      Icons.arrow_forward_rounded,
      color: Colors.black,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: 6 * 6,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: const BorderSide(color: Colors.black, width: 1.0),
                      bottom: const BorderSide(color: Colors.black, width: 1.0),
                      top: index >= 0 && index <= 5
                          ? const BorderSide(color: Colors.black, width: 1.0)
                          : BorderSide.none,
                      left: index % 6 == 0
                          ? const BorderSide(color: Colors.black, width: 1.0)
                          : BorderSide.none,
                    ),
                  ),
                  child: Center(
                    child: index == 0 || index == 30
                        ? arrowLeft
                        : index == 5 || index == 35
                            ? arrowRight
                            : Container(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

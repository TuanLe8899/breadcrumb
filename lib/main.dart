import 'package:flutter/material.dart';

import 'breadcrumb.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        NextPage.route: (context) => const NextPage(),
        NextPage1.route: (context) => const NextPage1(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breadcrumb'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, NextPage.route);
                  breadcrumb.add(NextPage.route);
                },
                child: Text('Next Page'),
              ),
            ),
          ),
          Breadcrumb(),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  static const String route = '/NextPage';
  const NextPage({Key? key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breadcrumb'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, NextPage1.route);
                      breadcrumb.add(NextPage1.route);
                    },
                    child: Text('Next Page1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      breadcrumb.removeLast();
                    },
                    child: Text('Prev Page'),
                  ),
                ],
              )
            ),
          ),
          Breadcrumb(),
        ],
      ),
    );
  }
}

class NextPage1 extends StatefulWidget {
  static const String route = '/NextPage1';
  const NextPage1({Key? key}) : super(key: key);

  @override
  _NextPage1State createState() => _NextPage1State();
}

class _NextPage1State extends State<NextPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breadcrumb'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  breadcrumb.removeLast();
                },
                child: Text('Prev Page'),
              ),
            ),
          ),
          Breadcrumb(),
        ],
      ),
    );
  }
}




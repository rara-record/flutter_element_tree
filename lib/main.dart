import 'package:flutter/material.dart';
import 'package:flutter_element_tree/widget/fancy_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '플러터 요소 트리 살펴보기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '플러터 요소 트리 살펴보기'),
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
  int _counter = 0;
  bool _reversed = false; // 버튼을 서로 바꿀지 결정합니다.
  final List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  // 증가 버튼
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 감소 버튼
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // 초기화 버튼
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _swap();
  }

  // 버튼을 서로 바꿉니다.
  void _swap() {
    setState(() {
      _reversed = !_reversed;
    });
  }

  // Row로 전달해 화면에 표시합니다.
  List<Widget> _getFancyButtons() {
    final buttons = [
      FancyButton(
        key: _buttonKeys.first,
        onPressed: _incrementCounter,
        child: const Text('Increment'),
      ),
      FancyButton(
        key: _buttonKeys.last,
        onPressed: _decrementCounter,
        child: const Text('Decrement'),
      ),
    ];
    return _reversed ? buttons.reversed.toList() : buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _getFancyButtons(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _resetCounter, child: const Text('Reset'))
          ],
        ),
      ),
    );
  }
}

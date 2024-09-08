import 'dart:math';

import 'package:flutter/material.dart';

// 자신의 배경색을 관리하며, 버튼을 누르면 전달된 톨백을 호출한다.
class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  State<FancyButton> createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        // 자신의 색을 관리합니다.
        backgroundColor: WidgetStateProperty.all(_getColor()),
      ),
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }

  // 모든 FancyButton의 색을 관리합니다.
  Color _getColor() {
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
  }
}

// 자신의 상태를 관리하는 데 사용하는 헬퍼 메서드로 항상 다른색을 성정합니다.
// 예제를 위한 코드이며, 실제 앱에서는 사용하지 않는 것이 좋습니다.
Map<_FancyButtonState, Color> _buttonColors = {};
final _random = Random();
int next(int min, int max) => min + _random.nextInt(max - min);
List<Color> colors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.amber,
  Colors.lightBlue,
];

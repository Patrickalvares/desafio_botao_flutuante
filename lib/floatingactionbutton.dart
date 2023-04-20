import 'package:flutter/material.dart';

// Widget principal do botão animado
class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({super.key});

  @override
  ButtonAnimationState createState() => ButtonAnimationState();
}

class ButtonAnimationState extends State<ButtonAnimation> {
  bool _moveContainer = true;

  // Função para alternar a posição do container
  void _toggleContainerPosition() {
    setState(() {
      _moveContainer = !_moveContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildAnimatedPositionedContainer(context),
        ],
      ),
    );
  }

  // Widget AppBar
  AppBar _buildAppBar() {
    return AppBar(title: const Text('Exercício 1'));
  }

  // Widget Container animado e posicionado
  AnimatedPositioned _buildAnimatedPositionedContainer(BuildContext context) {
    return AnimatedPositioned(
      left: _moveContainer
          ? MediaQuery.of(context).size.width - 90
          : (MediaQuery.of(context).size.width / 2) - 100,
      top: _moveContainer ? MediaQuery.of(context).size.height - 170 : 10,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      child: _buildAnimatedGestureDetector(),
    );
  }

  // Widget GestureDetector com animação de container
  GestureDetector _buildAnimatedGestureDetector() {
    return GestureDetector(
      onTap: _toggleContainerPosition,
      child: _buildAnimatedContainer(),
    );
  }

  // Widget Container animado
  AnimatedContainer _buildAnimatedContainer() {
    return AnimatedContainer(
      width: _moveContainer ? 56 : 200,
      height: _moveContainer ? 56 : 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(_moveContainer ? 28 : 0),
      ),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}

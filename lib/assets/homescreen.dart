import 'package:desafio_botao_flutuante/expansiontile.dart';
import 'package:desafio_botao_flutuante/floatingactionbutton.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildExerciseButton(
            'Exercício 1',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ButtonAnimation(),
              ),
            ),
          ),
          _buildExerciseButton(
            'Exercício 2',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomExpansionTile(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para botão de exercício
  Widget _buildExerciseButton(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue[300],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

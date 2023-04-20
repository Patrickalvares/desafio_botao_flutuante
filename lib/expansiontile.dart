import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key});

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  final List<bool> _isExpanded = List.generate(51, (_) => false);

  // Alterna o estado expandido de um item
  void _toggleExpanded(int index) {
    setState(() {
      _isExpanded[index] = !_isExpanded[index];
    });
  }

  // Cria um ListTile com título e ícone rotativo
  Widget _buildListTile(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Meu Tile de expansão ${index + 1}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          AnimatedRotation(
            turns: _isExpanded[index] ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ],
      ),
    );
  }

  // Cria o conteúdo expandido com imagem e texto
  Widget _buildExpandedContent() {
    const expandedText =
        'Faça elevar O cosmo no seu coração Todo mal combater Despertar o poder Sua constelação Sempre irá te proteger Supera a dor e dá forças pra lutar Pegasus Fantasy Desejos a realizar Pois as asas de um coração sonhador Ninguém irá roubar Saint Seiya! Guerreiro das estrelas Saint Seiya! Nada a temer. Oh, yeah Saint Seiya! Unidos por sua força Saint Seiya! Pegasus, até vencer! Faça elevar, seu poder até o céu E enfim, encontrar sua constelação Até chegar la, nunca pense em parar Essa luta é sua, Siga sem hesitar Pegasus Fantasy Desejos em seu coração Suas asas serão para poder voar E te libertarão Saint Seiya! Guerreiro das estrelas Saint Seiya! Jamas se renderão Saint Seiya! Unidos por sua força Saint Seiya! Pegasus, até vencer! Pegasus Fantasy Desejos a realizar Pois as asas de um coração sonhador Ninguém irá roubar Saint Seiya! Guerreiro das estrelas Saint Seiya! Nada a temer. Oh, yeah Saint Seiya! Unidos por sua força Saint Seiya! Pegasus, até vencer!';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              'lib/assets/flutter-icon.png',
              height: 40,
            ),
          ),
          const Text(expandedText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 2')),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: GestureDetector(
              onTap: () => _toggleExpanded(index),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildListTile(index),
                          if (_isExpanded[index]) _buildExpandedContent(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

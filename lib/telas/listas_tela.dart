import 'package:flutter/material.dart';
import 'package:myapp/modelos/lista_modelo.dart'; // Importa o modelo da lista
import 'package:myapp/modelos/item_modelo.dart'; // Importa o modelo dos itens

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Aplicativo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // Define as rotas do aplicativo
      routes: {
        '/': (context) => InicioTela(), // Tela inicial
        '/listas': (context) => ListasTela(), // Define a rota para ListasTela
      },
    );
  }
}

// Tela de início (InicioTela)
class InicioTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Início"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/listas'); // Navega para ListasTela
          },
          child: const Text("Ir para Lista"),
        ),
      ),
    );
  }
}

// Cria a tela "ListasTela" que vai mostrar os detalhes de uma lista e seus itens
class ListasTela extends StatelessWidget {
  ListasTela({super.key});

  // Cria um exemplo de lista (como se fosse uma compra no mercado)
  final ListaModelo listaModelo = ListaModelo(
      id: "L001",
      titulo: "Mercado",
      local: "Muffato",
      descricao: null); // A descrição é null por enquanto

  // Cria uma lista de itens com dois produtos: Arroz e Feijão
  final List<ItemModelo> listaItem = [
    ItemModelo(
      id: "I001",
      item: "Arroz", // Produto
      data: "2024-09-29", // Data associada ao item
    ),
    ItemModelo(
      id: "I002",
      item: "Feijão", // Outro produto
      data: "2024-09-30", // Data associada ao item
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 255, 184, 92), // Cor de fundo amarela
      appBar: AppBar(
        // Aqui está o título da tela, com o nome e local da lista
        title: Column(
          children: [
            Text(
              listaModelo.titulo, // Título da lista (Mercado)
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22), // Negrito e tamanho maior
            ),
            Text(
              listaModelo.local, // Local da compra (Muffato)
              style: const TextStyle(fontSize: 13), // Tamanho menor do texto
            ),
          ],
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor:
            const Color.fromARGB(255, 255, 153, 122), // Cor de fundo do AppBar
        elevation: 0, // Sem sombra
        toolbarHeight: 72, // Aumenta a altura da barra
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32), // Bordas arredondadas no AppBar
          ),
        ),
        // Botão de voltar para a tela de início
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior (InicioTela)
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Foi Clicado!"); // Ação quando o botão de adicionar é clicado
        },
        child: const Icon(Icons.add), // Ícone de "+" no botão
      ),
      body: Container(
        // Aqui começa o conteúdo da tela, dentro de um Container com bordas arredondadas
        margin: const EdgeInsets.all(8), // Espaçamento nas bordas externas
        padding: const EdgeInsets.all(16.0), // Espaçamento interno (padding)
        decoration: BoxDecoration(
          color: Colors.white, // Fundo branco no container
          borderRadius: BorderRadius.circular(16), // Bordas arredondadas
        ),
        child: ListView(
          // Organiza os detalhes da lista e itens dentro de uma ListView (rolável)
          children: [
            const SizedBox(height: 8), // Pequeno espaçamento
            const Text(
              "Detalhes", // Título da seção "Detalhes"
              style: TextStyle(
                fontWeight: FontWeight.bold, // Negrito
                fontSize: 18, // Tamanho da fonte
              ),
            ),
            const SizedBox(height: 8), // Outro espacinho
            // Mostra a descrição da lista, mas como está null, mostra "Sem descrição"
            Text(listaModelo.descricao ?? "Sem descrição"),
            const Padding(
              padding: EdgeInsets.all(8.0), // Espaçamento em volta do Divider
              child: Divider(
                color: Colors.black, // Linha divisória preta
              ),
            ),
            const Text(
              "Itens", // Título da seção "Itens"
              style: TextStyle(
                fontWeight: FontWeight.bold, // Negrito
                fontSize: 18, // Tamanho da fonte
              ),
            ),
            const SizedBox(height: 8), // Mais um espaçamento
            // Exibe os itens da lista, usando ListTile para cada item
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinha à esquerda
              children: List.generate(listaItem.length, (index) {
                ItemModelo itemAtual =
                    listaItem[index]; // Pega o item atual da lista
                return ListTile(
                  dense: true, // Deixa o item mais compacto
                  contentPadding: EdgeInsets.zero, // Remove o padding padrão
                  title: Text(itemAtual.item), // Nome do produto (ex: Arroz)
                  subtitle: Text(itemAtual.data), // Data associada ao item
                  leading: const Icon(
                      Icons.check_box), // Ícone de checkbox na esquerda
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete, // Ícone de lixeira
                      color: Colors.red, // Cor vermelha para deletar
                    ),
                    onPressed: () {
                      print(
                          "Deletar ${itemAtual.item}"); // Ação de deletar o item
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

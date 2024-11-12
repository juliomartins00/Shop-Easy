import 'package:flutter/material.dart';
import 'package:myapp/componentes/decoracao_login.dart';
import 'package:myapp/telas/listas_tela.dart'; // Importando a tela ListasTela

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool entrarConta = true; // Variável que controla se é login ou cadastro
  final _formKey = GlobalKey<FormState>();

  // Simulação de usuários registrados
  List<Map<String, String>> usuariosRegistrados = [
    {"email": "usuario1@email.com", "senha": "senha123"},
    {"email": "usuario2@email.com", "senha": "senha456"},
  ];

  // Variáveis para capturar email, senha e nome
  String? email;
  String? senha;
  String? nome;
  String? confirmarSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 184, 92),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/imagemlogo.jpg'),
                      const Text(
                        "Shop Easy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 1.0,
                              color: Colors.blueGrey,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Campo de Email com Ícone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email, size: 28),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O email não pode estar vazio";
                                }
                                if (value.length < 5) {
                                  return "Email inválido, poucos caracteres";
                                }
                                if (!value.contains("@")) {
                                  return "O email não é valido";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Campo de Senha com Ícone
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.lock, size: 28),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Senha',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O campo não pode estar vazio";
                                }
                                if (value.length < 5) {
                                  return "Campo inválido, poucos caracteres";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  senha = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Campos extras de cadastro
                      Visibility(
                        visible: !entrarConta,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Confirmar Senha',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O campo não pode estar vazio";
                                }
                                if (value.length < 5) {
                                  return "Campo inválido, poucos caracteres";
                                }
                                if (value != senha) {
                                  return "As senhas não coincidem";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  confirmarSenha = value;
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "O nome não pode estar vazio";
                                }
                                if (value.length < 5) {
                                  return "Nome inválido, poucos caracteres";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  nome = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Botão de Entrar/Cadastrar
                      Center(
                        child: SizedBox(
                          width: 200, // Define a largura do botão
                          child: ElevatedButton(
                            onPressed: () {
                              botaoEntrarClicado(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            child: Text(
                              (entrarConta) ? "Entrar" : "Cadastrar",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            entrarConta = !entrarConta;
                          });
                        },
                        child: Text(
                          (entrarConta)
                              ? "Clique aqui para se Cadastrar"
                              : "Já possui conta? Clique para Entrar",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Função de login/cadastro
  void botaoEntrarClicado(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (entrarConta) {
        // Verifica se o usuário já está registrado e a senha corresponde
        bool usuarioValido = usuariosRegistrados.any((usuario) =>
            usuario['email'] == email && usuario['senha'] == senha);

        if (usuarioValido) {
          // Usuário autenticado com sucesso
          Navigator.pushReplacementNamed(
              context, '/inicio'); // Navega para a tela de início
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email ou senha incorretos")),
          );
        }
      } else {
        // Processo de cadastro
        usuariosRegistrados.add({"email": email!, "senha": senha!});
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cadastro realizado com sucesso!")),
        );
        setState(() {
          entrarConta = true; // Muda para a tela de login após o cadastro
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha corretamente os campos")),
      );
    }
  }
}

# ScrollSeeker 📜
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

Aplicativo mobile dedicado ao universo do Tibia, com foco em exploração de conteúdo, utilidades e informações para jogadores.

## 📂 Estrutura do projeto

O projeto está organizado de forma modular, onde cada nova funcionalidade do app é implementada dentro de seu respectivo módulo.

### 🌲 Árvore de diretórios

```dart
.
├── assets/
│   ├── images/
│   │   └── icons
│   └── fonts
└── lib/
    ├── modules/ 
    │   ├── common/ /
    │   │   ├── configs
    │   │   ├── constants
    │   │   ├── components
    │   │   ├── controllers
    │   │   ├── exceptions
    │   │   ├── formatters
    │   │   ├── helpers
    │   │   ├── models
    │   │   ├── routes
    │   │   ├── services
    │   │   └── theme
    │   ├── module_one/ 
    │   │   ├── controllers
    │   │   ├── models
    │   │   ├── repositories
    │   │   ├── routes
    │   │   ├── services
    │   │   └── views
    │   ├── module_two/
    │   │   ├── controllers
    │   │   ├── models
    │   │   ├── repositories
    │   │   ├── routes
    │   │   ├── services
    │   │   └── views
    │   └── ... 
    ├── routes 
    └── main.dart 
```
---

## 🚀 Iniciando o desenvolvimento

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/ScrollSeeker.git

# Acesse a pasta do projeto
cd projectcaju

# Instale as dependências
flutter pub get

```

Abra o projeto na sua IDE de preferência e rode em um emulador ou dispositivo físico.

---

## 🔗 Links úteis

- [Flutter Docs](https://docs.flutter.dev/get-started/install)
- [Tibia API](https://tibiadata.com/)


# 📱 **Viacred - Avaliação de Filiais** 📱
Aplicativo desenvolvido para permitir que os usuários avaliem as filiais da cooperativa em diversos critérios, como ambiente, colaboradores e tempo de espera.

## 📋 **Situação Problema**
O objetivo deste projeto é desenvolver um aplicativo móvel para que os clientes da cooperativa Viacred possam avaliar sua experiência, ajudando na melhoria contínua dos serviços oferecidos. O app coleta informações como nota geral de 0 a 10, sugestões de melhorias, e realiza a confirmação de CPF através de um layout intuitivo de "calculadora".

## ✨ **Funcionalidades Principais**
⭐ **Tela de Avaliação**
- O usuário pode avaliar a filial em três critérios: **Ambiente**, **Colaboradores**, e **Tempo de Espera**, escolhendo uma nota de 0 a 10.
- Cada avaliação é armazenada e enviada para o Firebase.

🔢 **Tela de Confirmação de CPF**
- O usuário deve confirmar seu CPF através de um layout de teclado numérico, semelhante ao de uma calculadora.

💬 **Campo de Sugestões**
- Os usuários podem fornecer sugestões para melhorar o serviço da filial, que serão registradas e analisadas.

✅ **Finalização da Avaliação**
- Após a avaliação, o usuário finaliza o processo, recebendo uma confirmação de sua participação.


## 🛠 **Requisitos Técnicos**
- **Framework**: Flutter
- **Navegação**: Rotas nomeadas
- **Gerenciamento de Dados**: Firebase (Firebase Auth, Firestore)
- **Gerenciamento de Estado**: Provider e GetX
- **Preferências**: Shared Preferences para configurações como idioma e tema
- **Design**: Flutter Launcher Icons e Flutter Native Splash para personalização da tela inicial
- **Autenticação**: Firebase Auth, Firebase UI Auth

## 🎯 **Objetivos do Projeto**
- Criar uma plataforma de feedback eficiente para avaliar as filiais da cooperativa.
- Integrar a autenticação Firebase para garantir um processo seguro de registro de avaliações.


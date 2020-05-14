<<<<<<< HEAD
# tms_mobile

A new Flutter project.

## Rodando API local
### 1. Configurar IIS Express

Na versão 2015 do Visual Studio, na pasta da projeto modifique _.vs/config/applicationhost.config_ modifique as linhas
>      <bindings>
>          <binding protocol="http" bindingInformation="*:44347:localhost" />
>          <binding protocol="https" bindingInformation="*:44347:localhost" />
>      </bindings>
para
>      <bindings>
>          <binding protocol="http" bindingInformation="*:44347:*" />
>          <binding protocol="https" bindingInformation="*:44347:*" />
>      </bindings>
Isso permitirá que o IIS responda a requisições com origem fora do localhost.
Substitua a porta 44347 pela que estiver usando

### 2. Regra de Firewall

StarMenu > "Windows Defender Firewall".

Abra as configurações avanladas > Regras de entrada > Nova Regra...

Configure para __Porta__ > __TCP__ e a porta que estiver utilizando para a API

Isso fará com que o firewall não bloqueie requisições chegando na porta da API

### 3. Permissões administrativas

Abra um prompt de comando com permissão de administrator de rode o código abaixo, substituindo a porta se necessário
> netsh http add urlacl url=http://*:44347/ user=todos

__user=everyone__, caso a linguagem do sistema seja inglês

Talvez esta etapa seja desnecessária, tente apenas as duas primeiras e se não funcionar, execute esta, apague também esta observação.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# TMS-Mobile
>>>>>>> 1170ae6a4f47553568fed62ae18554515540e29a

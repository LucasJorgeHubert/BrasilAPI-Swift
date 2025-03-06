# BrasilAPI-Swift

[![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)

Uma SDK Swift para acessar os serviços da [BrasilAPI](https://brasilapi.com.br) de forma simples e integrada.

## 📖 Sumário

- [📦 Instalação](#-instalação)
- [🚨 Importante](#-importante)
- [🔧 Funcionalidades Implementadas](#-funcionalidades-implementadas)
  - [🏦 Bancos](#-bancos)
    - [Listar Bancos](#listar-bancos-banksv1)
    - [Buscar banco pelo código](#buscar-banco-pelo-código-banksv1code)
  - [💱 Câmbio](#-câmbio)
    - [Buscar Moedas](#buscar-moedas-cambiov1moedas)
    - [Buscar Cotação](#buscar-cotação-cambiov1cotaçãomoedadata)
  - [📍 CEP](#-cep)
    - [Buscar CEP](#buscar-cep-cepv1code)
  - [📍 CEP v2](#-cep-v2)
    - [Buscar CEP](#buscar-cep-cepv2code)
  - [🏢 CNPJ (WIP)](#-cnpj-wip)
  - [🏦 Corretoras](#-corretoras)
  - [🌡️ CPTEC](#-cptec)
  - [📱 DDD](#-ddd)
  - [🎉 Feriados Nacionais](#-feriados-nacionais)
  - [🚗 FIPE](#-fipe)
  - [🔎 IBGE](#-ibge)
  - [🔢 ISBN](#-isbn)
  - [🏢 NCM](#-ncm)
  - [💰 PIX](#-pix)
  - [🌐 Registro BR](#-registro-br)
  - [💸 Taxas](#-taxas)
- [📄 Licença](#-licença)
- [🤝 Contribuindo](#-contribuindo)
- [🌎 English Version](#-english-version)


## 📦 Instalação

A SDK está disponível via [Swift Package Manager (SPM)](https://swift.org/package-manager/). Para adicioná-la ao seu projeto:

1. No Xcode, vá para `File > Add Packages`
2. Insira a URL do repositório: `https://github.com/LucasJorgeHubert/BrasilAPI-Swift`
3. Escolha a versão desejada e adicione o pacote ao seu projeto

Ou, se preferir, adicione manualmente ao `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/LucasJorgeHubert/BrasilAPI-Swift", from: "0.2.0")
]
```

Lembre de adicionar a importação no código:
```swift
import BrasilAPI
```
## 🚨 Importante
O SPM foi feito para facilitar a integração com a [BrasilAPI](https://brasilapi.com.br), então todos os modelos retornados são exatamente os mesmos retornados no response da API, então quando for implementar, pode se basear no retorna da API para saber o que vai retornar na modelagem.

## 🔧 Funcionalidades Implementadas

### 🏦 Bancos
#### Listar Bancos [`banks/v1`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1/get)

Retorna informações de todos os bancos do Brasil:

```swift
var banks: [BrasilAPIBankModel] = try await BrasilAPI().banking.listBanks()
```

#### Buscar banco pelo código [`banks/v1/{code}`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1~1%7Bcode%7D/get)
Busca as informações de um banco a partir do código do banco:
```swift
var bank: BrasilAPIBankModel = try await BrasilAPI().banking.getBankByCode(code: String)
```

Model **BrasilAPIBankModel**
```swift
public struct BrasilAPIBankModel: Codable {
    let ispb: String
    let name: String?
    let code: Int?
    let fullName: String?
}
```

---
### 💱 Câmbio
#### Buscar Moedas [`cambio/v1/moedas`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1moedas/get)

Retorna informações de todas as moedas disponíveis para conversão:

```swift
var coins: [BrasilAPIExchangeCoinModel] = try await BrasilAPI().exchange.listCoins()
```
Model **BrasilAPIExchangeCoinModel**
```swift
public let symbol: String
public let name: String
public let type: String
```

#### Buscar Cotação [`cambio/v1/cotacao/{moeda}/{data}`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1cotacao~1%7Bmoeda%7D~1%7Bdata%7D/get)

Busca pelo câmbio do Real com outra moeda, em uma data específica:

```swift
var quote: BrasilAPIExchangeQuotationModel = try await BrasilAPI().exchange.getQuotation(coin: String, date: String)
/// coin: "USD"
/// date: YYYY-MM-DD
```
Model **BrasilAPIExchangeQuotationModel**
```swift
public struct BrasilAPIExchangeQuotationModel: Codable, Hashable, Equatable {
	let cotacoes: [BrasilAPIExchangeQuotationCoinModel]
	let moeda: String
	let data: String
}

public struct BrasilAPIExchangeQuotationCoinModel: Codable, Hashable, Equatable {
	let paridadeCompra: Double
	let paridadeVenda: Double
	let cotacaoCompra: Double
	let cotacaoVenda: Double
	let dataHoraCotacao: String
	let tipoBoletim: String
}
```

---
### 📍 CEP
#### Buscar CEP [`cep/v1/{code}`](https://brasilapi.com.br/docs#tag/CEP/paths/~1cep~1v1~1%7Bcep%7D/get)\
Busca por CEP com múltiplos providers de fallback
A busca utiliza como fonte principal o OpenCep, caso não encontre o CEP é buscado em diversos outros providers de CEP.

```swift
var zipCode: BrasilAPIZipCodeV1Model = try await BrasilAPI().zipCode.searchZipCodeV1(zipCode: String) // Apenas números
```
Model **BrasilAPIZipCodeV1Model**
```swift
public let cep: String
public let state: String
public let city: String
public let neighborhood: String
public let street: String
public let service: String
```
---
### 📍 CEP v2
#### Buscar CEP [`cep/v2/{code}`](https://brasilapi.com.br/docs#tag/CEP-V2/paths/~1cep~1v2~1%7Bcep%7D/get)
Versão 2 do serviço de busca por CEP com múltiplos providers de fallback.
```swift
var zipCode: BrasilAPIZipCodeV2Model = try await BrasilAPI().zipCode.searchZipCodeV2(zipCode: String) // Apenas números
```
Model **BrasilAPIZipCodeV2Model**
```swift
public struct BrasilAPIZipCodeV2Model: Codable, Hashable, Equatable {
	public let cep: String
	public let state: String
	public let city: String
	public let neighborhood: String?
	public let street: String?
	public let service: String
	public let location: Location
}

public struct Location: Codable, Hashable, Equatable {
	public let type: String
	public let coordinates: Coordinates?
}

public struct Coordinates: Codable, Hashable, Equatable {
	public let longitude: String?
	public let latitude: String?
}
```
---
### 🏢 CNPJ (WIP)
---
### 🏦 Corretoras
---
### 🌡️ CPTEC
---
### 📱 DDD
---
### 🎉 Feriados Nacionais
---
### 🚗 FIPE
---
### 🔎 IBGE
---
### 🔢 ISBN
---
### 🏢 NCM
---
### 💰 PIX
---
### 🌎 Registro BR
---
### 💸 Taxas
---

## 📄 Licença

---

Este projeto é licenciado sob a [MIT License](LICENSE).

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

---
Created with ❤️ by [Lucas Hubert](https://github.com/LucasJorgeHubert).


# English version

# BrasilAPI-Swift

[![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)

A Swift SDK for accessing [BrasilAPI](https://brasilapi.com.br) services in a simple and integrated way.

## 📖 Table of Contents

- [📦 Installation](#-installation)
- [🚨 Important](#-important)
- [🔧 Implemented Features](#-implemented-features)
  - [🏦 Banks](#-banks)
    - [List Banks](#list-banks-banksv1)
    - [Get Bank by Code](#get-bank-by-code-banksv1code)
  - [💱 Exchange](#-exchange)
    - [Get Currencies](#get-currencies-cambiov1moedas)
    - [Get Quotation](#get-quotation-cambiov1cotaçãomoedadata)
  - [📍 ZIP Code](#-zip-code)
    - [Get ZIP Code](#get-zip-code-cepv1code)
  - [📍 ZIP Code v2](#-zip-code-v2)
    - [Get ZIP Code](#get-zip-code-cepv2code)
  - [🏢 CNPJ (WIP)](#-cnpj-wip)
  - [🏦 Brokers](#-brokers)
  - [🌡️ CPTEC](#-cptec)
  - [📱 DDD](#-ddd)
  - [🎉 National Holidays](#-national-holidays)
  - [🚗 FIPE](#-fipe)
  - [🔎 IBGE](#-ibge)
  - [🔢 ISBN](#-isbn)
  - [🏢 NCM](#-ncm)
  - [💰 PIX](#-pix)
  - [🌎 Registro BR](#-registro-br)
  - [💸 Taxes](#-taxes)
- [📄 License](#-license)
- [🤝 Contributing](#-contributing)

## 📦 Installation

The SDK is available via [Swift Package Manager (SPM)](https://swift.org/package-manager/). To add it to your project:

1. In Xcode, go to `File > Add Packages`
2. Enter the repository URL: `https://github.com/LucasJorgeHubert/BrasilAPI-Swift`
3. Choose the desired version and add the package to your project

Or, if you prefer, manually add it to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/LucasJorgeHubert/BrasilAPI-Swift", from: "0.2.0")
]
```

Remember to import it in your code:
```swift
import BrasilAPI
```

## 🚨 Important
The SPM was created to facilitate integration with [BrasilAPI](https://brasilapi.com.br), so all returned models are exactly the same as those in the API response. When implementing, you can base your code on the API response to understand what the models will return.

## 🔧 Implemented Features

### 🏦 Banks
#### List Banks [`banks/v1`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1/get)
Returns information about all banks in Brazil:

```swift
var banks: [BrasilAPIBankModel] = try await BrasilAPI().banking.listBanks()
```

#### Get Bank by Code [`banks/v1/{code}`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1~1%7Bcode%7D/get)
Retrieves bank information based on its code:
```swift
var bank: BrasilAPIBankModel = try await BrasilAPI().banking.getBankByCode(code: String)
```

Model **BrasilAPIBankModel**
```swift
public struct BrasilAPIBankModel: Codable {
    let ispb: String
    let name: String?
    let code: Int?
    let fullName: String?
}
```

---
### 💱 Exchange
#### Get Currencies [`cambio/v1/moedas`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1moedas/get)
Returns information about all available currencies for conversion:

```swift
var coins: [BrasilAPIExchangeCoinModel] = try await BrasilAPI().exchange.listCoins()
```
Model **BrasilAPIExchangeCoinModel**
```swift
public let symbol: String
public let name: String
public let type: String
```

#### Get Quotation [`cambio/v1/cotacao/{moeda}/{data}`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1cotacao~1%7Bmoeda%7D~1%7Bdata%7D/get)
Fetches the exchange rate of the Real with another currency on a specific date:

```swift
var quote: BrasilAPIExchangeQuotationModel = try await BrasilAPI().exchange.getQuotation(coin: String, date: String)
/// coin: "USD"
/// date: YYYY-MM-DD
```
Model **BrasilAPIExchangeQuotationModel**
```swift
public struct BrasilAPIExchangeQuotationModel: Codable, Hashable, Equatable {
    let cotacoes: [BrasilAPIExchangeQuotationCoinModel]
    let moeda: String
    let data: String
}

public struct BrasilAPIExchangeQuotationCoinModel: Codable, Hashable, Equatable {
    let paridadeCompra: Double
    let paridadeVenda: Double
    let cotacaoCompra: Double
    let cotacaoVenda: Double
    let dataHoraCotacao: String
    let tipoBoletim: String
}
```

---
### 📍 ZIP Code
#### Get ZIP Code [`cep/v1/{code}`](https://brasilapi.com.br/docs#tag/CEP/paths/~1cep~1v1~1%7Bcep%7D/get)
Fetches ZIP Code information with multiple fallback providers.

```swift
var zipCode: BrasilAPIZipCodeV1Model = try await BrasilAPI().zipCode.searchZipCodeV1(zipCode: String) // Numbers only
```
Model **BrasilAPIZipCodeV1Model**
```swift
public let cep: String
public let state: String
public let city: String
public let neighborhood: String
public let street: String
public let service: String
```

---
## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Feel free to open issues and pull requests.

---
Created with ❤️ by [Lucas Hubert](https://github.com/LucasJorgeHubert).


<img src="https://github.com/user-attachments/assets/4332cfb7-06ae-4816-b4f6-83092c541740" style="height:150px"/>

[![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen.svg)]()

Uma SDK Swift para acessar os serviços da [BrasilAPI](https://brasilapi.com.br) de forma simples e integrada.

🚨 Respeite as regras de uso da API, conforme a [documentação](https://brasilapi.com.br/docs).

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
  - [🏢 CNPJ](#-cnpj)
    - [Buscar CNPJ](#buscar-cnpj-cnpjv1cnpj)
  - [🏦 Corretoras](#-corretoras)
    - [Buscar corretoras](#buscar-corretoras-cvmcorretorasv1)
    - [Buscar corretora por CNPJ](#buscar-corretora-por-cnpj-cvmcorretorasv1cnpj)
  - [🌡️ CPTEC](#-cptec)
    - [Listar localidades](#listar-localidades-cptecv1cidade)
    - [Buscar localidade](#buscar-localidade-cptecv1cidadecityname)
    - [Condições nas capitais](#condição-nas-capitais-cptecv1climacapital)
    - [Condição nos aeroportos](#condição-nos-aeroportos-cptecv1climaaeroportoicaocode)
    - [Previsão metereológica](#previsão-cptecv1climaprevisaocitycodedays)
    - [Previsão oceânica](#previsão-oceanica-cptecv1ondascitycodedays)
  - [📱 DDD](#-ddd)
    - [Listar cidades](#listar-cidades-por-ddd-dddv1ddd)
  - [🎉 Feriados Nacionais](#-feriados-nacionais)
    - [Listar feriados nacionais](#listar-feriados-nacionais-feriadosv1ano)
  - [🚗 FIPE](#-fipe)
    - [Listar marcas de veículos](#listar-marcas-de-veículos-fipemarcasv1tipoveiculo)
    - [Consultar preço do veículo](#consultar-preço-do-veículo-fipeprecov1codigofipe)
    - [Listar tabelas de referência](#listar-tabelas-de-referência-fipetabelasv1)
    - [Listar veículos por marca e tipo](#listar-veículos-por-marca-e-tipo-fipeveiculosv1tipoveiculocodigomarca)
  - [🔎 IBGE](#-ibge)
    - [Listar cidades](#listar-cidades-ibgemunicipiosv1siglauf)
    - [Listar estados](#listar-estados-ibgeufv1)
    - [Buscar estado](#listar-estado-ibgeufv1code)
  - [📖 ISBN](#-isbn)
    - [Buscar livro](#buscar-livro-isbnv1isbn)
  - [🏢 NCM](#-ncm)
    - [Buscar todos os NCMs](#buscar-ncm-ncmv1)
    - [Buscar NCM](#buscar-um-ncm-ncmv1code)
    - [Pesquisar NCM](#pesquisar-ncm-ncmv1searchterm)
  - [💰 PIX](#-pix)
    - [Buscar participantes](#buscar-participantes-pixv1participants)
  - [🌐 Registro BR](#-registro-br)
    - [Buscar status do dominio](#buscar-staus-do-dominio-registrobrv1dominio)
  - [💸 Taxas](#-taxas)
    - [Listar taxas](#listar-taxas-taxasv1)
    - [Buscar taxa](#buscar-taxa-taxasv1sigla)
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
    .package(url: "https://github.com/LucasJorgeHubert/BrasilAPI-Swift", from: "1.0.0")
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
var banks: [BrasilAPI.Bank.BankModel] = try await BrasilAPI().banking.listBanks()
```

#### Buscar banco pelo código [`banks/v1/{code}`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1~1%7Bcode%7D/get)
Busca as informações de um banco a partir do código do banco:
```swift
var bank: BrasilAPI.Bank.BankModel = try await BrasilAPI().banking.getBankByCode(code: String)
```
<details>
<summary>
Model BrasilAPI.Bank.BankModel
</summary>

```swift
  ispb: String
  name: String?
  code: Int?
  fullName: String?
}
```
</details>

---
### 💱 Câmbio
#### Buscar Moedas [`cambio/v1/moedas`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1moedas/get)

Retorna informações de todas as moedas disponíveis para conversão:

```swift
var coins: [BrasilAPI.Exchange.CoinModel] = try await BrasilAPI().exchange.listCoins()
```
<details>
<summary>
Model BrasilAPI.Exchange.CoinModel
</summary>

```swift
  symbol: String
  name: String
  type: String
```
</details>

#### Buscar Cotação [`cambio/v1/cotacao/{moeda}/{data}`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1cotacao~1%7Bmoeda%7D~1%7Bdata%7D/get)

Busca pelo câmbio do Real com outra moeda, em uma data específica:

```swift
var quote: BrasilAPI.Exchange.QuotationModel = try await BrasilAPI().exchange.getQuotation(coin: String, date: String)
/// coin: "USD"
/// date: YYYY-MM-DD
```
<details>
<summary>
Model BrasilAPI.Exchange.QuotationModel
</summary>

```swift

/// BrasilAPI.Exchange.QuotationModel
	cotacoes: [BrasilAPIExchangeQuotationCoinModel]
	moeda: String
	data: String


/// BrasilAPI.Exchange.QuotationCoinModel
	paridadeCompra: Double
	paridadeVenda: Double
	cotacaoCompra: Double
	cotacaoVenda: Double
	dataHoraCotacao: String
	tipoBoletim: String
```
</details>

---
### 📍 CEP
#### Buscar CEP [`cep/v1/{code}`](https://brasilapi.com.br/docs#tag/CEP/paths/~1cep~1v1~1%7Bcep%7D/get)
Busca por CEP com múltiplos providers de fallback
A busca utiliza como fonte principal o OpenCep, caso não encontre o CEP é buscado em diversos outros providers de CEP.

```swift
var zipCode: BrasilAPI.ZipCode.ZipCodeV1Model = try await BrasilAPI().zipCode.searchZipCodeV1(zipCode: String) // Apenas números
```
<details>
<summary>
Model BrasilAPI.ZipCode.ZipCodeV1Model
</summary>

```swift
  cep: String
  state: String
  city: String
  neighborhood: String
  street: String
  service: String
```
</details>

---
### 📍 CEP v2
#### Buscar CEP [`cep/v2/{code}`](https://brasilapi.com.br/docs#tag/CEP-V2/paths/~1cep~1v2~1%7Bcep%7D/get)
Versão 2 do serviço de busca por CEP com múltiplos providers de fallback.
```swift
var zipCode: BrasilAPI.ZipCode.ZipCodeV2Model = try await BrasilAPI().zipCode.searchZipCodeV2(zipCode: String) // Apenas números
```
<details>
<summary>
Model BrasilAPI.ZipCode.ZipCodeV2Model
</summary>

```swift
/// BrasilAPI.ZipCode.ZipCodeV2Model
	cep: String
	state: String
	city: String
	neighborhood: String?
	street: String?
	service: String
	location: BrasilAPIZipCodeV2LocationModel

/// ZipCodeService.BrasilAPIZipCodeV2LocationModel
	type: String
	coordinates: BrasilAPIZipCodeV2CoordinatesModel?

/// ZipCodeService.BrasilAPIZipCodeV2CoordinatesModel
	longitude: String?
	latitude: String?

```

</details>

---
### 🏢 CNPJ

#### Buscar CNPJ [`cnpj/v1/{cnpj}`](https://brasilapi.com.br/docs#tag/CNPJ/paths/~1cnpj~1v1~1%7Bcnpj%7D/get)
Busca por CNPJ na API Minha Receita.
```swift
var cnpj: BrasilAPI.CNPJ.CNPJModel = try await BrasilAPI().cnpj.getCNPJ(cnpj: String) // Apenas números
```
<details>
<summary>
Model BrasilAPI.CNPJ.CNPJModel
</summary>

```swift
  uf: String
  cep: String
  qsa: [Qsa]
  cnpj: String
  pais: String?
  email: String?
  porte: String
  bairro: String
  numero: String
  dddFax: String
  municipio: String
  logradouro: String
  cnaeFiscal: Int
  codigoPais: Int?
  complemento: String
  codigoPorte: Int
  razaoSocial: String
  nomeFantasia: String
  capitalSocial: Int
  dddTelefone1: String
  dddTelefone2: String
  opcaoPeloMei: Bool?
  descricaoPorte: String
  codigoMunicipio: Int
  cnaesSecundarios: [CnaesSecundario]
  naturezaJuridica: String
  regimeTributario: [RegimeTributario]
  situacaoEspecial: String
  opcaoPeloSimples: Bool?
  situacaoCadastral: Int
  dataOpcaoPeloMei: String?
  dataExclusaoDoMei: String?
  cnaeFiscalDescricao: String
  codigoMunicipioIbge: Int
  dataInicioAtividade: String
  dataSituacaoEspecial: String?
  dataOpcaoPeloSimples: String?
  dataSituacaoCadastral: String
  nomeCidadeNoExterior: String
  codigoNaturezaJuridica: Int
  dataExclusaoDoSimples: String?
  motivoSituacaoCadastral: Int
  enteFederativoResponsavel: String
  identificadorMatrizFilial: Int
  qualificacaoDoResponsavel: Int
  descricaoSituacaoCadastral: String
  descricaoTipoDeLogradouro: String
  descricaoMotivoSituacaoCadastral: String
  descricaoIdentificadorMatrizFilial: String

  /// QSA
  pais: String?
  nomeSocio: String
  codigoPais: Int?
  faixaEtaria: String
  cnpjCpfDoSocio: String
  qualificacaoSocio: String
  codigoFaixaEtaria: Int
  dataEntradaSociedade: String
  identificadorDeSocio: Int
  cpfRepresentanteLegal: String
  nomeRepresentanteLegal: String
  codigoQualificacaoSocio: Int
  qualificacaoRepresentanteLegal: String
  codigoQualificacaoRepresentanteLegal: Int

  /// RegimeTributario
  ano: Int
  cnpjDaSCP: String?
  formaDeTributacao: String
  quantidadeDeEscrituracoes: Int

  /// CnaesSecundario
  codigo: Int
  descricao: String

```

</details>

---
### 🏦 Corretoras

#### Buscar corretoras [`/cvm/corretoras/v1`](https://brasilapi.com.br/docs#tag/Corretoras/paths/~1cvm~1corretoras~1v1/get)

```swift
var brokers: [Broker.BrokerModel] = try await BrasilAPI().broker.getBrokers()
```

#### Buscar corretora por CNPJ [`/cvm/corretoras/v1/{cnpj}`](https://brasilapi.com.br/docs#tag/Corretoras/paths/~1cvm~1corretoras~1v1~1%7Bcnpj%7D/get)

```swift
var broker: Broker.BrokerModel = try await BrasilAPI().broker.getBrokerByCnpj(cnpj: String)
```

<details>
<summary>
Model Broker.BrokerModel
</summary>

```swift
  cnpj: String
  type: String
  nomeSocial: String
  nomeComercial: String
  status: String
  email: String
  telefone: String
  cep: String
  pais: String
  uf: String
  municipio: String
  bairro: String
  complemento: String
  logradouro: String
  dataPatrimonioLiquido: String
  valorPatrimonioLiquido: String
  codigoCvm: String
  dataInicioSituacao: String
  dataRegistro: String

``` 
</details>

---
### 🌡️ CPTEC

#### Listar localidades [`cptec/v1/cidade`](https://brasilapi.com.br/docs#tag/CPTEC/operation/listcities(/cptec/v1/cidade))

Retorna listagem com todas as cidades junto a seus respectivos códigos presentes nos serviços da CPTEC. O Código destas cidades será utilizado para os serviços de meteorologia e a ondas (previsão oceânica) fornecido pelo centro. Leve em consideração que o WebService do CPTEC as vezes é instável, então se não encontrar uma determinada cidade na listagem completa, tente buscando por parte de seu nome no endpoint de busca.

```swift
var cities: [BrasilAPI.CPTEC.LocalModel] = try await BrasilAPI().cptec.getListCPTECLocals()
```

<details>
<summary>
Model BrasilAPI.CPTEC.LocalModel
</summary>

```swift
  name: String
  state: String
  id: Int
```
</details>

#### Buscar localidade [`cptec/v1/cidade/{cityName}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/searchcities(/cptec/v1/cidade/:cityName))

Retorna listagem com todas as cidades correspondentes ao termo pesquisado junto a seus respectivos códigos presentes nos serviços da CPTEC. O Código destas cidades será utilizado para os serviços de meteorologia e a ondas (previsão oceânica) fornecido pelo centro.

```swift
var cities: [BrasilAPI.CPTEC.LocalModel] = try await BrasilAPI().cptec.getCPTECLocal(localName: String)
```

<details>
<summary>
Model BrasilAPI.CPTEC.LocalModel
</summary>

```swift
  name: String
  state: String
  id: Int
```
</details>

#### Condição nas capitais [`cptec/v1/clima/capital`](https://brasilapi.com.br/docs#tag/CPTEC/operation/Condi%C3%A7%C3%B5esatuaisnascapitais(/cptec/v1/clima/capital))

Retorna condições meteorológicas atuais nas capitais do país, com base nas estações de solo de seu aeroporto.

```swift
var condition: [BrasilAPI.CPTEC.ConditionModel] = try await BrasilAPI().cptec.getListCPTECCapitals()
```

<details>
<summary>
Model BrasilAPI.CPTEC.ConditionModel
</summary>

```swift
  codeICAO: String
  updated: String
  pressure: String
  visibility: String
  windSpeed: Int
  windDirection: Int
  humidity: Int
  condition: String
  conditionDescription: String
  temperature: Int
```
</details>

#### Condição nos aeroportos [`cptec/v1/clima/aeroporto/{icaoCode}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/airportcurrentcondicao(/cptec/v1/clima/aeroporto/:icaoCode))

Retorna condições meteorológicas atuais no aeroporto solicitado. Este endpoint utiliza o código ICAO (4 dígitos) do aeroporto.

```swift
var condition: BrasilAPI.CPTEC.ConditionModel = try await BrasilAPI().cptec.getCPTECCapital(codeICAO: String)
```

<details>
<summary>
Model BrasilAPI.CPTEC.ConditionModel
</summary>

```swift
  codeICAO: String
  updated: String
  pressure: String
  visibility: String
  windSpeed: Int
  windDirection: Int
  humidity: Int
  condition: String
  conditionDescription: String
  temperature: Int
```
</details>

#### Previsão [`cptec/v1/clima/previsao/{cityCode}/{days}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/climapredictionwithoutdays(/cptec/v1/clima/previsao/:cityCode/:days))

Retorna a previsão meteorológica para a cidade informada para um período de 1 até 6 dias. Devido a inconsistências encontradas nos retornos da CPTEC nossa API só consegue retornar com precisão o período máximo de 6 dias.

```swift
var forecast: BrasilAPI.CPTEC.ForecastModel = try await BrasilAPI().cptec.getCPTECLocalForecast(cityCode: Int, days: ForecastAvailableDays)

// ForecastAvailableDays = Enum de 1 a 6 diuas
```

<details>
<summary>
Model BrasilAPI.CPTEC.ForecastModel
</summary>

```swift
  city: String
  state: String
  updated: String
  weather: [CPTECService.BrasilAPICPTECWeatherModel]

  // CPTECService.BrasilAPICPTECWeatherModel
  date: String
  condition: String
  conditionDescription: String
  min: Int
  max: Int
  indexUV: Int
```
</details>

#### Previsão oceanica [`cptec/v1/ondas/{cityCode}/{days}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/ondaspredictionupto6days(/cptec/v1/ondas/:cityCode/:days))

Retorna a previsão oceânica para a cidade informada para um período de, até, 6 dias.

```swift
var forecast: BrasilAPI.CPTEC.OceanicForecastModel = try await BrasilAPI().cptec.getCPTECOceanicForecast(cityCode: Int, days: ForecastAvailableDays)

// ForecastAvailableDays = Enum de 1 a 6 dias
```

<details>
<summary>
Model BrasilAPI.CPTEC.OceanicForecastModel
</summary>

```swift
  city: String
  state: String
  updated: String
  waves: [BrasilAPICPTECWavesModel]

  // BrasilAPICPTECWavesModel
  date: String
  data: [CPTECService.BrasilAPICPTECWavesDataModel]

  // CPTECService.BrasilAPICPTECWavesDataModel
  windSpeed: Double
  windDirection: String
  windDirectionDescription: String?
  waveHeight: Double
  waveDirection: String
  waveDirectionDescription: String?
  agitation: String
  hour: String
```
</details>

---
### 📱 DDD

#### Listar cidades por DDD [`ddd/v1/{ddd}`](https://brasilapi.com.br/docs#tag/DDD/paths/~1ddd~1v1~1%7Bddd%7D/get)
Retorna estado e lista de cidades por DDD

```swift
var cities: BrasilAPI.DDD.CitiesModel = try await BrasilAPI().ddd.getCitiesByDDD(ddd: String)
```

<details>
<summary>
Model BrasilAPI.DDD.CitiesModel
</summary>

```swift
  cities: [String]
  state: String
```
</details>

---
### 🎉 Feriados Nacionais

#### Listar feriados nacionais [`feriados/v1/{ano}`](https://brasilapi.com.br/docs#tag/Feriados-Nacionais/paths/~1feriados~1v1~1%7Bano%7D/get)

Calcula os feriados móveis baseados na Páscoa e adiciona os feriados fixos

```swift
var holidays: [BrasilAPI.Holidays.BrasilAPIHolidaysModel] = try await BrasilAPI().holidays.getNationalHolidays(year: 2025)
```

<details>
<summary>
Model BrasilAPI.Holidays.BrasilAPIHolidaysModel
</summary>

```swift
  date: String
  name: String
  type: String
```
</details>

---
### 🚗 FIPE

#### Listar marcas de veículos [`fipe/marcas/v1/{tipoVeiculo}`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1marcas~1v1~1%7BtipoVeiculo%7D/get)

Lista as marcas de veículos referente ao tipo de veículo

```swift
var brands: [BrasilAPI.FIPE.VehiclesTypeModel] = try await BrasilAPI().fipe.getBrandByVehicleType(carType: FIPEService.VehicleTypeEnum)
```

FIPEService.VehicleTypeEnum: `car`, `truck` e `motorcycle`

<details>
<summary>
Model BrasilAPI.FIPE.VehiclesTypeModel
</summary>

```swift
  name: String
  value: String
```
</details>


#### Consultar preço do veículo [`fipe/preco/v1/{codigoFipe}`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1preco~1v1~1%7BcodigoFipe%7D/get)
Consulta o preço do veículo segundo a tabela fipe.

```swift
var prices: [BrasilAPI.FIPE.VehiclePriceModel] = try await BrasilAPI().fipe.getVehiclePrice(codeFIPE: String)
```

<details>
<summary>
Model BrasilAPI.FIPE.VehiclePriceModel
</summary>

```swift
  name: String
  value: String
```
</details>

#### Listar tabelas de referência [`fipe/tabelas/v1`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1tabelas~1v1/get)

```swift
var tables: [BrasilAPI.FIPE.FIPETableModel] = try await BrasilAPI().fipe.getReferenceTables()
```

<details>
<summary>
Model BrasilAPI.FIPE.FIPETableModel
</summary>

```swift
  code: Int
  month: String
```
</details>

#### Listar veículos por marca e tipo [`fipe/veiculos/v1/{tipoVeiculo}/{codigoMarca}`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1veiculos~1v1~1%7BtipoVeiculo%7D~1%7BcodigoMarca%7D/get)


```swift
var tables: [BrasilAPI.FIPE.VehicleModel] = try await BrasilAPI().fipe.listVehicles(type: FIPEService.VehicleTypeEnum, brandCode: String)
```

FIPEService.VehicleTypeEnum: `car`, `truck` e `motorcycle`

<details>
<summary>
Model BrasilAPI.FIPE.VehicleModel
</summary>

```swift
  model: String
```
</details>

---
### 🔎 IBGE

#### Listar cidades [`ibge/municipios/v1/{siglaUF}`](https://brasilapi.com.br/docs#tag/IBGE/paths/~1ibge~1municipios~1v1~1{siglaUF}?providers=dados-abertos-br,gov,wikipedia/get)
Retorna os municípios da unidade federativa

```swift
var cities: [BrasilAPI.IBGE.CityModel] = try await BrasilAPI().ibge.getIBGECitiesByUF(uf: BrasilState)
// BrasilState é um enum com todos os estados brasileiros
```

<details>
<summary>
Model BrasilAPI.IBGE.CityModel
</summary>

```swift
  name: String
  code: String
```
</details>

#### Listar estados [`ibge/uf/v1`](https://brasilapi.com.br/docs#tag/IBGE/paths/~1ibge~1uf~1v1/get)
Retorna informações de todos estados do Brasil

```swift
var states: [BrasilAPI.IBGE.StateModel] = try await BrasilAPI().ibge.getIBGEStates()
```

<details>
<summary>
Model BrasilAPI.IBGE.StateModel
</summary>

```swift
  id: Int
  acronym: String
  name: String
  region: BrasilAPIIBGEStateRegionModel

  // BrasilAPIIBGEStateRegionModel
  id: Int
  acronym: String
  name: String
```
</details>

#### Listar estado [`ibge/uf/v1/{code}`](https://brasilapi.com.br/docs#tag/IBGE/paths/~1ibge~1uf~1v1~1%7Bcode%7D/get)
Busca as informações de um estado a partir da sigla ou código

```swift
var state: BrasilAPI.IBGE.StateModel = try await BrasilAPI().ibge.getIBGEStateByCode(code: BrasilState)
// BrasilState é um enum com todos os estados brasileiros
```

<details>
<summary>
Model BrasilAPI.IBGE.StateModel
</summary>

```swift
  id: Int
  acronym: String
  name: String
  region: BrasilAPIIBGEStateRegionModel

  // BrasilAPIIBGEStateRegionModel
  id: Int
  acronym: String
  name: String
```
</details>

---
### 📖 ISBN
#### Buscar livro [`isbn/v1/{isbn}`](https://brasilapi.com.br/docs#tag/ISBN/paths/~1isbn~1v1~1%7Bisbn%7D/get)
Informações sobre o livro a partir do ISBN

```swift
let book: BrasilAPI.ISBN.BookModel = try await BrasilAPI().isbn.getBook(isbn: String)
```

<details>
<summary>
Model BrasilAPI.ISBN.BookModel
</summary>

```swift
    isbn: String
    title: String
    subtitle: String?
    authors: [String]
    publisher: String
    synopsis: String
    dimensions: DimensionsModel
    year: Int
    format: String
    page_count: Int
    subjects: [String]
    location: String
    retail_price: String?
    cover_url: String?
    provider: String
    
    // DimensionsModel
    width: Double
    height: Double
    unit: String
```
</details>

---
### 🏢 NCM

#### Buscar todos os NCMs [`ncm/v1`](https://brasilapi.com.br/docs#tag/NCM/paths/~1ncm~1v1/get)

```swift
var ncms: [BrasilAPI.NCM.NCMModel] = try await BrasilAPI().ncm.getAllNCM()
```

<details>
<summary>
Model BrasilAPI.NCM.NCMModel
</summary>

```swift
codigo: String
descricao: String
dataInicio: String
dataFim: String
tipoAto: String
numeroAto: String
anoAto: String
```
</details>

#### Buscar NCM [`ncm/v1/{code}`](https://brasilapi.com.br/docs#tag/NCM/paths/~1ncm~1v1~1%7Bcode%7D/get)

```swift
let ncm: BrasilAPI.NCM.NCMModel = try await BrasilAPI().ncm.getNCMByCode(code: String)
```

#### Pesquisar NCM [`ncm/v1?search={term}`](https://brasilapi.com.br/docs#tag/NCM/paths/~1ncm~1v1?search=%7Bcode%7D/get)

```swift
let ncm: [BrasilAPI.NCM.NCMModel] = try await BrasilAPI().ncm.searchNCM(term: String)
/// Termo pode ser o número ou descrição, conforme documentação da BrasilAPI
```

---
### 💰 PIX

#### Buscar participantes [`pix/v1/participants`](https://brasilapi.com.br/docs#tag/PIX/paths/~1pix~1v1~1participants/get)

Retorna informações de todos os participantes do PIX no dia atual ou anterior

```swift
var participants: [BrasilAPI.PIX.PIXParticipoantsModel] = try await BrasilAPI().pix.getPIXPartcipants()
```

<details>
<summary>
Model BrasilAPI.PIX.PIXParticipoantsModel
</summary>

```swift
ispb: String
name: String
nameReduzido: String
modalidadeParticipacao: String
tipoParticipacao: String
inicioOperacao: String
```
</details>

---
### 🌎 Registro BR

#### Buscar status do dominio [`registrobr/v1/{domain}`](https://brasilapi.com.br/docs#tag/REGISTRO-BR/paths/~1registrobr~1v1~1%7Bdomain%7D/get)

Avalia um dominio no registro.br

```swift
let status: BrasilAPI.DomainBR.DomainBRStatusModel = try await BrasilAPI().domainBR.getDomainBRStatus(domain: String)
```
<details>
<summary>
Model BrasilAPI.DomainBR.DomainBRStatusModel
</summary>

```swift
statusCode: Domain.DomainBR.Enums.DomainBRStatusCodeEnum
status: Domain.DomainBR.Enums.DomainBRStatusEnum
fqdn: String
fqdnace: String?
exempt: Bool?
hosts: [String]?
publicationStatus: String?
expiresAt: String?
suggestions: [String]?
reasons: String?

// BrasilAPI.DomainBR.DomainBRStatusEnum
available = "AVAILABLE"
availableWithTicket = "AVAILABLE_WITH_TICKET"
registered = "REGISTERED"
unavailable = "UNAVAILABLE"
invalidQuery = "INVALID_QUERY"
releaseWaiting = "RELEASE_WAITING"
releaseInProgress = "RELEASE_IN_PROGRESS"
releaseInProgressWithTickets = "RELEASE_IN_PROGRESS_WITH_TICKETS"
error = "ERROR"
domainProcessRelease = "DOMAIN_PROCESS_RELEASE"
unknow = "UNKNOW"

// BrasilAPI.DomainBR.DomainBRStatusCodeEnum
available = 0
availableWithTicket = 1
registered = 2
unavailable = 3
invalidQuery = 4
releaseWaiting = 5
releaseInProgress = 6
releaseInProgressWithTickets = 7
error = 8
domainProcessRelease = 9
unknow = 10
```
</details>

---
### 💸 Taxas

#### Listar todas as taxas [`taxas/v1`](https://brasilapi.com.br/docs#tag/TAXAS/paths/~1taxas~1v1/get)

Retorna as taxas de juros e alguns índices oficiais do Brasil

```swift
var taxas: [BrasilAPI.Taxas.TaxModel] = try await BrasilAPI()tax.getTaxes()
```

<details>
<summary>
Model BrasilAPI.Taxas.TaxModel
</summary>

```swift
name: String
value: Double
```
</details>


#### Buscar taxa [`taxas/v1/{sigla}`](https://brasilapi.com.br/docs#tag/TAXAS/paths/~1taxas~1v1~1%7Bsigla%7D/get)

Busca as informações de uma taxa a partir do seu nome/sigla

```swift
var tax: BrasilAPI.Taxas.TaxModel = try await BrasilAPI().tax.getTax(taxId: "CDI")
```

---

## 📄 Licença

---

Este projeto é licenciado sob a [MIT License](LICENSE).

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

---
Created with ❤️ by [Lucas Hubert](https://github.com/LucasJorgeHubert).

# BrasilAPI-Swift English

[![Swift Package Manager](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)

A Swift SDK to access [BrasilAPI](https://brasilapi.com.br) services in a simple and integrated way.

## 📖 Table of Contents

- [📦 Installation](#-installation)
- [🚨 Important](#-important)
- [🔧 Implemented Features](#-implemented-features)
  - [🏦 Banks](#-banks)
    - [List Banks](#list-banks-banksv1)
    - [Get Bank by Code](#get-bank-by-code-banksv1code)
  - [💱 Exchange](#-exchange)
    - [Get Currencies](#get-currencies-cambiov1moedas)
    - [Get Exchange Rate](#get-exchange-rate-cambiov1cotaçãomoedadata)
  - [📍 ZIP Code](#-zip-code)
    - [Get ZIP Code](#get-zip-code-cepv1code)
  - [📍 ZIP Code v2](#-zip-code-v2)
    - [Get ZIP Code](#get-zip-code-cepv2code)
  - [🏢 CNPJ](#-cnpj)
    - [Get CNPJ](#get-cnpj-cnpjv1cnpj)
  - [🏦 Brokers](#-brokers)
    - [Get Brokers](#get-brokers-cvmcorretorasv1)
    - [Get Broker by CNPJ](#get-broker-by-cnpj-cvmcorretorasv1cnpj)
  - [🌡️ CPTEC](#-cptec)
    - [List Locations](#list-locations)
    - [Search Location](#search-location)
    - [Conditions in Capitals](#conditions-in-capitals)
    - [Conditions at Airports](#conditions-at-airports)
    - [Weather Forecast](#forecast)
    - [Ocean Forecast](#ocean-forecast)
  - [📱 DDD](#-ddd)
    - [List Cities by DDD](#list-cities-by-ddd)
  - [🎉 National Holidays](#-national-holidays)
    - [List National Holidays](#list-national-holidays)
  - [🚗 FIPE](#-fipe)
    - [List Vehicle Brands](#list-vehicle-brands)
    - [Get Vehicle Price](#get-vehicle-price)
    - [List Reference Tables](#list-reference-tables)
    - [List Vehicles by Brand and Type](#list-vehicles-by-brand-and-type)
  - [🔎 IBGE](#-ibge)
    - [List cities](#list-cities-ibge-municipios-v1-siglauf)
    - [List states](#list-states-ibgeufv1)
    - [Get state by code](#get-state-by-code-ibgeufv1code)
  - [📖 ISBN](#-isbn)
    - [Search book](#search-book-isbnv1isbn)
  - [🏢 NCM](#-ncm)
    - [Get all NCMs](#get-all-ncms-ncmv1)
    - [Get NCM](#get-ncm-ncmv1code)
    - [Search NCM](#search-ncm-ncmv1searchterm)
  - [💰 PIX](#-pix)
    - [Search participants](#search-participants-pixv1participants)
  - [🌐 Domain BR](#-domain-br)
    - [Get domain status](#get-domain-status-registrobrv1domain)
  - [💸 Taxes](#-taxes)
    - [Get taxes](#get-all-taxas-taxasv1)
    - [Get tax](#get-tax-taxasv1sigla)
- [📄 License](#-license)
- [🤝 Contributing](#-contributing)
- [🌎 Versão em Português](#-versao-em-portugues)

## 📦 Installation

The SDK is available via [Swift Package Manager (SPM)](https://swift.org/package-manager/). To add it to your project:

1. In Xcode, go to `File > Add Packages`
2. Enter the repository URL: `https://github.com/LucasJorgeHubert/BrasilAPI-Swift`
3. Choose the desired version and add the package to your project

Or, if you prefer, manually add it to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/LucasJorgeHubert/BrasilAPI-Swift", from: "1.0.0")
]
```

Remember to import it in your code:
```swift
import BrasilAPI
```

## 🚨 Important
The SPM was created to facilitate integration with [BrasilAPI](https://brasilapi.com.br), so all returned models are exactly the same as those in the API response. When implementing, you can rely on the API response to know what will be returned in the model.

## 🔧 Implemented Features

### 🏦 Banks
#### List Banks [`banks/v1`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1/get)
Returns information about all banks in Brazil:
```swift
var banks: [BrasilAPI.Bank.BankModel] = try await BrasilAPI().banking.listBanks()
```
---
#### Get Bank by Code [`banks/v1/{code}`](https://brasilapi.com.br/docs#tag/BANKS/paths/~1banks~1v1~1%7Bcode%7D/get)
Fetches information about a bank using its code:
```swift
var bank: BrasilAPI.Bank.BankModel = try await BrasilAPI().banking.getBankByCode(code: String)
```
---
### 💱 Exchange
#### Get Currencies [`cambio/v1/moedas`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1moedas/get)
Returns information about all available currencies for conversion:
```swift
var coins: [BrasilAPI.Exchange.CoinModel] = try await BrasilAPI().exchange.listCoins()
```
---
#### Get Exchange Rate [`cambio/v1/cotacao/{moeda}/{data}`](https://brasilapi.com.br/docs#tag/CAMBIO/paths/~1cambio~1v1~1cotacao~1%7Bmoeda%7D~1%7Bdata%7D/get)
Fetches exchange rates for BRL with another currency on a specific date:
```swift
var quote: BrasilAPI.Exchange.QuotationModel = try await BrasilAPI().exchange.getQuotation(coin: String, date: String)
```
---
### 📍 ZIP Code
#### Get ZIP Code [`cep/v1/{code}`](https://brasilapi.com.br/docs#tag/CEP/paths/~1cep~1v1~1%7Bcep%7D/get)
Fetches ZIP code information using multiple fallback providers.
```swift
var zipCode: BrasilAPI.ZipCode.ZipCodeV1Model = try await BrasilAPI().zipCode.searchZipCodeV1(zipCode: String)
```
---
### 📍 ZIP Code v2
#### Get ZIP Code [`cep/v2/{code}`](https://brasilapi.com.br/docs#tag/CEP-V2/paths/~1cep~1v2~1%7Bcep%7D/get)
Version 2 of the ZIP code lookup service with multiple fallback providers.
```swift
var zipCode: ZipCodeV2Model = try await BrasilAPI().zipCode.searchZipCodeV2(zipCode: String)
```
---
### 🏢 CNPJ
#### Get CNPJ [`cnpj/v1/{cnpj}`](https://brasilapi.com.br/docs#tag/CNPJ/paths/~1cnpj~1v1~1%7Bcnpj%7D/get)
Fetches company information using CNPJ from the Minha Receita API.
```swift
var cnpj: BrasilAPI.CNPJ.CNPJModel = try await BrasilAPI().cnpj.getCNPJ(cnpj: String)
```
---
### 🏦 Brokers
#### Get Brokers [`/cvm/corretoras/v1`](https://brasilapi.com.br/docs#tag/Corretoras/paths/~1cvm~1corretoras~1v1/get)
```swift
var brokers: [Broker.BrokerModel] = try await BrasilAPI().broker.getBrokers()
```

#### Get Broker by CNPJ [`/cvm/corretoras/v1/{cnpj}`](https://brasilapi.com.br/docs#tag/Corretoras/paths/~1cvm~1corretoras~1v1~1%7Bcnpj%7D/get)
```swift
var broker: Broker.BrokerModel = try await BrasilAPI().broker.getBrokerByCnpj(cnpj: String)
```
---
### 🌡️ CPTEC

#### List Locations [`cptec/v1/cidade`](https://brasilapi.com.br/docs#tag/CPTEC/operation/listcities(/cptec/v1/cidade))

Returns a list of all cities along with their respective codes available in CPTEC services. These city codes will be used for meteorology and ocean wave (ocean forecast) services provided by the center. Keep in mind that CPTEC's WebService is sometimes unstable, so if you don't find a specific city in the complete list, try searching by part of its name in the search endpoint.

```swift
var cities: [BrasilAPI.CPTEC.LocalModel] = try await BrasilAPI().cptec.getListCPTECLocals()
```

<details>
<summary>
Model BrasilAPI.CPTEC.LocalModel
</summary>

```swift
  name: String
  state: String
  id: Int
```
</details>

#### Search Location [`cptec/v1/cidade/{cityName}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/searchcities(/cptec/v1/cidade/:cityName))

Returns a list of all cities matching the searched term along with their respective codes available in CPTEC services. These city codes will be used for meteorology and ocean wave (ocean forecast) services provided by the center.

```swift
var cities: [BrasilAPI.CPTEC.LocalModel] = try await BrasilAPI().cptec.getCPTECLocal(localName: String)
```

<details>
<summary>
Model BrasilAPI.CPTEC.LocalModel
</summary>

```swift
  name: String
  state: String
  id: Int
```
</details>

#### Conditions in Capitals [`cptec/v1/clima/capital`](https://brasilapi.com.br/docs#tag/CPTEC/operation/Condi%C3%A7%C3%B5esatuaisnascapitais(/cptec/v1/clima/capital))

Returns current weather conditions in the country's capitals, based on airport ground stations.

```swift
var condition: [BrasilAPI.CPTEC.ConditionModel] = try await BrasilAPI().cptec.getListCPTECCapitals()
```

<details>
<summary>
Model BrasilAPI.CPTEC.ConditionModel
</summary>

```swift
  codeICAO: String
  updated: String
  pressure: String
  visibility: String
  windSpeed: Int
  windDirection: Int
  humidity: Int
  condition: String
  conditionDescription: String
  temperature: Int
```
</details>

#### Conditions at Airports [`cptec/v1/clima/aeroporto/{icaoCode}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/airportcurrentcondicao(/cptec/v1/clima/aeroporto/:icaoCode))

Returns current weather conditions at the requested airport. This endpoint uses the ICAO code (4-digit) of the airport.

```swift
var condition: BrasilAPI.CPTEC.ConditionModel = try await BrasilAPI().cptec.getCPTECCapital(codeICAO: String)
```

<details>
<summary>
Model BrasilAPI.CPTEC.ConditionModel
</summary>

```swift
  codeICAO: String
  updated: String
  pressure: String
  visibility: String
  windSpeed: Int
  windDirection: Int
  humidity: Int
  condition: String
  conditionDescription: String
  temperature: Int
```
</details>

#### Forecast [`cptec/v1/clima/previsao/{cityCode}/{days}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/climapredictionwithoutdays(/cptec/v1/clima/previsao/:cityCode/:days))

Returns the weather forecast for the specified city for a period of 1 to 6 days. Due to inconsistencies found in CPTEC's responses, our API can only reliably return a maximum period of 6 days.

```swift
var forecast: BrasilAPI.CPTEC.ForecastModel = try await BrasilAPI().cptec.getCPTECLocalForecast(cityCode: Int, days: ForecastAvailableDays)

// ForecastAvailableDays = Enum from 1 to 6 days
```

<details>
<summary>
Model BrasilAPI.CPTEC.ForecastModel
</summary>

```swift
  city: String
  state: String
  updated: String
  weather: [CPTECService.BrasilAPICPTECWeatherModel]

  // CPTECService.BrasilAPICPTECWeatherModel
  date: String
  condition: String
  conditionDescription: String
  min: Int
  max: Int
  indexUV: Int
```
</details>

#### Ocean Forecast [`cptec/v1/ondas/{cityCode}/{days}`](https://brasilapi.com.br/docs#tag/CPTEC/operation/ondaspredictionupto6days(/cptec/v1/ondas/:cityCode/:days))

Returns the ocean forecast for the specified city for a period of up to 6 days.

```swift
var forecast: BrasilAPI.CPTEC.OceanicForecastModel = try await BrasilAPI().cptec.getCPTECOceanicForecast(cityCode: Int, days: ForecastAvailableDays)

// ForecastAvailableDays = Enum from 1 to 6 days
```

<details>
<summary>
Model BrasilAPI.CPTEC.OceanicForecastModel
</summary>

```swift
  city: String
  state: String
  updated: String
  waves: [BrasilAPICPTECWavesModel]

  // BrasilAPICPTECWavesModel
  date: String
  data: [CPTECService.BrasilAPICPTECWavesDataModel]

  // CPTECService.BrasilAPICPTECWavesDataModel
  windSpeed: Double
  windDirection: String
  windDirectionDescription: String?
  waveHeight: Double
  waveDirection: String
  waveDirectionDescription: String?
  agitation: String
  hour: String
```
</details>

---
### 📱 DDD

#### List Cities by DDD [`ddd/v1/{ddd}`](https://brasilapi.com.br/docs#tag/DDD/paths/~1ddd~1v1~1%7Bddd%7D/get)
Returns state and list of cities by DDD (area code).

```swift
var cities: BrasilAPI.DDD.CitiesModel = try await BrasilAPI().ddd.getCitiesByDDD(ddd: String)
```

<details>
<summary>
Model BrasilAPI.DDD.CitiesModel
</summary>

```swift
  cities: [String]
  state: String
```
</details>

---
### 🎉 National Holidays

#### List National Holidays [`feriados/v1/{year}`](https://brasilapi.com.br/docs#tag/Feriados-Nacionais/paths/~1feriados~1v1~1%7Bano%7D/get)

Calculates the movable holidays based on Easter and adds the fixed holidays.

```swift
var holidays: [BrasilAPI.Holidays.BrasilAPIHolidaysModel] = try await BrasilAPI().holidays.getNationalHolidays(year: 2025)
```

<details>
<summary>
Model BrasilAPI.Holidays.BrasilAPIHolidaysModel
</summary>

```swift
  date: String
  name: String
  type: String
```
</details>

---
### 🚗 FIPE

#### List Vehicle Brands [`fipe/marcas/v1/{vehicleType}`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1marcas~1v1~1%7BtipoVeiculo%7D/get)

Lists the vehicle brands for the specified vehicle type.

```swift
var brands: [BrasilAPI.FIPE.VehiclesTypeModel] = try await BrasilAPI().fipe.getBrandByVehicleType(carType: FIPEService.VehicleTypeEnum)
```

FIPEService.VehicleTypeEnum: `car`, `truck`, and `motorcycle`

<details>
<summary>
Model BrasilAPI.FIPE.VehiclesTypeModel
</summary>

```swift
  name: String
  value: String
```
</details>

#### Get Vehicle Price [`fipe/preco/v1/{fipeCode}`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1preco~1v1~1%7BcodigoFipe%7D/get)

Retrieves the vehicle price according to the FIPE table.

```swift
var prices: [BrasilAPI.FIPE.VehiclePriceModel] = try await BrasilAPI().fipe.getVehiclePrice(codeFIPE: String)
```

<details>
<summary>
Model BrasilAPI.FIPE.VehiclePriceModel
</summary>

```swift
  name: String
  value: String
```
</details>

#### List Reference Tables [`fipe/tabelas/v1`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1tabelas~1v1/get)

```swift
var tables: [BrasilAPI.FIPE.FIPETableModel] = try await BrasilAPI().fipe.getReferenceTables()
```

<details>
<summary>
Model BrasilAPI.FIPE.FIPETableModel
</summary>

```swift
  code: Int
  month: String
```
</details>

#### List Vehicles by Brand and Type [`fipe/veiculos/v1/{vehicleType}/{brandCode}`](https://brasilapi.com.br/docs#tag/FIPE/paths/~1fipe~1veiculos~1v1~1%7BtipoVeiculo%7D~1%7BcodigoMarca%7D/get)

```swift
var tables: [BrasilAPI.FIPE.VehicleModel] = try await BrasilAPI().fipe.listVehicles(type: FIPEService.VehicleTypeEnum, brandCode: String)
```

FIPEService.VehicleTypeEnum: `car`, `truck`, and `motorcycle`

<details>
<summary>
Model BrasilAPI.FIPE.VehicleModel
</summary>

```swift
  model: String
```
</details>

---
### 🔎 IBGE

#### List cities [`ibge/municipios/v1/{siglaUF}`](https://brasilapi.com.br/docs#tag/IBGE/paths/~1ibge~1municipios~1v1~1{siglaUF}?providers=dados-abertos-br,gov,wikipedia/get)
Returns the cities of the federative unit

```swift
var cities: [BrasilAPI.IBGE.CityModel] = try await BrasilAPI().ibge.getIBGECitiesByUF(uf: BrasilState)
// BrasilState is an enum with all Brazilian states
```

<details>
<summary>
Model BrasilAPI.IBGE.CityModel
</summary>

```swift
  name: String
  code: String
```
</details>

#### List states [`ibge/uf/v1`](https://brasilapi.com.br/docs#tag/IBGE/paths/~1ibge~1uf~1v1/get)
Returns information about all Brazilian states

```swift
var states: [BrasilAPI.IBGE.StateModel] = try await BrasilAPI().ibge.getIBGEStates()
```

<details>
<summary>
Model BrasilAPI.IBGE.StateModel
</summary>

```swift
  id: Int
  acronym: String
  name: String
  region: BrasilAPIIBGEStateRegionModel

  // BrasilAPIIBGEStateRegionModel
  id: Int
  acronym: String
  name: String
```
</details>

#### Get state by code [`ibge/uf/v1/{code}`](https://brasilapi.com.br/docs#tag/IBGE/paths/~1ibge~1uf~1v1~1%7Bcode%7D/get)
Fetches information about a state by acronym or code

```swift
var state: BrasilAPI.IBGE.StateModel = try await BrasilAPI().ibge.getIBGEStateByCode(code: BrasilState)
// BrasilState is an enum with all Brazilian states
```

<details>
<summary>
Model BrasilAPI.IBGE.StateModel
</summary>

```swift
  id: Int
  acronym: String
  name: String
  region: BrasilAPIIBGEStateRegionModel

  // BrasilAPIIBGEStateRegionModel
  id: Int
  acronym: String
  name: String
```
</details>

---

### 📖 ISBN
#### Search book [`isbn/v1/{isbn}`](https://brasilapi.com.br/docs#tag/ISBN/paths/~1isbn~1v1~1%7Bisbn%7D/get)
Get book information from ISBN number code

```swift
let book: BrasilAPI.ISBN.BookModel = try await brasilAPI.isbn.getBook(isbn: String)
```

<details>
<summary>
Model BrasilAPI.ISBN.BookModel
</summary>

```swift
    isbn: String
    title: String
    subtitle: String?
    authors: [String]
    publisher: String
    synopsis: String
    dimensions: DimensionsModel
    year: Int
    format: String
    page_count: Int
    subjects: [String]
    location: String
    retail_price: String?
    cover_url: String?
    provider: String
    
    // DimensionsModel
    width: Double
    height: Double
    unit: String
```
</details>

---

### 🏢 NCM

#### Get all NCMs [`ncm/v1`](https://brasilapi.com.br/docs#tag/NCM/paths/~1ncm~1v1/get)

```swift
var ncms: [BrasilAPI.NCM.NCMModel] = try await BrasilAPI().ncm.getAllNCM()
```

<details>
<summary>
Model BrasilAPI.NCM.NCMModel
</summary>

```swift
codigo: String
descricao: String
dataInicio: String
dataFim: String
tipoAto: String
numeroAto: String
anoAto: String
```
</details>

#### Get NCM [`ncm/v1/{code}`](https://brasilapi.com.br/docs#tag/NCM/paths/~1ncm~1v1~1%7Bcode%7D/get)

```swift
let ncm: BrasilAPI.NCM.NCMModel = try await brasilAPI.ncm.getNCMByCode(code: String)
```

#### Search NCM [`ncm/v1?search={term}`](https://brasilapi.com.br/docs#tag/NCM/paths/~1ncm~1v1?search=%7Bcode%7D/get)

```swift
let ncm: [BrasilAPI.NCM.NCMModel] = try await brasilAPI.ncm.searchNCM(term: String)
/// Term can be a code or a description
```

---
### 💰 PIX

#### Search participants [`pix/v1/participants`](https://brasilapi.com.br/docs#tag/PIX/paths/~1pix~1v1~1participants/get)

Return information about all participants of the PIX on the current or previous day

```swift
var participants: [BrasilAPI.PIX.PIXParticipoantsModel] = try await BrasilAPI().pix.getPIXPartcipants()
```

<details>
<summary>
Model BrasilAPI.PIX.PIXParticipoantsModel
</summary>

```swift
ispb: String
name: String
nameReduzido: String
modalidadeParticipacao: String
tipoParticipacao: String
inicioOperacao: String
```
</details>

--- 
### 🌎 Domain BR

#### Get domain status [`registrobr/v1/{domain}`](https://brasilapi.com.br/docs#tag/REGISTRO-BR/paths/~1registrobr~1v1~1%7Bdomain%7D/get)

Avalia um dominio no registro.br

```swift
let status: BrasilAPI.DomainBR.DomainBRStatusModel = try await BrasilAPI().domainBR.getDomainBRStatus(domain: String)
```
---
### 💸 Taxes

#### Get taxes [`taxas/v1`](https://brasilapi.com.br/docs#tag/TAXAS/paths/~1taxas~1v1/get)

Retorna as taxas de juros e alguns índices oficiais do Brasil

```swift
var taxas: [BrasilAPI.Taxas.TaxModel] = try await BrasilAPI()tax.getTaxes()
```

<details>
<summary>
Model BrasilAPI.Taxas.TaxModel
</summary>

```swift
name: String
value: Double
```
</details>


#### Get tax [`taxas/v1/{sigla}`](https://brasilapi.com.br/docs#tag/TAXAS/paths/~1taxas~1v1~1%7Bsigla%7D/get)

Busca as informações de uma taxa a partir do seu nome/sigla

```swift
var tax: BrasilAPI.Taxas.TaxModel = try await BrasilAPI().tax.getTax(taxId: "CDI")
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Feel free to open issues and pull requests.

---
Created with ❤️ by [Lucas Hubert](https://github.com/LucasJorgeHubert).

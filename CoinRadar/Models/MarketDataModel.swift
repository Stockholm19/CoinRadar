//
//  MarketDataModel.swift
//  CoinRadar
//
//  Created by Роман Пшеничников on 10.03.2025.
//

import Foundation

// JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 17175,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1275,
     "total_market_cap": {
       "btc": 34047545.823273145,
       "eth": 1360953420.3202903,
       "ltc": 29084814561.04834,
       "bch": 7680501861.9721365,
       "bnb": 4955061118.756991,
       "eos": 5705153915738.105,
       "xrp": 1285675158978.3606,
       "xlm": 10436193368296.742,
       "link": 199220875498.57074,
       "dot": 684671188478.0099,
       "yfi": 557969966.8517901,
       "usd": 2762840272674.9717,
       "aed": 10146923224717.553,
       "ars": 2936706203357726000,
       "aud": 4383025065377.028,
       "bdt": 336084119099230.4,
       "bhd": 1041516186111.102,
       "bmd": 2762840272674.9717,
       "brl": 15990399472431.934,
       "cad": 3971237536936.187,
       "chf": 2424442070397.196,
       "clp": 2563132742666493.5,
       "cny": 19987077242598.914,
       "czk": 63501142929883.7,
       "dkk": 18982619033065.2,
       "eur": 2545009657056.459,
       "gbp": 2136139687943.5623,
       "gel": 7666881756673.045,
       "hkd": 21470667212219.92,
       "huf": 1014293467798630.9,
       "idr": 45032261728780480,
       "ils": 10027728769673.81,
       "inr": 240718097713803.44,
       "jpy": 407528955515546.56,
       "krw": 4002096805077801,
       "kwd": 851197933927.8866,
       "lkr": 817264177130838,
       "mmk": 5796438892072087,
       "mxn": 55981476354299.89,
       "myr": 12196558383723.66,
       "ngn": 4184776453174536,
       "nok": 29971418368630.633,
       "nzd": 4840081731685.648,
       "php": 158336607809228.1,
       "pkr": 774282298025396.8,
       "pln": 10606557621000.576,
       "rub": 245581282315849.2,
       "sar": 10364880930988.607,
       "sek": 27838251496820.47,
       "sgd": 3672685017070.9297,
       "thb": 93088471243807.06,
       "try": 100898923995249.67,
       "twd": 90737382582649.42,
       "uah": 114012637598730.81,
       "vef": 276643196502.9449,
       "vnd": 70462717367308890,
       "zar": 50462255329507.445,
       "xdr": 2079937991116.808,
       "xag": 84773526621.41432,
       "xau": 947405557.9029744,
       "bits": 34047545823273.145,
       "sats": 3404754582327314.5
     },
     "total_volume": {
       "btc": 1217336.2130993432,
       "eth": 48659538.97225804,
       "ltc": 1039898681.6912223,
       "bch": 274608722.1641863,
       "bnb": 177163293.04006058,
       "eos": 203982116625.4576,
       "xrp": 45968039441.97331,
       "xlm": 373135737303.2976,
       "link": 7122944702.345991,
       "dot": 24479738895.90382,
       "yfi": 19949662.45133101,
       "usd": 98782612185.73718,
       "aed": 362793170383.0502,
       "ars": 104999015997716.55,
       "aud": 156710711623.69714,
       "bdt": 12016354158114.604,
       "bhd": 37238377663.493904,
       "bmd": 98782612185.73718,
       "brl": 571720864721.189,
       "cad": 141987657190.47397,
       "chf": 86683520280.00372,
       "clp": 91642267634331.48,
       "cny": 714618112204.6692,
       "czk": 2270420348737.88,
       "dkk": 678704705718.4226,
       "eur": 90994294693.17711,
       "gbp": 76375554698.42204,
       "gel": 274121748815.42062,
       "hkd": 767662399296.1664,
       "huf": 36265056385279.44,
       "idr": 1610083829382510.2,
       "ils": 358531490928.1331,
       "inr": 8606636701993.823,
       "jpy": 14570793384365.4,
       "krw": 143090999699021.28,
       "kwd": 30433737423.07939,
       "lkr": 29220469623691.734,
       "mmk": 207245920365676.5,
       "mxn": 2001562132630.1648,
       "myr": 436075841493.9367,
       "ngn": 149622529230656.16,
       "nok": 1071598320991.0375,
       "nzd": 173052319157.58368,
       "php": 5661168283492.799,
       "pkr": 27683695190265.574,
       "pln": 379226942094.1059,
       "rub": 8780515041354.504,
       "sar": 370586031875.7707,
       "sek": 995329056383.3273,
       "sgd": 131313208117.68321,
       "thb": 3328285910982.856,
       "try": 3607540898240.509,
       "twd": 3244225069056.3853,
       "uah": 4076408714458.2363,
       "vef": 9891102958.157864,
       "vnd": 2519324534280427.5,
       "zar": 1804227862005.98,
       "xdr": 74366118801.33978,
       "xag": 3030993317.5227013,
       "xau": 33873545.54461113,
       "bits": 1217336213099.3433,
       "sats": 121733621309934.33
     },
     "market_cap_percentage": {
       "btc": 58.255740672040034,
       "eth": 8.851667230504628,
       "usdt": 5.201925601636771,
       "xrp": 4.507658369441482,
       "bnb": 2.943399031265107,
       "sol": 2.3424341905758146,
       "usdc": 2.115836259597805,
       "ada": 0.9427569588425422,
       "doge": 0.9064213624236105,
       "trx": 0.8028867361265521
     },
     "market_cap_change_percentage_24h_usd": -7.588337974354569,
     "updated_at": 1741565323
   }
 }

 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviation()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviation()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
    
    var marketCapChangePercentage: Double {
        return marketCapChangePercentage24HUsd
    }
}

// 4) Dado o valor de faturamento mensal de uma distribuidora, detalhado por estado:

// SP – R$67.836,43
// RJ – R$36.678,66
// MG – R$29.229,88
// ES – R$27.165,48
// Outros – R$19.849,53

// Escreva um programa na linguagem que desejar onde calcule o percentual de representação que cada estado teve dentro do valor total mensal da distribuidora.

main() {
  List<Map<String, dynamic>> statesMonthRevenue = [
    {
      "state": "SP",
      'revenue': 67836.43,
    },
    {
      "state": "RJ",
      'revenue': 36678.66,
    },
    {
      "state": "MG",
      'revenue': 29229.88,
    },
    {
      "state": "ES",
      'revenue': 27165.48,
    },
    {
      "state": "Outros",
      'revenue': 19849.53,
    }
  ];

  double totalRevenue(List<Map<String, dynamic>> statesMonthRevenue) {
    double totalRevenue = 0;
    for (int index = 0; index < statesMonthRevenue.length; index++) {
      totalRevenue = totalRevenue + statesMonthRevenue[index]['revenue'];
    }
    return totalRevenue;
  }

  //Calcula a participação de cada estado e retorna uma lista nova com a chave 'share' e o percentual da participação de cada estado
  List<Map<String, dynamic>> calculateStateShareRevenue(
      List<Map<String, dynamic>> statesMonthRevenue) {
    double total = totalRevenue(statesMonthRevenue);
    List<Map<String, dynamic>> statesShareRevenueList = statesMonthRevenue;

    for (int index = 0; index < statesMonthRevenue.length; index++) {
      String revenueShare = (statesMonthRevenue[index]['revenue'] / total * 100)
          .toStringAsFixed(2); //salvo com duas casas decimais
      statesShareRevenueList[index].addAll({'share': revenueShare});
    }

    return statesShareRevenueList;
  }

  print(totalRevenue(statesMonthRevenue));
  print(calculateStateShareRevenue(statesMonthRevenue));
}

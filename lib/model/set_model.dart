class SetModel {
  String id;
  String name;
  String series;
  int printedTotal;
  int total;
  String ptcgoCode;
  String releaseDate;
  String symbol;
  String logo;

  SetModel(this.id, this.name, this.series, this.printedTotal, this.total,
      this.ptcgoCode, this.releaseDate, this.symbol, this.logo);

  SetModel.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.series = json['series'];
    this.printedTotal = json['printedTotal'];
    this.total = json['total'];
    this.ptcgoCode = json['ptcgoCode'];
    this.releaseDate = json['releaseDate'];
    this.symbol = json['symbol'];
    this.logo = json['logo'];
  }

  @override
  String toString() {
    return 'SetModel{id: $id, name: $name, series: $series, printedTotal: $printedTotal, total: $total, ptcgoCode: $ptcgoCode, releaseDate: $releaseDate, symbol: $symbol, logo: $logo}';
  }
}

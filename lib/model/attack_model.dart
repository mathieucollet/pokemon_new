class AttackModel {
  String name;
  List<dynamic> cost;
  int convertedEnergyCost;
  String damage;
  String text;

  AttackModel(
      this.name, this.cost, this.convertedEnergyCost, this.damage, this.text);

  AttackModel.fromJSON(Map<String, dynamic> json) {
    this.name = json['name'];
    this.cost = json['cost'];
    this.convertedEnergyCost = json['convertedEnergyCost'];
    this.damage = json['damage'];
    this.text = json['text'];
  }

  @override
  String toString() {
    return 'AttackModel{name: $name, cost: $cost, convertedEnergyCost: $convertedEnergyCost, damage: $damage, text: $text}';
  }
}

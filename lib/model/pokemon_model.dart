class PokemonModel {
  String name;
  String smallImage;
  String image;
  List<String> type;

  PokemonModel(this.name, this.smallImage, this.image, this.type);

  PokemonModel.fromJSON(Map<String, dynamic> json) {
    this.name = json['name'];
    this.smallImage = json['images']['small'];
    this.image = json['images']['large'];
    this.type = json.containsKey('types') ? json['types'].cast<String>() : [''];
  }
}

import 'package:pokemon_new/model/attack_model.dart';
import 'package:pokemon_new/model/set_model.dart';

class PokemonModel {
  String id;
  String name;
  String supertype;
  List<dynamic> subtypes;
  String hp;
  List<dynamic> types;
  List<dynamic> evolvesTo;
  List<AttackModel> attacks;
  List<Object> weaknesses;
  int convertedRetreatCost;
  SetModel set;
  String number;
  String artist;
  String rarity;
  List<dynamic> nationalPokedexNumbers;
  String smallImage;
  String image;
  Object prices;

  PokemonModel(
      this.id,
      this.name,
      this.supertype,
      this.subtypes,
      this.hp,
      this.types,
      this.evolvesTo,
      this.attacks,
      this.weaknesses,
      this.convertedRetreatCost,
      this.set,
      this.number,
      this.artist,
      this.rarity,
      this.nationalPokedexNumbers,
      this.smallImage,
      this.image,
      this.prices);

  PokemonModel.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.supertype = json['supertype'];
    this.subtypes = json['subtypes'];
    this.hp = json['hp'];
    this.types = json['types'];
    this.evolvesTo = json['evolvesTo'];
    this.attacks = <AttackModel>[];
    if (json['attacks'] != null) {
      json['attacks'].forEach((attack) {
        this.attacks.add(new AttackModel.fromJSON(attack));
      });
    }
    this.weaknesses = json['weaknesses'];
    this.convertedRetreatCost = json['convertedRetreatCost'];
    this.set = new SetModel.fromJSON(json['set']);
    this.number = json['number'];
    this.artist = json['artist'];
    this.rarity = json['rarity'];
    this.nationalPokedexNumbers = json['nationalPokedexNumbers'];
    this.smallImage = json['images']['small'];
    this.image = json['images']['large'];
    // this.prices = json['tcgplayer']['prices'] | [];
  }

  @override
  String toString() {
    return 'PokemonModel{id: $id, name: $name, supertype: $supertype, subtypes: $subtypes, hp: $hp, types: $types, evolvesTo: $evolvesTo, attacks: $attacks, weaknesses: $weaknesses, convertedRetreatCost: $convertedRetreatCost, set: $set, number: $number, artist: $artist, rarity: $rarity, nationalPokedexNumbers: $nationalPokedexNumbers, smallImage: $smallImage, image: $image, prices: $prices}';
  }
}

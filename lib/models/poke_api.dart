class PokeAPI {
  List<Pokemon> pokemonList;

  PokeAPI({this.pokemonList});

  PokeAPI.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemonList = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemonList.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonList != null) {
      data['pokemon'] = this.pokemonList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  int id;
  String pokeNum;
  String name;
  String img;
  List<String> types;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolution> nextEvolution;
  List<PrevEvolution> prevEvolution;

  Pokemon(
      {this.id,
      this.pokeNum,
      this.name,
      this.img,
      this.types,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution,
      this.prevEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pokeNum = json['num'];
    name = json['name'];
    img = json['img'];
    types = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance']?.toDouble();
    avgSpawns = json['avg_spawns']?.toDouble();
    spawnTime = json['spawn_time'];
    multipliers = json['multipliers']?.cast<double>();
    weaknesses = json['weaknesses']?.cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = new List<NextEvolution>();
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = new List<PrevEvolution>();
      json['prev_evolution'].forEach((v) {
        prevEvolution.add(new PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.pokeNum;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.types;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['candy_count'] = this.candyCount;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    if (this.nextEvolution != null) {
      data['next_evolution'] = this.nextEvolution.map((v) => v.toJson()).toList();
    }
    if (this.prevEvolution != null) {
      data['prev_evolution'] = this.prevEvolution.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}

class PrevEvolution {
  String num;
  String name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}

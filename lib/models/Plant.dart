class Plant {
  Plant(
      this.id,
      this.display_pid,
      this.alias,
      this.max_light_lux,
      this.min_light_lux,
      this.max_temp,
      this.min_temp,
      this.max_soil_moist,
      this.min_soil_moist,
      this.gifURL,
      [this.family,
      this.recoText,
      this.shortDescription,
      this.origin,
      this.infos,
      this.height,
      this.flower_color,
      this.cutting,
      this.sowing,
      this.flowering_season,
      this.picture_url,
      this.plant_type,
      this.planting_season,
      this.sickness]);

  Plant.empty(
      {this.id = "",
      this.display_pid = "",
      this.alias = "",
      this.max_light_lux = 0,
      this.min_light_lux = 0,
      this.max_temp = 0,
      this.min_temp = 0,
      this.max_soil_moist = 0,
      this.min_soil_moist = 0,
      this.gifURL = ""});

  String id;
  String display_pid;
  String alias;
  int max_light_lux;
  int min_light_lux;
  int max_temp;
  int min_temp;
  int max_soil_moist;
  int min_soil_moist;
  String gifURL;
  String? family;
  String? recoText;
  String? shortDescription;
  String? origin;
  String? infos;
  String? height;
  String? flower_color;
  String? cutting;
  String? sowing;
  String? flowering_season;
  String? picture_url;
  String? plant_type;
  String? planting_season;
  String? sickness;
}

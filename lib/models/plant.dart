class Plant {
  Plant(
      this.id,
      this.displayPID,
      this.alias,
      this.maxLight,
      this.minLight,
      this.maxTemp,
      this.minTemp,
      this.maxHumidity,
      this.minHumidity,
      this.gifURL,
      [this.family,
      this.recoText,
      this.shortDescription,
      this.origin,
      this.infos,
      this.height,
      this.flowerColor,
      this.cutting,
      this.sowing,
      this.floweringSeason,
      this.pictureURL,
      this.plantType,
      this.plantingSeason,
      this.sickness]);

  Plant.empty(
      {this.id = "",
      this.displayPID = "",
      this.alias = "",
      this.maxLight = 0,
      this.minLight = 0,
      this.maxTemp = 0,
      this.minTemp = 0,
      this.maxHumidity = 0,
      this.minHumidity = 0,
      this.gifURL = ""});

  String id;
  String displayPID;
  String alias;
  int maxLight;
  int minLight;
  int maxTemp;
  int minTemp;
  int maxHumidity;
  int minHumidity;
  String gifURL;
  String? family;
  String? recoText;
  String? shortDescription;
  String? origin;
  String? infos;
  String? height;
  String? flowerColor;
  String? cutting;
  String? sowing;
  String? floweringSeason;
  String? pictureURL;
  String? plantType;
  String? plantingSeason;
  String? sickness;
}

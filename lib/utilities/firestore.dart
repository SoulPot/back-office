import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soulpot_manager/models/analyzer.dart';
import 'package:soulpot_manager/models/plant.dart';

import '../models/objective.dart';

class FirestoreManager {
  static final FirebaseFirestore firestore =
      FirebaseFirestore.instanceFor(app: Firebase.apps.first);

  static Future<void> addPlant(Plant plantToAdd) {
    return firestore
        .collection('plants')
        .doc(plantToAdd.id)
        .set({
          'pid': plantToAdd.id,
          'display_pid': plantToAdd.displayPID,
          'alias': plantToAdd.alias,
          'max_light_lux': plantToAdd.maxLight,
          'min_light_lux': plantToAdd.minLight,
          'max_temp': plantToAdd.maxTemp,
          'min_temp': plantToAdd.minTemp,
          'max_soil_moist': plantToAdd.maxHumidity,
          'min_soil_moist': plantToAdd.minHumidity,
          'image_url': plantToAdd.gifURL,
          'family': plantToAdd.family,
          'recommendations': plantToAdd.recoText,
          'short_description': plantToAdd.shortDescription,
          'origin': plantToAdd.origin,
          'infos': plantToAdd.infos,
          'height': plantToAdd.height,
          'flower_colors': plantToAdd.flower_color,
          'cutting': plantToAdd.cutting,
          'sowing': plantToAdd.sowing,
          'flowering_season': plantToAdd.floweringSeason,
          'picture_url': plantToAdd.pictureURL,
          'plant_type': plantToAdd.plantType,
          'planting_season': plantToAdd.plantingSeason,
        });
  }

  static Future<List<Plant>> getPlants() async {
    List<Plant> plants = [];
    await firestore.collection('plants').get().then((value) {
      for (var plantData in value.docs) {
        Plant plant = Plant(
          plantData.data()['pid'],
          plantData.data()['display_pid'],
          plantData.data()['alias'],
          plantData.data()['max_light_lux'],
          plantData.data()['min_light_lux'],
          plantData.data()['max_temp'],
          plantData.data()['min_temp'],
          plantData.data()['max_soil_moist'],
          plantData.data()['min_soil_moist'],
          plantData.data()['image_url'],
          plantData.data()['family'],
          plantData.data()['recommendations'],
          plantData.data()['short_description'],
          plantData.data()['origin'],
          plantData.data()['infos'],
          plantData.data()['height'],
          plantData.data()['flower_colors'],
          plantData.data()['cutting'],
          plantData.data()['sowing'],
          plantData.data()['flowering_season'],
          plantData.data()['picture_url'],
          plantData.data()['plant_type'],
          plantData.data()['planting_season'],
          plantData.data()['sickness'],
        );
        plants.add(plant);
      }
    });
    return plants;
  }

  static Future<Plant> getPlantByID(String plantID) async {
    Plant plant = Plant.empty();
    await firestore.collection("plants").doc(plantID).get().then((value) {
      plant = Plant(
        value.data()!['pid'],
        value.data()!['display_pid'],
        value.data()!['alias'],
        value.data()!['max_light_lux'],
        value.data()!['min_light_lux'],
        value.data()!['max_temp'],
        value.data()!['min_temp'],
        value.data()!['max_soil_moist'],
        value.data()!['min_soil_moist'],
        value.data()!['image_url'],
      );
    });
    return plant;
  }

  static Future<void> deletePlant(String plantId) {
    return firestore
        .collection("plants")
        .doc(plantId)
        .delete();
  }

  static Future<List<Analyzer>> getAnalyzers() async {
    List<Analyzer> analyzers = [];
    await firestore.collection('analyzers').get().then((value) async {
      for (var analyzerData in value.docs) {
        await FirebaseFirestore.instance
            .collection('plants')
            .doc(analyzerData.data()['plantID'])
            .get()
            .then((plantData) {
          Analyzer analyzer = Analyzer(analyzerData.id,
              plantData.data()!['image_url'], plantData.data()!['alias']);
          analyzers.add(analyzer);
        });
      }
    });
    return analyzers;
  }

  static Future<void> deleteAnalyzer(String analyzerId) {
    return firestore
        .collection("analyzers")
        .doc(analyzerId)
        .delete();
  }

  static Future<bool> checkIfUserIsAdmin(String userID) async {
    bool isAdmin = false;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((value) {
      isAdmin = value.data()!['isAdmin'];
    });
    return isAdmin;
  }

  static Future<void> updatePlant(Plant plantToUpdate) {
    return firestore
        .collection('plants')
        .doc(plantToUpdate.id)
        .update({
      'display_pid': plantToUpdate.displayPID,
      'alias': plantToUpdate.alias ,
      'max_light_lux': plantToUpdate.maxLight,
      'min_light_lux': plantToUpdate.minLight,
      'max_temp': plantToUpdate.maxTemp,
      'min_temp': plantToUpdate.minTemp,
      'max_soil_moist': plantToUpdate.maxHumidity,
      'min_soil_moist': plantToUpdate.minHumidity,
      'image_url': plantToUpdate.gifURL,
      'family': plantToUpdate.family,
      'recommendations': plantToUpdate.recoText,
      'short_description': plantToUpdate.shortDescription,
      'origin': plantToUpdate.origin,
      'infos': plantToUpdate.infos,
      'height': plantToUpdate.height,
      'flower_colors': plantToUpdate.flower_color,
      'cutting': plantToUpdate.cutting,
      'sowing': plantToUpdate.sowing,
      'flowering_season': plantToUpdate.floweringSeason,
      'picture_url': plantToUpdate.pictureURL,
      'plant_type': plantToUpdate.plantType,
      'planting_season': plantToUpdate.plantingSeason,
    });
  }

  static Future<List<Objective>> getObjectives() async {
    List<Objective> objectives = [];
    await firestore.collection('objectives').get().then((value) {
      for (var objectiveData in value.docs) {
        Objective objective = Objective(
          objectiveData.id,
          objectiveData.data()['nom'],
          objectiveData.data()['description'],
          objectiveData.data()['field'],
          objectiveData.data()['objective_value'],
          objectiveData.data()['type'],
        );
        objectives.add(objective);
      }
    });
    return objectives;
  }

  static Future<void> addObjective(Objective objectiveToAdd) {
    return firestore
        .collection('objectives')
        .doc(objectiveToAdd.id)
        .set({
      'nom': objectiveToAdd.name,
      'description': objectiveToAdd.description ,
      'field': objectiveToAdd.field,
      'objective_value': objectiveToAdd.objectiveValue,
      'type': objectiveToAdd.type,
    });
  }

  static Future<void> updateObjective(Objective objectiveToUpdate) {
    return firestore
        .collection('plants')
        .doc(objectiveToUpdate.id)
        .update({
      'nom': objectiveToUpdate.name,
      'description': objectiveToUpdate.description ,
      'field': objectiveToUpdate.field,
      'objective_value': objectiveToUpdate.objectiveValue,
      'type': objectiveToUpdate.type,
    });
  }

  static Future<void> deleteObjective(String objectiveID) {
    return firestore
        .collection("objectives")
        .doc(objectiveID)
        .delete();
  }



}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soulpot_manager/models/Analyzer.dart';
import 'package:soulpot_manager/models/Plant.dart';

import '../models/Objective.dart';

class FirestoreManager {
  static final FirebaseFirestore firestore =
      FirebaseFirestore.instanceFor(app: Firebase.apps.first);

  static Future<void> addPlant(Plant plantToAdd) {
    return firestore
        .collection('plants')
        .doc(plantToAdd.id)
        .set({
          'pid': plantToAdd.id,
          'display_pid': plantToAdd.display_pid,
          'alias': plantToAdd.alias,
          'max_light_lux': plantToAdd.max_light_lux,
          'min_light_lux': plantToAdd.min_light_lux,
          'max_temp': plantToAdd.max_temp,
          'min_temp': plantToAdd.min_temp,
          'max_soil_moist': plantToAdd.max_soil_moist,
          'min_soil_moist': plantToAdd.min_soil_moist,
          'image_url': plantToAdd.gifURL,
          'family': plantToAdd.family,
          'recoText': plantToAdd.recoText,
          'shortDescription': plantToAdd.shortDescription,
          'origin': plantToAdd.origin,
          'infos': plantToAdd.infos,
          'height': plantToAdd.height,
          'flower_color': plantToAdd.flower_color,
          'cutting': plantToAdd.cutting,
          'sowing': plantToAdd.sowing,
          'flowering_season': plantToAdd.flowering_season,
          'picture_url': plantToAdd.picture_url,
          'plant_type': plantToAdd.plant_type,
          'planting_season': plantToAdd.planting_season,
        })
        .then((value) => print("Plant Added"))
        .catchError((error) => print("Failed to add plant: $error"));
  }

  static Future<List<Plant>> getPlants() async {
    List<Plant> plants = [];
    await firestore.collection('plants').get().then((value) {
      value.docs.forEach((plantData) {
        Plant plant = new Plant(
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
          plantData.data()['shortDescription'],
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
      });
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
        .delete()
        .then((value) => print("Plant Deleted"))
        .catchError((error) => print("Failed to delete plant: $error"));
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
          Analyzer analyzer = new Analyzer(analyzerData.id,
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
        .delete()
        .then((value) => print("Analyzer Deleted"))
        .catchError((error) => print("Failed to delete analyzer: $error"));
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
      'display_pid': plantToUpdate.display_pid,
      'alias': plantToUpdate.alias ,
      'max_light_lux': plantToUpdate.max_light_lux,
      'min_light_lux': plantToUpdate.min_light_lux,
      'max_temp': plantToUpdate.max_temp,
      'min_temp': plantToUpdate.min_temp,
      'max_soil_moist': plantToUpdate.max_soil_moist,
      'min_soil_moist': plantToUpdate.min_soil_moist,
      'image_url': plantToUpdate.gifURL,
      'family': plantToUpdate.family,
      'recoText': plantToUpdate.recoText,
      'shortDescription': plantToUpdate.shortDescription,
      'origin': plantToUpdate.origin,
      'infos': plantToUpdate.infos,
      'height': plantToUpdate.height,
      'flower_color': plantToUpdate.flower_color,
      'cutting': plantToUpdate.cutting,
      'sowing': plantToUpdate.sowing,
      'flowering_season': plantToUpdate.flowering_season,
      'picture_url': plantToUpdate.picture_url,
      'plant_type': plantToUpdate.plant_type,
      'planting_season': plantToUpdate.planting_season,
    })
        .then((value) => print("Plant Updated"))
        .catchError((error) => print("Failed to update plant: $error"));
  }

  static Future<List<Objective>> getObjectives() async {
    List<Objective> objectives = [];
    await firestore.collection('objectives').get().then((value) {
      value.docs.forEach((objectiveData) {
        Objective objective = new Objective(
          objectiveData.id,
          objectiveData.data()['nom'],
          objectiveData.data()['description'],
          objectiveData.data()['field'],
          objectiveData.data()['objective_value'],
          objectiveData.data()['type'],
        );
        objectives.add(objective);
      });
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
      'objective_value': objectiveToAdd.objective_value,
      'type': objectiveToAdd.type,
    })
        .then((value) => print("Objective Updated"))
        .catchError((error) => print("Failed to update objective: $error"));
  }

  static Future<void> updateObjective(Objective objectiveToUpdate) {
    return firestore
        .collection('plants')
        .doc(objectiveToUpdate.id)
        .update({
      'nom': objectiveToUpdate.name,
      'description': objectiveToUpdate.description ,
      'field': objectiveToUpdate.field,
      'objective_value': objectiveToUpdate.objective_value,
      'type': objectiveToUpdate.type,
    })
        .then((value) => print("Objective Updated"))
        .catchError((error) => print("Failed to update objective: $error"));
  }

  static Future<void> deleteObjective(String objectiveID) {
    return firestore
        .collection("objectives")
        .doc(objectiveID)
        .delete()
        .then((value) => print("Objective Deleted"))
        .catchError((error) => print("Failed to delete objective: $error"));
  }

}

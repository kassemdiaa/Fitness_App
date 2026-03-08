import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:flutter/material.dart';

class SelectedCouchProvider extends ChangeNotifier {
  CouchModel selectedCouch = CouchModel.couches[1];
  void selectCouch(CouchModel couch){
    selectedCouch=couch;
    notifyListeners();
  }
}
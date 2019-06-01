import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils.dart';

class Skill {
  static const NAME = 'name';
  String name;
  static const STATUS = 'status';
  String status;
  static const TYPE = 'type';
  String type;
  static const COLOR = 'color';
  String color;

  Skill.fromDocument(DocumentSnapshot document) {
    this.name = getValueOrEmpty(document, NAME);
    this.status = getValueOrEmpty(document, STATUS);
    this.type = getValueOrEmpty(document, TYPE);
    this.color = getValueOrEmpty(document, COLOR);
  }

  Skill.fromMap(Map document) {
    this.name = document[NAME];
    this.status = document[STATUS];
    this.type = document[TYPE];
    this.color = document[COLOR];
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

String getValueOrEmpty(doc, key) {
  return doc != null ? doc[key] != null ? doc[key] : "" : "";
}

bool getValueOrFalse(doc, key) {
  return doc[key] != null ? doc[key] : false;
}

class Skill {
  static const NAME = 'name';
  String name;
  static const STATUS = 'status';
  String status;
  static const TYPE = 'type';
  String type;

  Skill.fromDocument(DocumentSnapshot document) {
    this.name = getValueOrEmpty(document, NAME);
    this.status = getValueOrEmpty(document, STATUS);
    this.type = getValueOrEmpty(document, TYPE);
  }
}


String getValueOrEmpty(doc, key) {
  return doc != null ? doc[key] != null ? doc[key] : "" : "";
}

bool getValueOrFalse(doc, key) {
  return doc[key] != null ? doc[key] : false;
}

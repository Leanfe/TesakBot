import 'dart:io';

import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

class ConfigManager {

  File yamlConfig;

  bool isLoaded;
  Map yaml;

  String chat_id;

  void init(String chat_id) {
    this.chat_id = chat_id;

    if (isLoaded) return;

    yamlConfig = new File("./data/${chat_id}.yml");
    if (!yamlConfig.existsSync()) {
      yamlConfig.create();
    }
  }

  Map loadData() {
    String yamlString = yamlConfig.readAsStringSync();
    isLoaded = true;
    yaml = loadYaml(yamlString);
    return yaml;
  }

  void createBaseData() {
    if (isLoaded) return;

    var yamlWriter = YAMLWriter();

    yamlWriter.write(
        {
          "name": "${chat_id}",
          "topList": {
            "a": "b",
            "c": "d"
          }
        }
    );
  }

  void addNewLine(String key, String value) {
    if (!isLoaded) return;

    //TODO
  }
}
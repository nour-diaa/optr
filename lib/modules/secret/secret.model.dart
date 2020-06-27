// To parse this JSON data, do
//
//     final masterSecret = masterSecretFromJson(jsonString);

import 'dart:convert';

import 'package:optr/modules/base.model.dart';

/// Master Secret Model
class Secret implements BaseModel {
  /// Master secret Hash
  String hash;

  /// ID of Master Secret
  String id;

  /// Friendly name of the Master Secret
  String name;

  /// Count of accounts using this Master Secret
  int accountCount;

  /// Hash to check if values changed
  String valueSignature;

  final PasswordType _type = PasswordType.masterSecret;

  /// Constructor
  Secret({this.hash = '', this.id, this.name = '', this.accountCount = 0});

  /// Creates Master Secret form Json
  factory Secret.fromJson(String str) => Secret.fromMap(json.decode(str));

  /// Creates Master Seret from Map
  factory Secret.fromMap(Map<String, dynamic> json) => Secret(
        hash: json["hash"],
        id: json["id"],
        name: json["name"],
        accountCount: json["accountCount"],
      );

  /// Is MasterSecret ready to save
  bool validate() {
    return id.isNotEmpty &&
        hash.isNotEmpty &&
        name.isNotEmpty &&
        !accountCount.isNaN;
  }

  /// Converts Master Secret to Json
  String toJson() => json.encode(toMap());

  /// Converts Master Secret to Map
  Map<String, dynamic> toMap() => {
        "hash": hash,
        "id": id,
        "name": name,
        "type": _type.toString(),
        "accountCount": accountCount,
      };
}
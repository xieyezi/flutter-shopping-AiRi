// Get a location using getDatabasesPath
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _dbName = "cache.db";

class KeyValueStore {
  /// 添加
  static put(String name, Object object) async {
    final database = await _getDB();
    final data = jsonEncode(object);
    database.transaction((txn) async {
      txn.rawInsert('INSERT OR REPLACE INTO "cache" VALUES (?, ?, ?,?);', [
        generateMd5(name),
        DateTime.now().millisecondsSinceEpoch,
        data,
        generateMd5(data)
      ]);
    });
  }

  /// 获取
  static Future<KeyValueStoreItem> get(String name) async {
    final database = await _getDB();
    List<Map> list = await database
        .rawQuery('SELECT * FROM "cache" WHERE name=?', [generateMd5(name)]);
    if (list.isEmpty) {
      // return KeyValueStoreItem();
      throw Exception("没有查询到缓存数据");
    }
    return KeyValueStoreItem.fromJson(Map.from(list.first));
  }

  /// getDB
  static Future<Database> _getDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print("----初始化数据表:" + databasesPath);
      await db.execute("""CREATE TABLE IF NOT EXISTS "cache" (
        "name" char NOT NULL,
        "create_time" integer NOT NULL,        
        "content" text,
        "content_hash" char,
        PRIMARY KEY ("name"));
     """);
    });
  }
}

class KeyValueStoreItem {
  final String name;
  final int createTime;
  final dynamic content;
  final String contentHash;

  bool get isEmpty {
    return this.createTime < 1;
  }

  KeyValueStoreItem(
      {required this.name, required this.createTime, this.content, required this.contentHash});

  factory KeyValueStoreItem.fromJson(Map<String, dynamic> json) {
    return KeyValueStoreItem(
        name: json["name"].toString(),
        createTime: json["create_time"],
        content: jsonDecode(json["content"]),
        contentHash: json["content_hash"]);
  }
}

///Generate MD5 hash
String generateMd5(String data) {
  var content = Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class Servicios{
  final int? id;
  final String nombre;
  final String apellido;
  final String fecha;
  final String tipoServ;
  final String telefono;
  final String municipio;
  final String direccion;
  Servicios({this.id, required this.nombre, required this.apellido, required this.fecha, required this.tipoServ, required this.telefono, required this.municipio, required this.direccion});

  factory Servicios.fromMap(Map<String, dynamic>json)=> new Servicios(
    id: json['id'],
    nombre: json['nombre'],
    apellido: json['apellido'],
    fecha : json["fecha"],
    tipoServ : json ["tipoServ"] ,
    telefono : json ['telefono'] ,
    municipio : json [ "municipio" ]      ,
    direccion : json[ "direccion" ],
    );

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'nombre':nombre,
      'apellido':apellido,
      'fecha':fecha,
      'tipoServ':tipoServ,
      'telefono':telefono,
      "municipio":municipio,
      "direccion":direccion
    };
  }
}

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();


  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'servicios.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,

    );
  }
  static Future _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE servicios(
        id INTEGER PRIMARY KEY,
        nombre TEXT,
        apellido TEXT,
        fecha TEXT,
        tipoServ TEXT,
        telefono TEXT,
        municipio TEXT,
        direccion TEXT
      )'''
    );
  }
  static Future<List<Servicios>> getServices() async {
    Database db = await instance.database;
    var servicios = await db.query('servicios');
    List<Servicios> ServicioList = servicios.isNotEmpty
    ? servicios.map((c)=> Servicios.fromMap(c)).toList()
    : [];
    return ServicioList;
  }

  Future<int> add(Servicios servicios) async{
    Database db = await instance.database;
    return await db.insert('servicios', servicios.toMap());
  }
  Future<int> remove(int id) async{
    Database db = await instance.database;
    return await db.delete('servicios', where: 'id = ?', whereArgs: [id]);
  }
  Future<int> update(Servicios servicios) async{
    Database db = await instance.database;
    return await db.update('servicios', servicios.toMap(), where: 'id = ?', whereArgs: [servicios.id]);
  }

} 
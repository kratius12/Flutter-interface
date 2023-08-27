import 'package:flutter/material.dart';
import 'package:prueba/carObra.dart';
import 'package:prueba/cardService.dart';
import 'package:prueba/miperfil.dart';

class _ObrasPageState extends StatelessWidget{
  
    final scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text ("sapo hijueputa"),
          leading: IconButton(
            icon: Icon(Icons.menu,
            color: Colors.black
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
              }else{
                scaffoldKey.currentState!.openDrawer();
              }
            },
          ),
        ),
        drawer: Drawer(
          child: ListView (

            padding: EdgeInsets.zero,
            children: <Widget> [
              DrawerHeader(
              child:Container(
                height: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/knxT0t0.png", ),    
                    fit: BoxFit.contain, 
                  )
                ),
              ),
            ),
              ListTile(
                leading: Icon(Icons.person_2_outlined),
                title: Text('Mi perfil'),
                
                onTap: () {
                  Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MiPerfil(title: "Mi perfil",)));
                }
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: Text('Solicitar Cita'),
                onTap: () {
                  Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     cardService()));
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text('Obras y tiempos'),
                onTap: () {
                  Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    cardObra()));
                },
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('Cerrar sesión'),
                onTap: (){
                  (Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     _ObrasPageState())));
                },
              )
              
            ],
          ),
        ),
      );
    }
}

void main() => runApp(const CardExampleApp());

class CardExampleApp extends StatelessWidget {
  const CardExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Sample')),
        body: const CardExample(),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}
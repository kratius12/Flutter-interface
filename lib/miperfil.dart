import 'package:flutter/material.dart';
import 'package:prueba/carObra.dart';
import 'package:prueba/cardService.dart';
import 'package:prueba/main.dart';


class MiPerfil extends StatefulWidget{
  const MiPerfil({super.key, required this.title});

  final String title;

  @override
  State<MiPerfil> createState()=> _MiPerfil();
}


class _MiPerfil extends State<MiPerfil>{
    
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
                title: Text('Citas'),
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
                                    const HomePageApp(title: "Pagina de inicio",))));
                },
              )
              
            ],
          ),
        ),
      );
    }
}


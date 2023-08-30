import 'package:flutter/material.dart';
import 'package:prueba/cardService.dart';
import 'package:prueba/main.dart';
import 'package:prueba/miperfil.dart';



class cardObra extends StatelessWidget{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).shadowColor,
        title: Text ("Solicitar cita", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.menu,
          color: Colors.white
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
      
      body: Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget> [
            const ListTile(
              leading: Icon(Icons.album, color: Colors.green,),
              title: Text("Estuco y pintura"),
              subtitle: Text("Kevin Castrillon\n 2 dias\n en proceso"),
            ),
            
          ]
        )
      )));
  }
}

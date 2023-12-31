// ignore_for_file: file_names
import 'package:flutter/material.dart' show AppBar, BuildContext, Card, Center, CircularProgressIndicator, Colors, Column, ConnectionState, Container, CrossAxisAlignment, Drawer, DrawerHeader, EdgeInsets, FloatingActionButton, FloatingActionButtonLocation, FutureBuilder, GlobalKey, Icon, IconButton, Icons, InlineSpan, ListTile, ListView, MainAxisAlignment, MaterialPageRoute, Navigator, Padding, Row, Scaffold, ScaffoldState, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextButton, TextSpan, Theme, Widget, WidgetSpan;
import 'package:prueba/carObra.dart';
import 'package:prueba/cardService.dart';
import 'package:prueba/databasehelper.dart';
import 'package:prueba/main.dart';
import 'package:prueba/miperfil.dart';
import 'package:prueba/servicio.dart';



// ignore: camel_case_types
class CardUser extends StatefulWidget{

  const CardUser({super.key});

  @override
  State<CardUser> createState() => _cardUser();
}

// ignore: camel_case_types
class _cardUser extends State<CardUser> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late int selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).shadowColor,
        title: const Text("Usuarios registrados"),
        leading: IconButton(
          icon: const Icon(Icons.menu,
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
                // decoration: BoxDecoration(
                //   // image: DecorationImage(
                //   //   image: NetworkImage("https://i.imgur.com/knxT0t0.png", ),
                    
                //   //   fit: BoxFit.contain, 
                //   // )
                // ),
              ),
              
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text('Mi perfil'),
              
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MiPerfil(title: "Mi perfil",)));
              }
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Citas'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   const cardService()));
              },
            ),ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Usuarios'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   const CardUser()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Obras y tiempos'),
              onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  cardObra()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: const Text('Cerrar sesión'),
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
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: DatabaseHelper.getUsuarios(),
          builder: (context, snapshot){
            if(snapshot.connectionState != ConnectionState.done){
              return const CircularProgressIndicator();
            }
            List<Usuarios>? servicio = snapshot.data;
            Widget list;
            if(servicio==null || servicio.isEmpty){
              list= const Text("No Hay ninguna cita agendada");
            }else{
              list= ListView.builder(
                  itemCount: servicio.length,
                  itemBuilder: (context, index){
                    var s = servicio[index]; 
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(1.0),
                              
                                child: Icon(Icons.album, color: Colors.green,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${s.nombre} ${s.apellido}"),
                                Text(s.email),
                                Text(s.password),
                              ],
                            ),Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton.icon(icon: const Icon(Icons.calendar_month), label: const Text.rich(TextSpan(children: <InlineSpan>[WidgetSpan(child: Text("Editar"))])), onPressed:(){
                                } ,),
                                TextButton.icon(icon: const Icon(Icons.cancel), label: const Text.rich(TextSpan(children: <InlineSpan>[WidgetSpan(child: Text("Eliminar"))])), onPressed:()async{
                                  setState(() {
                                    
                                  });
                                } ,)
                              ],
                            )
                          ]),
                      ),
                    );
                  },
                );
            }
            return Center(
              child: SizedBox(
                width: 350,
                child: list
            ));
          },
        ),
      ),floatingActionButton: const bottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
      );
  }
}

// ignore: camel_case_types
class bottom extends StatelessWidget{
  const bottom({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 16),

                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    const ServicioPage(title: "Servicio Page")));
                  },
                  label: const Text('Agendar'),
                  icon: const Icon(Icons.add),
                ),
              ],
            );
  }
}
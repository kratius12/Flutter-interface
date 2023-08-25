import 'package:flutter/material.dart';
import 'package:prueba/login.dart';
import 'package:prueba/registrarse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePageApp(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePageApp extends StatelessWidget {
  const HomePageApp({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Column(
          children: [
            Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 18, color: Colors.indigo),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                '',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 207, 47, 248)),
              ),
              Image.network("https://i.imgur.com/knxT0t0.png", height: 200),
              const Text(''),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(20),
                        textStyle: const TextStyle(fontSize: 20)),
                    child: const Text('Inicia sesion!'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginPage(title: "Registro cliente")));
                    }),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        side: const BorderSide(width: 1, color: Colors.brown),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(20),
                        textStyle: const TextStyle(fontSize: 20)),
                    child: const Text('Registrate!'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage(
                                  title: "Registro cliente")));
                    }),
              ),
            ]),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:new_movies/movie_dec_screen.dart';
import 'package:new_movies/themovies_controller.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("The movies App"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return TileWidget();
            },
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
         final controller = Controller();
         controller.getUpcomingMovies();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDecScreen()));
        },
        leading: CircleAvatar(
          radius: 20,
          // child: Image.asset(
          //   "asset/dice-1502706_640.png",
          //   fit: BoxFit.cover,
          // ),
          backgroundImage:AssetImage( "asset/dice-1502706_640.png") ,
        ),
        title: Text("Angel Has Fallen"),
        subtitle: Text("2019-08-17"),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

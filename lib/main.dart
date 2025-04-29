import 'package:flutter/material.dart';
import 'package:new_movies/movie.dart';
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
          child: FutureBuilder(
            future:  Controller().getUpcomingMovies(),
            builder: (context, AsyncSnapshot<List<Movie>?> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              return ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return TileWidget(movie: snapshot.data?[index],);
                },
              );
            }
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.movie});
final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
         // final controller = Controller();
         // // controller.getUpcomingMovies();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDecScreen()));
        },
        leading: CircleAvatar(
          radius: 20,
          // child: Image.asset(
          //   "asset/dice-1502706_640.png",
          //   fit: BoxFit.cover,
          // ),
          backgroundImage:NetworkImage( "http://image.tmdb.org/t/p/w92/${movie?.poster}") ,
        ),
        title: Text(movie?.title??''),
        subtitle: Text(movie?.releaseDate??''),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

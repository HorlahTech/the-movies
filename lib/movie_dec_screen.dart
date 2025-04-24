
import 'package:flutter/material.dart';

class MovieDecScreen extends StatelessWidget {
  const MovieDecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("data"),
        backgroundColor: Colors.deepOrangeAccent,
      ) ,
      body: SafeArea(
        child: Column(children:[
          Expanded(child: Image.asset("asset/dice-1502706_640.png", fit: BoxFit.cover,))
           ,  SizedBox(height: 20,) , Text("hjjdvdyugfuygsdygtysdtdftf7tef67etfkhjstfttyfstdsrsyf67er6t67wqetrrqwe45qwe5eq45ew4eqefdghjvujfdyfb njhg")] ),
      ),
    );
  }
}

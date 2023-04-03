import 'dart:math';
import 'package:animal_db/modals/db_modal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ANIMALS",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color((Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.8),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
                children: AnimalsType.animalType.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "$e",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("DetailsPage",arguments: "$e");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 2.3,
                            width: MediaQuery.of(context).size.width / 1.1,
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                "https://source.unsplash.com/random/?$e",
                                fit: BoxFit.fill,
                                height: 500,
                                width: 500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList()),
          ),
        ),
      ),
    );
  }
}

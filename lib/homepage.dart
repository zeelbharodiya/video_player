import 'package:flutter/material.dart';
import 'package:mb_videoplayer/views/screens/global.dart';
import 'package:mb_videoplayer/views/screens/global.dart';

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
        title: Text(
          "Video Player",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15, left: 15, right: 15),
            child: Column(
              children: [
                ...Global.alllist
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Global.AllData = e;
                              Navigator.pushNamed(context, 'OpenPage',
                                  arguments: e);
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: Image.network(
                                    "${e['image']}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: 55,
                                  width: 200,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                "${e['text']}",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

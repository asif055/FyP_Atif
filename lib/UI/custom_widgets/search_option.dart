import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Searchoption extends StatefulWidget {
  const Searchoption({Key? key}) : super(key: key);

  @override
  _SearchoptionState createState() => _SearchoptionState();
}

class _SearchoptionState extends State<Searchoption> {
  ///here we are to create the map for the following detail from the below context
  final optionMap = <String, bool>{
    'Developement': true,
    'Business': false,
    'Data': false,
    'Design': false,
    'Operations': false,
  };
  @override
  Widget build(BuildContext context) {
    ///Here are the key for the Map values
    ///Then we have to Convert those key to the List
    ///Sere we go
    var keys = optionMap.keys.toList();
    return Container(
      height: 25,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 25),
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  ///Here are we get the result from show
                  var res = optionMap[keys[index]] ?? false;
                  optionMap[keys[index]] = !res;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: optionMap[keys[index]] != null &&
                            optionMap[keys[index]] == true
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    )),
                child: Row(
                  children: [
                    Text(
                      keys[index],
                      style: TextStyle(
                          fontSize: 15,
                          color: optionMap[keys[index]] != null &&
                                  optionMap[keys[index]] == true
                              ? Colors.white
                              : Colors.black),
                    ),

                    ///We have to do all this for the close icon
                    if (optionMap[keys[index]] != null &&
                        optionMap[keys[index]] == true)
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.close,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      )
                  ],
                ),
              )),
          separatorBuilder: (_, index) => SizedBox(
                width: 10,
              ),

          ///beause we have to find the length of the optionMap
          itemCount: optionMap.length),
    );
  }
}

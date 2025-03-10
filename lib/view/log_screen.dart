import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded( //stitch
                  flex: 3,
                  child: Image.asset(
                    'assets/img/stitch.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                  
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Iniciar Sesion',
                          style: TextStyle(
                            fontSize: 22,  
                            color: Colors.white
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                            
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Correo electronico',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(Icons.email,color: Colors.white,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25),
                              
                              ),
                            
                            ), 
                            
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40,),
                        TextFormField(
                          
                          decoration: const InputDecoration(
                            focusColor: Colors.black,
                            
                            hintStyle: TextStyle(
                              color: Colors.white
                            ),
                            hintText: 'Contrasenia',
                            prefixIcon: Icon(Icons.password, color: Colors.white,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)
                              ),
                            
                            ), 
                            
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },  
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value){
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              'Recordar usuario',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {} ,
                                child: Text(
                                  'Iniciar sesion',
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.2
                                  ),
                                  
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: Icon(FontAwesomeIcons.facebook),
                              color: Colors.blue,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(FontAwesomeIcons.google),
                              color: Colors.green,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(FontAwesomeIcons.instagram),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                )
              ],
            ),
          )
        ]
      ),
    );
  }
}
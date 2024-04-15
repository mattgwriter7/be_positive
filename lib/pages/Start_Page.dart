// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

//  this page is Stateful (just to serve as an example)

//  classes
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({super.key});

  @override
  State<Start_Page> createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {

  // (this page) variables
  final String filename = 'Start_Page.dart';

  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log( filename, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));

    //  setupApp();
  }

  @override
  void dispose() {
    Utils.log( filename, 'dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log( filename, '_buildTriggered()');
  }

  Widget placeHolder( String str ) {
    return Center(child: Text( str, style: TextStyle( fontSize: 22) ));
  }

  Widget buildDay( int num ) {
    return Container(width: 100, height: 100, color: Colors.limeAccent, child: Center(child: Text( num.toString(), style: TextStyle( fontSize: 64) )));
  }

  // addPostFrameCallback" is called after build completed 
  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( filename, '_addPostFrameCallbackTriggered() (build completed)');
  }

  @override
  Widget build(BuildContext context) {
    
    _buildTriggered();
    
    return WillPopScope(
      onWillPop: () async {
        Utils.log( filename, 'pop() forbidden!');
        return false;  //  this allows the back button to work (if true)
      },      
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            // title: Text( filename ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
          ), 
          drawer: Drawer(),
          body: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children : [
            





                  /* START OF 3 THINGS HOLDER */
                  Container(
                      width: double.infinity,
                      height: 360,
                      color: Colors.green,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,  //  this is where an animation can happen
                            top: 0,
                            child: Opacity(opacity: 1, child: Image.asset('./assets/images/clouds_1300x375.png')),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0,200),
                              child: Container(
                                width: 200,
                                child: Image.asset('./assets/images/heading_be_positive.png')
                              ),
                            )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                color: Color(0xfffcfcfc),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,40,0,0),
                                  child: placeHolder('1. Show Gratitude'),
                                ),
                              ),                         
                            ],
                          ),    
                                                
                          Positioned(
                            left: 0,
                            bottom: 110,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              color: Colors.transparent,   
                              child: Center(
                                child: Container(
                                  //color: Colors.black,
                                  width: MediaQuery.of(context).size.width * .9,
                                  decoration: BoxDecoration(
                                    color: Color(0xff58afdd),
                                    border: Border.all(
                                      color: Color(0xff46a2da),
                                      width: 7,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Center(child: Text(
                                    'Every day do 3 positive things...',
                                    style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
                                ),
                              ),                     
                            ),
                          ), 
            
                        ],
                      ),
                      
                  ), 
                  Container(
                      width: double.infinity,
                      height: 135,
                      color: Colors.yellow,
                      child: placeHolder('2. Deed'),
                  ), 
                  Container(
                      width: double.infinity,
                      height: 135,
                      color: Colors.orange,
                      child: placeHolder('3. Reflection'),
                  ),






                  /* START OF CAROUSEL HOLDER */
                  Container(
                      width: double.infinity,
                      height: 498,
                      color: Colors.pink,
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.white,
                              child: placeHolder('This is Day 1'),
                          ), 
                          Container(
                              width: double.infinity,
                              height: 118,
                              color: Colors.grey,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    buildDay(1),    
                                    SizedBox(width: 12),
                                    buildDay(2),
                                    SizedBox(width: 12),
                                    buildDay(3),
                                    SizedBox(width: 12),
                                    buildDay(4),
                                    SizedBox(width: 12),
                                    buildDay(5),
                                    SizedBox(width: 12),
                                    buildDay(6),
                                    SizedBox(width: 12),
                                    buildDay(7),
                                    SizedBox(width: 10),
                                  ]
                                ),
                              ),
                          ),
                          Container(
                            height: 300,
                            color: Colors.black,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  'This is the first day you have ever use this app.  From this day forward ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                                  style: TextStyle( fontSize: 24, color: Colors.white,),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      
                      
                  ),
                ]
              ),
            ), 
          ),
        ),
      ),
    );
  }
}
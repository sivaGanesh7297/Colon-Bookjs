import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ProfilePage extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          appBar:  AppBar(
            backgroundColor:Color(0xFF1c1d1f),
            leading:   GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  Navigator.pop(context);
                },
                child:Icon(
                  Icons.arrow_back_ios,
                  color:  Color(0xFFFFFFFF),
                  size: 15,
                )),
            title: Text("Colon InfoTech",style:TextStyle(color: Colors.white)),

          ),
          body: getBody(),
        );

  }

  Widget getBody() {
    return ListView(children: [



      SizedBox(
        height: 15,


      ),
      Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFF1c1d1f)),
              child: Padding(
                padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap:() async{
                        const url = "https://colaninfotech.com/";
                        if (await canLaunch(url) != null)
                          await launch(url);
                        else
                          throw "Could not launch $url";
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green[400]),
                                child: Center(
                                  child: Icon(
                                    Icons.info,
                                    color: Color(0xFFFFFFFF),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFFFFFFF),
                            size: 15,
                          ),


                        ],
                      ),

                    ),



                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap:() async{
                        const url = "https://colaninfotech.com/services/";
                        if (await canLaunch(url) != null)
                          await launch(url);
                        else
                          throw "Could not launch $url";
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.yellowAccent[400]),
                                child: Center(
                                  child: Icon(
                                    Icons.report,
                                    color:  Color(0xFFFFFFFF).withOpacity(0.2),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Service",
                                style: TextStyle(
                                    fontSize: 16,
                                    color:  Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFFFFFFF),
                            size: 15,
                          ),



                        ],
                      ),

                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap:() async{
                        const url = "https://colaninfotech.com/contact-us/";
                        if (await canLaunch(url) != null)
                          await launch(url);
                        else
                          throw "Could not launch $url";
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red[400]),
                                child: Center(
                                  child: Icon(
                                    Icons.feedback,
                                    color:  Color(0xFFFFFFFF),
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Contact",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFFFFFFF),
                            size: 15,
                          ),



                        ],
                      ),

                    ),
                    SizedBox(
                      height: 15,
                    ),

                  ],
                ),
              ),
            )
          ]),
      SizedBox(
        height: 30,
      ),

    ]);
  }


}
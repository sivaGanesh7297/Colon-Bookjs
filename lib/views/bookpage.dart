import 'package:colon/controller/bookController.dart';
import 'package:colon/model/Books.dart';
import 'package:colon/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BookPage extends StatelessWidget {
  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: new Padding(
          padding: EdgeInsets.only(bottom: 50.0),
          child:FloatingActionButton(
            child: new Image.asset("assets/images/colon_splash_screen.png"),
            backgroundColor: Colors.cyan,
            onPressed: () async {

              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color(0xFF1c1d1f),
                      title: Text("Add New Book",style:TextStyle(color:Colors.white)),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: bookNameController,
                            textInputAction: TextInputAction.done,
                            decoration: new InputDecoration(

                                fillColor: Colors.white,
                                filled: true,

                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                                hintText: 'Book Name'),

                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: authorNameController,
                            textInputAction: TextInputAction.done,
                            decoration: new InputDecoration(

                                fillColor: Colors.white,
                                filled: true,

                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                                hintText: 'Author Name'),

                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: descriptionController,
                            textInputAction: TextInputAction.done,
                            decoration: new InputDecoration(

                                fillColor: Colors.white,
                                filled: true,

                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                                hintText: 'Book Description'),

                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Add"),
                          textColor: Colors.white70,
                          color: Colors.blue,
                          onPressed: () async{

                            if(bookNameController.text.trim().length == 0){

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  content: const Text('Please enter Book Name',),

                                ));


                            }
                            else{
                              await BookController.instance
                                  .createBookInDB(bookNameController.text, descriptionController.text,authorNameController.text);

                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                            }

                          },
                        ),
                        FlatButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('CANCEL',style: TextStyle(color:Colors.white))),
                      ],
                    );
                  }
              );



            },
          ),

        ),
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
          title: Text("Colon  Books",style:TextStyle(color: Colors.white)),

        ),
      body: StreamProvider<List<BookList>>.value(value: BookController().books, child: booksUI(context)),
      ),
    );
  }
  Widget booksUI(BuildContext context) {

    return BookController().books.length ==null?CircularProgressIndicator():StreamBuilder<List<BookList>>(
        stream: BookController().books,
        builder: (_context, _snashot) {
          var _data = _snashot.data;
          return _data.length != 0
          ? ListView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: _data.length,
          itemBuilder: (_context, _index) {
            return Card(
              color: Color(0xFF1c1d1f),
              shadowColor:Colors.black ,
              child: ListTile(
                onTap:(){

                    showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context)
                    {
                      return AlertDialog(
                        backgroundColor: Color(0xFF1c1d1f),
                        title: Text(_data[_index].bookDescription,style:TextStyle(color:Colors.white)),
                        actions: <Widget>[

                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Ok',style: TextStyle(color:Colors.white))),
                        ],
                      );
                    }
                    );
                },
                onLongPress:()async{
                  showDialog(

                    context: context, barrierDismissible: false, // user must tap button!

                    builder: (BuildContext context) {
                      return new AlertDialog(
                        backgroundColor:  Color(0xFF1c1d1f),
                        title: new Text('Colon',style: TextStyle(color:Colors.white),),
                        content: new SingleChildScrollView(
                          child: new ListBody(
                            children: [
                              new Text('Are You Sure to Delete this Book?',style: TextStyle(color:Colors.white),),
                            ],
                          ),
                        ),
                        actions: [
                          new FlatButton(

                            child: new Text('Ok',style: TextStyle(color:Colors.white)),
                            onPressed: () async {

                              await BookController().deleteBook( _data[_index].id);

                            },
                          ),
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('CANCEL',style: TextStyle(color:Colors.white))),
                        ],
                      );
                    },
                  );

                },
                leading:Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      fit: BoxFit.cover,

                      image:AssetImage("assets/images/colon_splash_screen.png"),
                    ),


                  ),

                ),
                title: Text(_data[_index].bookName,style: TextStyle(color: Colors.white,)),
                subtitle: Text(_data[_index].bookDescription,style: TextStyle(color: Colors.grey,)),

              ),


            );
            }


    ):Text("No Books are available",style: TextStyle(color: Colors.grey));


    });

  }
}


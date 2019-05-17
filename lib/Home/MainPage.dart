import 'package:flutter/material.dart';
import 'package:good_morning/Common/Common.dart';
import 'package:good_morning/Helper/CustomPopupMenu.dart';

import 'package:good_morning/HomeScreen/Monu.dart';
import 'package:good_morning/Model/Content.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

List<CustomPopupMenu> menu_list = [];




class _MainActivityState extends State<MainActivity> {

  List imageList=[
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
    "img/admin.png",
  ];

  var  _sate="Monu";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // menu_list.clear();
    menu_list.add( CustomPopupMenu(title: "Instraction",icon: Icons.insert_emoticon));
    menu_list.insert(menu_list.length,CustomPopupMenu(title: "Add new",icon: Icons.add));

    print("Instance");


  }

  @override
  void didUpdateWidget(MainActivity oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);



    print("Update");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dispose");
  }


  @override
  Widget build(BuildContext context) {
    //_sate="Monu";
    print("build");
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            Row(
              children: <Widget>[
                PopupMenuButton<CustomPopupMenu >(

                  child: Row(
                    children: <Widget>[
                      Text(
                        " ${_title()}",
                        style: new TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  onSelected: ((value){
                    setState(() {
                      _sate=value.title;

                      if(value.title=="Add new"){
                           _showDialog();
                      }


                    });

                    print("${value.title}");




                  }),
                  itemBuilder: (BuildContext context) {


                    return menu_list.map((CustomPopupMenu choice) {


                      return PopupMenuItem<CustomPopupMenu>(
                        value: choice,
                        child: ListTile(

                          title: Text(choice.title),
                          leading: Icon(choice.icon),

                        ),

                      );
                    }).toList();

                  },


                ),

                //  child:
              ],
            ),
          ],
        ),
      ),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Monu(name: _sate,);
  }


/*  _changeStage(){


    if(_sate=="Monu"){
      Content content =new Content(name:_sate);
      Common.content=content;
      return Monu(name:_sate);
    }else{
      print("Not Found");
    }

  }*/
   _title(){
    String title;
    if(_sate!=null){
      title=_sate;
    }else{
      title="Monu";
    }

    return title;
  }


  void _showDialog() {
     String catagory_name;
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Add New catagory"),

          content: Row(
            children: <Widget>[
               SizedBox(
                 width: 20,
                 height: 20,
                 child: InkWell(
                    onTap: (){
                        print("Icon chose");
                       _showBottomSheet();
                    },
                   child: Icon(Icons.insert_emoticon),

                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(left:30.0),
                 child: SizedBox(
                   width: 180,
                   child: TextField(
                     onChanged: ((text){
                       catagory_name=text;
                     }),
                     decoration: InputDecoration(
                         alignLabelWithHint: true,
                         hintText: 'Please enter catagory',
                         hintStyle: new TextStyle(
                         fontSize: 14,
                       )

                     ),
                   ),
                 ),
               )
            ],
          ),

          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            new FlatButton(

              child: new Text("Cancle",style: TextStyle(color: Colors.red),),
              onPressed: () {
                print(catagory_name);
                Navigator.of(context).pop();
              },
            ),


            new FlatButton(
              child: new Text("Add"),
              onPressed: () {
                print(catagory_name);
                Navigator.of(context).pop();
              },
            ),


          ],
        );
      },
    );
  }

  void _showBottomSheet(){

     showModalBottomSheet(context: context, builder: (BuildContext context){
       return GridView.builder(
         itemCount: imageList.length,
           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
           itemBuilder: (BuildContext context,index){
             return  Center(
                child: Image.network("https://banner2.kisspng.com/20180409/tsq/kisspng-escobar-computer-icons-call-icon-5acc2672f1f849.2214086415233286269911.jpg")
             );
           }
       );

     });


    /*
    *    GridView.builder(
          itemCount: imageList.length,
            gridDelegate:  new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: ((BuildContext context,index){
              return Icon(imageList[index]);
            }))*/
}

}



class SelectedOption extends StatelessWidget {
  CustomPopupMenu choice;

  SelectedOption({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

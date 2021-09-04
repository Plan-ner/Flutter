import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Knowledge app outside the classroom"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder( builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());   //  [{},{},{},{}]
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['image_url'], data[index]['detail']);

            },
            itemCount: data.length, );


        },
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),  //ดึง file json
        
        
        )
      ));

  }


  Widget MyBox(String title, String subtitle, String image_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 20),     //ขอบนอกสุด
      padding:  EdgeInsets.all(20),         //ขอบถัดเข้ามา
      //color: Colors.orange[100],
      height: 190,   //ขนาดกล่อง
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(15), //ทำขอบให้ไม่เหลี่ยม
        image: DecorationImage(
          image: NetworkImage(
            image_url
            ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.70), BlendMode.darken)

        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //แนวตั้ง
        crossAxisAlignment: CrossAxisAlignment.start,      //แนวนอน
        children: [

          Text(
            title,
             style: TextStyle(fontSize: 25,color: Colors.black87,fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 30,),

          Text(
            subtitle,
             style: TextStyle(fontSize: 16,color: Colors.black87),
          ),

          SizedBox(height: 12,),
  
          TextButton(onPressed: () {

            //print("Next Page >>>");
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(v1, v2, v3, v4)));
          }, 
            child: Text("Lead",
            style: TextStyle(
            color: Colors.redAccent[400]),
            )
          ),

        ],
      ),
    );
  }

}
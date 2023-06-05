import 'package:flutter/material.dart';


void main()=>runApp(const myapp());

// ignore: camel_case_types
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
     return const MaterialApp(
      home:homepage(),
    );
  }
}

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
 List<String> xo=[" "," "," "," "," "," "," "," "," "];
 var xscore=0;
 var oscore=0;
 String xstring="0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:
       Column(
         children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  children: [
                Text("score",style: TextStyle(backgroundColor: Colors.black,color: Colors.lightBlue,fontSize: 30,),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Column(
                            children: [
                            Text("player o  ",style: TextStyle(backgroundColor: Colors.black,color: Colors.white,fontSize: 30,),),
                         Text(oscore.toString(),style: TextStyle(backgroundColor: Colors.black,color: Colors.lightBlue,fontSize: 35,),),

                            ],
                          ),
                           
                             Column(
                               children: [
                            Text("  player x",style: TextStyle(backgroundColor: Colors.black,color: Colors.white,fontSize: 30,),),

                                 Text(xscore.toString(),style: TextStyle(backgroundColor: Colors.black,color: Colors.lightBlue,fontSize: 35,),),
                               ],
                             )
                      ],),
                  ],
                ),
               ),
            ),
            ),
           Expanded(
             flex: 5,
             child: GridView.builder(
               itemCount: 9, 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder: (BuildContext context ,int index){
                  return GestureDetector(
                   onTap:(){tap(index);
                   winner();},
                    child: Container(
                    
                      
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                       ),
                       child: Center(
                        child: Text(xo[index],style: const TextStyle(color: Colors.white,fontSize:70 ),),
                       ),
                    ),
                  );
                }),
           ),
           Expanded(
          flex: 3,
            child: 
            Container(
              color: Colors.black,
           child:Center(
          
           child: ElevatedButton(
           style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 18, 5, 189),),

              onPressed:(){
                setState(() {
                   xo=[" "," "," "," "," "," "," "," "," ",];
                });
             
              restart();},
              
           
            child: Text('restart'),
           ),
            
               ),
              
               
            ),
           ),
         ],
       ),
    );
  }
  bool ogame=false;
   
  void tap(int index){
    setState(() {
      if(ogame==false&&xo[index]==' '){
   xo[index]='x';
   ogame=true;}else if(ogame==true&&xo[index]==' '){
    ogame=false;
    xo[index]='o';
   }
    });
  
  }
  void restart(){
    
    showDialog(
  
  context: context,
   builder: (BuildContext context){
    return AlertDialog(
      title: Text("🔄play again",style:const TextStyle(backgroundColor: Colors.white,fontSize: 40 ,color: Colors.black,) ,),
    );
   });
    xo=[" "," "," "," "," "," "," "," "," ",];
  }
  void wineris(String win){
    if (win=="o"){
      ogame=true;
      oscore=oscore+1;
    }else if(win=="x"){
      ogame=false;
      xscore=xscore+1;
    }
   
    xo=[" "," "," "," "," "," "," "," "," ",];
    

 showDialog(
  context: context,
   builder: (BuildContext context){
    return AlertDialog(
      title: Text("🎆winner is: $win",style:const TextStyle(backgroundColor: Colors.white,fontSize: 40 ,color: Colors.black,) ,),
    );
   });
  }
  void nowiner(){
    ogame=false;
    showDialog(
  context: context,
   builder: (BuildContext context){
    return AlertDialog(
      title: Text("🥱no winner",style:const TextStyle(backgroundColor: Colors.white,fontSize: 40 ,color: Colors.black,) ,),
    );
    
   });
    xo=[" "," "," "," "," "," "," "," "," ",];

  }
  void winner(){
    if (xo[0]==xo[1]&&xo[0]==xo[2]&&xo[0]!=" "){
  wineris(xo[0]);
    }
       if (xo[3]==xo[4]&&xo[4]==xo[5]&&xo[3]!=" "){
  wineris(xo[3]);
    }
       if (xo[6]==xo[7]&&xo[7]==xo[8]&&xo[6]!=" "){
  wineris(xo[6]);
    }
       if (xo[0]==xo[3]&&xo[3]==xo[6]&&xo[0]!=" "){
  wineris(xo[0]);
    }
       if (xo[1]==xo[4]&&xo[4]==xo[7]&&xo[1]!=" "){
  wineris(xo[1]);
    }
       if (xo[2]==xo[5]&&xo[5]==xo[8]&&xo[2]!=" "){
  wineris(xo[2]);
    }
       if (xo[0]==xo[4]&&xo[4]==xo[8]&&xo[0]!=" "){
  wineris(xo[0]);
    }
       if (xo[2]==xo[4]&&xo[4]==xo[6]&&xo[2]!=" "){
  wineris(xo[2]);
    }
    else if(xo[0]!=" "&&xo[1]!=" "&&xo[2]!=" "&&xo[3]!=" "&&xo[4]!=" "&&xo[5]!=" "&&xo[6]!=" "&&xo[7]!=" "&&xo[8]!=" "){
      nowiner();
    }

  }
}
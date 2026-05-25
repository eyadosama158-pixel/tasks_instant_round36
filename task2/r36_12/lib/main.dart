import 'package:flutter/material.dart';

void main() {
  runApp(const BasketballScreen());
}

class BasketballScreen extends StatefulWidget {
  const BasketballScreen({super.key});

  @override
  State<BasketballScreen> createState() => _BasketballScreenState();
}

class _BasketballScreenState extends State<BasketballScreen> {

  int teamAScore= 0;
  int teamBScore= 0;

  int previousTeamAScore = 0;
  int previousTeamBScore = 0;


  Color orangeColor = Colors.orange;
  Color greyColor = Colors.blueGrey;
  Color blackColor = Colors.black;

  FontWeight fontWeightBold = FontWeight.bold;

  double fontSize55 = 55;
  double fontSize25 = 25;
  double fontSize20 = 20;
  double fontSize15 = 15;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basketball App",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: orangeColor,
          elevation: 2,
          shadowColor: blackColor,
          title: Text("Basketball Score",style: TextStyle(color: blackColor,fontWeight: fontWeightBold)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Team A, Team B
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Team A
                    teamWidget(
                        teamTitle: 'Team A',
                        scoreNum: teamAScore,
                        throw3: (){
                          setState(() {
                            savePreviousScore();
                            teamAScore +=3;
                          });
                        },
                        throw2: (){
                          setState(() {
                            savePreviousScore();
                            teamAScore +=2;
                          });
                        },
                        throw1: (){
                          setState(() {
                            savePreviousScore();
                            teamAScore +=1;
                          });
                        }
                    ),


                    //vertical line
                    VerticalDivider(
                      color: Colors.grey,
                      indent: 5,
                      endIndent:310,
                    ),


                    //Team B
                    teamWidget(
                        teamTitle: 'Team B',
                        scoreNum: teamBScore,
                        throw3: (){
                          setState(() {
                            savePreviousScore();
                            teamBScore +=3;
                          });
                        },
                        throw2: (){
                          setState(() {
                            savePreviousScore();
                            teamBScore +=2;
                          });
                        },
                        throw1: (){
                          setState(() {
                            savePreviousScore();
                            teamBScore +=1;
                          });
                        }
                    )
                  ],
                ),
              ),
            ),

            //btn undo, btn reset
            Padding(
             padding:  EdgeInsets.only(bottom: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 //btn undo
                 buttonWidget(
                     edges: EdgeInsets.symmetric(horizontal: 50,vertical: 5 ),
                     btnText: "UNDO",
                     onPressed: undo),

                 //btn reset
                 buttonWidget(
                     edges: EdgeInsets.symmetric(horizontal: 50,vertical: 5 ),
                     btnText: "RESET",
                     onPressed: reset),
               ],
             ),
           )


          ],
        ),
      ),
    );
  }

  Widget buttonWidget({required String btnText, required VoidCallback onPressed, required EdgeInsets edges}){
    return MaterialButton(
      padding: edges,
      onPressed: onPressed,
      color: orangeColor,
      child: Text(btnText,style: TextStyle(color: blackColor,fontSize: fontSize15,fontWeight: fontWeightBold),),

    );
  }

  Widget teamWidget({required String teamTitle, required int scoreNum, required VoidCallback throw3, required VoidCallback throw2, required VoidCallback throw1}){
    return Column(
      children: [
        //title Team
        Text(teamTitle,style: TextStyle(fontSize: fontSize15,color: greyColor),),
        //score
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text("$scoreNum",style: TextStyle(fontSize: fontSize55),),
        ),
        //btn throw +3
        buttonWidget(
            edges: EdgeInsets.symmetric(horizontal: 35,vertical: 5 ),
            btnText: "+3 THROW",
            onPressed: throw3
        ),
        //btn throw +2
        buttonWidget(
            edges: EdgeInsets.symmetric(horizontal: 35,vertical: 5 ),
            btnText: "+2 THROW",
            onPressed: throw2
        ),
        //btn throw +1
        buttonWidget(
            edges: EdgeInsets.symmetric(horizontal: 35,vertical: 5 ),
            btnText: "+1 THROW",
            onPressed: throw1
        ),
      ],
    );
  }

  void reset (){
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }
  void savePreviousScore() {
    previousTeamAScore = teamAScore;
    previousTeamBScore = teamBScore;
  }

  void undo() {
    setState(() {
      teamAScore = previousTeamAScore;
      teamBScore = previousTeamBScore;
    });

  }
}

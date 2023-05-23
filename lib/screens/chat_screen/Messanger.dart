import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,

        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
                backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/188757593_4001473379942215_1647875222541759424_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFX29fx-gAophuYVpW9kZTyi-lWZBDvenmL6VZkEO96eV7amnq2M8tSnDKcTt6LkbLZYpdTBkfuM4wZJzmrxGCl&_nc_ohc=zj_QIGs_LoUAX9AKUQX&tn=aISaGu27uXmP8fkb&_nc_ht=scontent.faly1-2.fna&oh=00_AfB4p3nWAIWw6f4WY1rQzdc6QXNJjlrv8GxPS0RZp_f5aA&oe=640B4DFC'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 15.0),
              child: Text(
                "Chats",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [

          CircleAvatar(
            backgroundColor: Colors.grey,
              child: IconButton(
                  onPressed: (){},
                  icon:Icon(Icons.camera_alt
                  ),
                color: Colors.white,
              )
          ),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
              backgroundColor: Colors.grey,
              child: IconButton(
                  onPressed: (){},
                  icon:Icon(Icons.edit
                  ),
                color: Colors.white,
              )
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
       ),
      body:

      SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey,
                  ),
                  child: Container(
                    height: 40.0,
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Text('Search'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                        {
                          return buildStoryItem();
                        },
                  separatorBuilder: (context, index){
                    return SizedBox(
                      width: 10.0,
                    );
                  }
                  ,
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                return buildChatItem();
              },
                separatorBuilder: (context, index){
                return SizedBox(
                  height: 10.0,
                );
                },
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. build item
  // 2. build list
  // 3. add item to list

  Widget buildChatItem()
  {
    return  Row(
      children: [
        SizedBox(
          width: 10.0,
        ),
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/188757593_4001473379942215_1647875222541759424_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFX29fx-gAophuYVpW9kZTyi-lWZBDvenmL6VZkEO96eV7amnq2M8tSnDKcTt6LkbLZYpdTBkfuM4wZJzmrxGCl&_nc_ohc=zj_QIGs_LoUAX9AKUQX&tn=aISaGu27uXmP8fkb&_nc_ht=scontent.faly1-2.fna&oh=00_AfB4p3nWAIWw6f4WY1rQzdc6QXNJjlrv8GxPS0RZp_f5aA&oe=640B4DFC'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor:Colors.green ,
              ),
            )
          ],
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20.0,
              ),
              Text(
                'Alaa Younes',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟علاء انت فين ؟؟؟',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("12:39 pm",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ],
    );
  }
  Widget buildStoryItem()
  {
    return Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage('https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/188757593_4001473379942215_1647875222541759424_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFX29fx-gAophuYVpW9kZTyi-lWZBDvenmL6VZkEO96eV7amnq2M8tSnDKcTt6LkbLZYpdTBkfuM4wZJzmrxGCl&_nc_ohc=zj_QIGs_LoUAX9AKUQX&tn=aISaGu27uXmP8fkb&_nc_ht=scontent.faly1-2.fna&oh=00_AfB4p3nWAIWw6f4WY1rQzdc6QXNJjlrv8GxPS0RZp_f5aA&oe=640B4DFC'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor:Colors.green ,
                ),
              )
            ],
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'Alaa Younes',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}
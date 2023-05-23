
import 'package:askme/screens/posts_screen/create_post.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// class PostsScreen extends StatelessWidget {
//   PostsScreen();
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.bottomEnd,
//       children: [
//         SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Community',
//                   style: TextStyle(
//                     color: HexColor('371B34'),
//                     fontSize: 23,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10, right: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: HexColor('FE8235'),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           alignment: Alignment.center,
//                           child: MaterialButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Trending',
//                               style: TextStyle(
//                                 color: HexColor('FBFBFB'),
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10, right: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: HexColor('F4F2F1'),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           alignment: Alignment.center,
//                           child: MaterialButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Android Development',
//                               style: TextStyle(
//                                 color: HexColor('8A8A8A'),
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10, right: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: HexColor('F4F2F1'),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10))),
//                           alignment: Alignment.center,
//                           child: MaterialButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Cyber Security',
//                               style: TextStyle(
//                                 color: HexColor('8A8A8A'),
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListView.separated(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, indext) => buildPost(),
//                     separatorBuilder: (context, index) => SizedBox(
//                           height: 0,
//                         ),
//                     itemCount: 10),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(15),
//           child: FloatingActionButton(
//             onPressed: () {},
//             child: Icon(Icons.edit,),
//             backgroundColor: HexColor('FE8235'),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// Widget buildPost() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 15),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               child: Image(
//                 image: NetworkImage(
//                     'https://cdn-icons-png.flaticon.com/512/706/706807.png'),
//               ),
//               radius: 25,
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Coal Dingo',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: HexColor('573926'),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       'just now',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: HexColor('707070'),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   """Is there a therapy which can cure
// crossdressing & bdsm compulsion?""",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: HexColor('573926'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ImageIcon(
//                       AssetImage('images/like.png'),
//                       size: 20,
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       '2',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 40,
//                     ),
//                     ImageIcon(
//                       AssetImage('images/chat.png'),
//                       color: HexColor('D9D8D8'),
//                       size: 20,
//                     ),
//                     SizedBox(
//                       width: 160,
//                     ),
//                     ImageIcon(
//                       AssetImage('images/share.png'),
//                       size: 20,
//                       color: HexColor('D6CCC6'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../shared/Network/Auth.dart';
import 'package:intl/intl.dart';

class PostsScreen extends StatelessWidget {
  @override

  Auth auth =Auth();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreatePost())); },
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: HexColor('FE8235'),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Community',
                style: TextStyle(
                  color: HexColor('371B34'),
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),

              StreamBuilder<QuerySnapshot>(
                stream: auth.getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        'Error retrieving users: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return StatefulBuilder(
                      builder:(context, setState) {
                        return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic>? postData =
                            documents[index].data() as Map<String, dynamic>?;
                            DateTime dateTime = DateTime.now(); // Replace with your DateTime object

// Format date
                            String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

// Format time
                            String formattedTime = DateFormat('HH:mm').format(dateTime);
                            return buildPost( post: postData!,
                                context: context,
                                index: documents[index].id, date: formattedDate, time: formattedTime );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10.0,
                            );
                          },
                        );
                      }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildPost({required Map<String, dynamic> post, context, index, time, date}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Image(
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/706/706807.png'),
              ),
              radius: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${post['username']}",
                  style: TextStyle(
                    fontSize: 18,
                    color: HexColor('573926'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  """${post['text']}""",
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor('573926'),
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '${date}',
                      style: TextStyle(
                        fontSize: 14,
                        color: HexColor('573926'),

                      ),
                    ),
                    SizedBox(width: 50),
                    Positioned(
                      child: Text(
                        '${time}',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor('707070'),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}


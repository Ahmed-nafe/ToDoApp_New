// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:todonew/Pages/calender_page/TodosModel.dart';
// import 'package:todonew/pages/calender_page/screens/cubits/todos_cuibt_cubit.dart';
//
// class ListTasks extends StatefulWidget {
//   const ListTasks({
//     super.key,
//   });
//
//   @override
//   State<ListTasks> createState() => _ListTasksState();
// }
//
// class _ListTasksState extends State<ListTasks> {
//   List<TodoItemModel> todos = [];
//   int currentindex = 0;
//   TextEditingController titlecontroller = TextEditingController();
//   TextEditingController descontroller = TextEditingController();
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//
//   void addTask(TodoItemModel task) {
//     setState(() {
//       todos.add(task);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         children: [Expanded(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   // physics: const NeverScrollableScrollPhysics(),
//                   itemCount: todos.length,
//                   itemBuilder: (context, index) {
//                     return todoitem(
//                       todos[index],
//                     );
//                   })),
//         ],
//       ),
//     );
//   }
//
//   Widget todoitem(TodoItemModel value) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: MediaQuery.of(context).size.width * 0.027,
//               horizontal: MediaQuery.of(context).size.height * 0.021),
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: Color(0xff363636),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 2,
//                     ),
//                   ),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.transparent,
//                     maxRadius: 8,
//                     minRadius: 2,
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.04,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.7,
//                         child: Text(
//                           maxLines: 1,
//                           softWrap: true,
//                           overflow: TextOverflow.ellipsis,
//                           value.title,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600, color: Colors.white),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.width * 0.008,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Today At 16:15",
//                               style: GoogleFonts.lato(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xffAFAFAF))),
//                           Row(children: [
//                             Container(
//                               margin: EdgeInsets.all(2),
//                               padding: EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                   color: Color(0xffFF8080),
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.home,
//                                     color: Colors.white,
//                                   ),
//                                   Text(
//                                     "Home",
//                                     style: GoogleFonts.lato(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12,
//                                         color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.01,
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(2),
//                               decoration: BoxDecoration(
//                                   color: Colors.transparent,
//                                   shape: BoxShape.rectangle,
//                                   border: Border.all(color: Color(0xff8687E7)),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.flag,
//                                     color: Colors.white,
//                                   ),
//                                   SizedBox(
//                                     width: 3,
//                                   ),
//                                   Text(
//                                     "1",
//                                     style: GoogleFonts.lato(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 12,
//                                         color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ])
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

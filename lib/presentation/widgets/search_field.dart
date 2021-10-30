// import 'package:breaking_bad_flutter_bloc/constants/colors.dart';
// import 'package:breaking_bad_flutter_bloc/data/models/characters.dart';
// import 'package:flutter/material.dart';
//
// class SearchField extends StatefulWidget {
//   @override
//   _SearchFieldState createState() => _SearchFieldState();
// }
//
// class _SearchFieldState extends State<SearchField> {
//   late List<Character> searchedForCharacters;
//   bool isSearching = false;
//   final _searchTextController = TextEditingController();
//   late List<Character> allCharacters;
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: _searchTextController,
//       cursorColor: MyColors.myGray,
//       decoration: InputDecoration(
//           hintText: 'Find a Character..',
//           hintStyle: TextStyle(color: MyColors.myGray, fontSize: 18),
//           border: InputBorder.none),
//       onChanged: (searchedCharacter) {
//         searchFunction(searchedCharacter);
//       },
//     );
//   }
//
//   void searchFunction(String searchedCharacter) {
//     searchedForCharacters = allCharacters
//         .where((character) =>
//             character.name.toLowerCase().startsWith(searchedCharacter))
//         .toList();
//     setState(() {});
//   }
//
//   List<Widget> buildAppBarAction() {
//     if (isSearching) {
//       return [
//         IconButton(
//           onPressed: () {
//             clearSearch();
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.clear,
//             color: MyColors.myGray,
//           ),
//         ),
//       ];
//     } else {
//       return [
//         IconButton(
//           onPressed: () {
//             startSearch();
//           },
//           icon: Icon(
//             Icons.search,
//             color: MyColors.myGray,
//           ),
//         ),
//       ];
//     }
//   }
//
//   void startSearch() {
//     ModalRoute.of(context)!
//         .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
//     setState(() {
//       isSearching = true;
//     });
//   }
//
//   void stopSearch() {
//     clearSearch();
//     setState(() {
//       isSearching = false;
//     });
//   }
//
//   void clearSearch() {
//     setState(() {
//       _searchTextController.clear();
//     });
//   }
//
//   Widget normalAppBar() {
//     return Text(
//       'Characters',
//       style: TextStyle(
//         color: MyColors.myGray,
//       ),
//     );
//   }
// }

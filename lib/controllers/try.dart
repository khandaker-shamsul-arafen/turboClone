//  Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//               child: ClipPath(
//                 clipper: SearchClipper(),
//                 child: Container(
//                   width: Get.width,
//                   color: AppColors.searchBar,
//                   child: TextField(
//                     controller: searchController,
//                     style: const TextStyle(
//                       color: Colors.black,
//                     ),
//                     cursorColor: Colors.black.withOpacity(.6),
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       hintStyle: TextStyle(
//                         color: Colors.black.withOpacity(.5),
//                       ),
//                       contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(32.0),
//                         borderSide: const BorderSide(color: Colors.transparent),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(32.0),
//                         borderSide: const BorderSide(color: Colors.transparent),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(32.0),
//                         borderSide: const BorderSide(color: Colors.transparent),
//                       ),
//                       prefixIcon: const Icon(
//                         Icons.search,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     onChanged: (q) {
//                       if (isSelected.value == 1) {
//                         leagueController.searchLeagues(q);
//                       } else if (isSelected.value == 2) {
//                         teamController.searchTeams(q);
//                       } else if (isSelected.value == 3) {
//                         playerController.searchPlayers(q);
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),
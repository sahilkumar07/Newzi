import 'package:google_fonts/google_fonts.dart';
import 'package:technewz/utils/colors.dart';
import 'package:flutter/material.dart';
//import 'package:technewz/backend/functions.dart';
class SearchBars extends StatefulWidget {
  const SearchBars({Key? key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  SearchBarsState createState() => SearchBarsState();
}

class SearchBarsState extends State<SearchBars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: SearchBars.searchcontroller,
                      decoration: InputDecoration(
                          hintText: 'Search a Keyword or a Phrase',
                          hintStyle: GoogleFonts.lato(),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            FocusScope.of(context).unfocus();
            //fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.darkgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}  
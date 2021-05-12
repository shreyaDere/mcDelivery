import 'package:flutter/material.dart';
import 'package:mc_replica_app_flutter/constants/colors/colors.dart';
import 'package:mc_replica_app_flutter/ui/views/search_view/search_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            top: true,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () => model.onBackPress(),
                              child: Icon(Icons.arrow_back_ios)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              initialValue: model.searchString,
                              onChanged: model.searchStringValue,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  // contentPadding: EdgeInsets.all(14.0),
                                  hintText: "What would you like to have today",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                    ),
                                    onPressed: () {},
                                  )
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderRadius:
                                  //       BorderRadius.all(Radius.circular(10.0)),
                                  //   borderSide:
                                  //       BorderSide(color: COLOR_GRAY_BLACK),
                                  // ),
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderRadius:
                                  //       BorderRadius.all(Radius.circular(10.0)),
                                  //   borderSide:
                                  //       BorderSide(color: COLOR_GRAY_BLACK),
                                  // ),
                                  ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}

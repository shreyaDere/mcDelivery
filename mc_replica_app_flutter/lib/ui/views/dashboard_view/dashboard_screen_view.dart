import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mc_replica_app_flutter/constants/colors/colors.dart';
import 'package:mc_replica_app_flutter/ui/views/dashboard_view/dashboard_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: COLOR_PRIMARY,
            elevation: 0,
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) => model.bottomNavigation(index),
              items: [
                BottomNavigationBarItem(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.yellow),
                  ),
                  icon: Image.asset(
                    "assets/icons/m_logo.png",
                    height: 20,
                    // width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Search",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Menu",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Image.asset(
                    "assets/icons/list.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Offers",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Image.asset(
                    "assets/icons/discount.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "My Mod",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Image.asset(
                    "assets/icons/user.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              ]),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              key: PageStorageKey("DashboardWidgetList"),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: COLOR_PRIMARY,
                  ),
                  DashboardWidgetList(),
                ],
              ),
            ),
          )),
    );
  }
}

class DashboardWidgetList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height / 22),
        TopCarousel(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            viewModel.getDateInterval(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(height: 20),
        CategoryRow(),
        SizedBox(height: 20),
        CategoryList(),
        SizedBox(
          height: 20,
        ),
        LunchTimeMeal(),
        SizedBox(
          height: 20,
        ),
        RecommendedProductList(),
      ],
    );
  }
}

class RecommendedProductList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Image.asset(
              "assets/icons/m_logo.png",
              // height: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Recommended Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
              child: Row(
                children: [
                  Spacer(),
                  Text("Calorie"),
                  SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 50.0,
                    height: 25.0,
                    toggleSize: 10.0,
                    value: viewModel.calorieToggle,
                    borderRadius: 30.0,
                    padding: 8.0,
                    onToggle: (val) => viewModel.onCalorieToggel(val),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Veg Only"),
                  SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 50.0,
                    height: 25.0,
                    toggleSize: 10.0,
                    value: viewModel.vegOnlyToggle,
                    borderRadius: 30.0,
                    padding: 8.0,
                    onToggle: (val) => viewModel.onVegOnlyToggleToggel(val),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
                    // color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.blue[50],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "McAloo Tikki Double Patty Burger",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "The World's favourite Indian \n burger! Two Crunchy potato ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                ),
                                Icon(
                                  Icons.monetization_on,
                                  size: 20,
                                ),
                                Text("75"),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 100,
                                  height: 40,
                                  margin: EdgeInsets.only(top: 10, bottom: 2),
                                  decoration: BoxDecoration(
                                      color: COLOR_PRIMARY,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Center(child: Text("Add")),
                                )
                              ],
                            ),
                            Text(
                              "customizable",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class LunchTimeMeal extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "It's Lunch Time!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          GridListJumboMeal(),
          Container(
              // height: 20,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 0, right: 20),
              color: Colors.white,
              child: Center(
                  child: Text(
                "McCafe",
                style: TextStyle(fontSize: 25),
              ))),
          Container(
              // height: 150,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 0, right: 20),
              padding: EdgeInsets.only(bottom: 30, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0))),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  CoffeeItem("assets/images/hot_coffee.jpg", "Keep it hot"),
                  SizedBox(
                    width: 10.0,
                  ),
                  CoffeeItem("assets/images/cold_coffee.jpg", "Keep it cold"),
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 0, right: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8.0))),
              child: Text(
                "#VocalForLocal - All our ingredients are locally sourced and traceable for your safety.",
                style: TextStyle(color: Colors.white, letterSpacing: 0.8),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 20.0),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctc, index) {
                  return Container(
                    // padding: EdgeInsets.only(
                    //     left: 20, right: 20, top: 10, bottom: 10),
                    margin: EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/icons/ribbon-black-shape.png",
                              width: 50,
                              height: 50,
                              color: Colors.red,
                            ),
                            Positioned(
                                top: 15, left: 2.0, child: Text("Safety")),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: COLOR_PRIMARY,
                                  fontSize: 38),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              " All our crew member use the \n arogya setu app and undergo \n temperature check befor starting",
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}

class CoffeeItem extends ViewModelWidget<DashboardViewModel> {
  final String iconName;
  final String iconTitle;
  CoffeeItem(this.iconName, this.iconTitle);
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: COLOR_PRIMARY,
          radius: 35,
          // margin: EdgeInsets.only(left: 20),
          child: Image.asset(
            iconName,
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(iconTitle)
      ],
    );
  }
}

class GridListJumboMeal extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 20),
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8.0))),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? 3
                    : 6,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/m_logo.png",
                    height: 30,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "McSavers",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class TopCarousel extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        pageViewKey: PageStorageKey('carousel_slider'),
        viewportFraction: 1,
        enlargeCenterPage: false,
        initialPage: 1,
        aspectRatio: 3.0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          // viewModel.onCarousalPageChanged(index, reason);
        },
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 4,
      itemBuilder: (ctx, index, i) {
        return Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
                child: Container(
                    color: Colors.red,
                    child: Image.asset("assets/icons/m_logo.png")),
                onTap: () {}),
            decoration: BoxDecoration());
      },
    );
  }
}

class CategoryList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4)),
            );
          }),
    );
  }
}

class CategoryRow extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => viewModel.setFlagForCategory(0),
              child: Container(
                width: 85,
                decoration: BoxDecoration(
                    // color: Colors.redAccent,
                    border: Border(
                        bottom: BorderSide(
                            color: viewModel.category == 0
                                ? COLOR_PRIMARY
                                : Colors.transparent,
                            width: 2))),
                child: Text(
                  "Trending",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: viewModel.category == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              )),
          GestureDetector(
            onTap: () => viewModel.setFlagForCategory(1),
            child: Container(
              width: 70,
              padding: EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: viewModel.category == 1
                            ? COLOR_PRIMARY
                            : Colors.transparent,
                        width: 2)),
              ),
              child: Text(
                "Deals",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: viewModel.category == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

class DashboardWidgetList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopCarousel(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            viewModel.getDateInterval(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CategoryRow(),
        SizedBox(
          height: 20,
        ),
        CategoryList(),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[100],
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "It's Lunch Time!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? 3
                          : 6,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/m_logo.png",
                              height: 20,
                            ),
                            Text(
                              "McSavers",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class CategoryList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      height: MediaQuery.of(context).size.width / 1.8,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
            );
          }),
    );
  }
}

class CategoryRow extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => viewModel.setFlagForCategory(0),
              child: Container(
                width: 85,
                decoration: BoxDecoration(
                    // color: Colors.redAccent,
                    border: Border(
                        bottom: BorderSide(
                            color: viewModel.category == 0
                                ? COLOR_PRIMARY
                                : Colors.transparent,
                            width: 2))),
                child: Text(
                  "Trending",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: viewModel.category == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              )),
          GestureDetector(
            onTap: () => viewModel.setFlagForCategory(1),
            child: Container(
              width: 70,
              padding: EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: viewModel.category == 1
                            ? COLOR_PRIMARY
                            : Colors.transparent,
                        width: 2)),
              ),
              child: Text(
                "Deals",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: viewModel.category == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopCarousel extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width - 60,
      margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      color: Colors.blue,
      /* child: CarouselSlider.builder(
        options: CarouselOptions(
          pageViewKey: PageStorageKey('carousel_slider'),
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          initialPage: 2,
          onPageChanged: (index, reason) {
            // viewModel.onCarousalPageChanged(index, reason);
          },
          scrollDirection: Axis.horizontal,
        ),
        itemCount: 4,
        itemBuilder: (ctx, index, i) {
          return GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  color: Colors.red,
                  child: Image.asset("assets/icons/m_logo.png")),
              onTap: () {
                // viewModel.onCarousalTap(
                //     slug: viewModel.topCarousel.ads[index].link);
              });
        },
      ),
    */
    );
  }
}

*/

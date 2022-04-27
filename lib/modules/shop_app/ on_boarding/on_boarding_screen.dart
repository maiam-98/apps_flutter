import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/modules/shop_app/%20shop_login/shopLogin.dart';
import 'package:flutter_app3/shard/components/components.dart';
import 'package:flutter_app3/shard/network/local/cache_helper.dart';
import 'package:flutter_app3/shard/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
});
}

class OnBoardingScreen extends StatefulWidget
{
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'On Boarding 1 title' ,
        image: 'Assets/imags/on_boarding_1.jpg',
        body: 'On Boarding 1 body'
    ),
    BoardingModel(
        title: 'On Boarding 2 title' ,
        image: 'Assets/imags/on_boarding_1.jpg',
        body: 'On Boarding 2 body'
    ),
    BoardingModel(
        title: 'On Boarding 3 title' ,
        image: 'Assets/imags/on_boarding_1.jpg',
        body: 'On Boarding 3 body'
    ),
  ];

  bool isLast = false;
  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value)
      {
        navigateAndFinish(context, ShopLogin());
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function:submit,
              text: 'SKIP'
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (index)
                {
                  if(index == boarding.length - 1){
                    setState(() {
                      isLast = true;
                    });
                  }else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: 3,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      spacing: 5,
                      expansionFactor: 4,
                      dotWidth: 10,
                      activeDotColor: defaultColor,
                    ),
                    count: boarding.length
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast){submit();}
                    else{
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }

                  },
                  child: Icon(
                      Icons.arrow_forward_ios
                  ),
                    )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${model.image}')
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ],
  );
}

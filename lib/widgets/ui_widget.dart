import 'package:flutter/material.dart';
import 'package:helpmeat/utils/resources.dart';

class NextButton extends StatelessWidget {
  final void Function() onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: AppThemes.mainPink,
            minimumSize: Size(double.infinity, double.infinity)),
        onPressed: onPressed,
        child: Text("다음", style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}

class VerticalTextImageUI extends StatelessWidget {
  final List<String> textList;
  final String imagePath;

  const VerticalTextImageUI({Key? key, required this.textList, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> textWidgetList = [];
    for (var element in textList) {
      textWidgetList.add(Text(
        style: TextStyle(fontSize: 25),
        element,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: textWidgetList,
        ),
        Image(
          image: AssetImage(imagePath),
          width: 150,
          height: 150,
        ),
      ],
    );
  }
}

class ListViewItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  const ListViewItem({Key? key, required this.isSelected, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget item;
    Color textColor;

    if (isSelected) {
      textColor = AppThemes.mainPink;
    } else {
      textColor = AppThemes.mainPink_40;
    }
    item = Center(
      child: Text(text,
          style: TextStyle(color: textColor, fontSize: 40),
          textAlign: TextAlign.center),
    );

    if (isSelected) {
      item = Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppThemes.mainPink, width: 5),
            borderRadius: BorderRadius.all(AppThemes.radius)),
        child: item,
      );
    }
    return item;
  }
}

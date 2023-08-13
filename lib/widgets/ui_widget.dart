import 'package:flutter/material.dart';
import 'package:helpmeat/screens/arguments/grill_settings_arguments.dart';
import 'package:helpmeat/utils/resources.dart';

class AppTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const AppTextButton({Key? key, required this.onPressed, this.text = '다음'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: AppThemes.mainPink,
            minimumSize: Size(double.infinity, double.infinity)),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}

class VerticalTextImageUI extends StatelessWidget {
  final String text;
  final String imagePath;

  const VerticalTextImageUI({Key? key, required this.text, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: text,
                  style: TextStyle(fontSize: 25),
                ),
              ]
          ),
          textAlign: TextAlign.center,
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

class GrillSettingsListView extends StatelessWidget {
  final List<GrillSettingsInfo> elementList;
  final void Function(int) onSelectedItemChanged;
  final int selectedItem;
  final bool isKorean;

  const GrillSettingsListView({Key? key, required this.isKorean, required this.elementList, required this.selectedItem, required this.onSelectedItemChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 60,
      diameterRatio: 2,
      squeeze: 0.7,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: elementList.length,
        builder: (context, index) {
          return ListViewItem(isSelected: index == selectedItem, isKorean: isKorean, text: elementList[index].name,);
        },
      ),
      onSelectedItemChanged: onSelectedItemChanged,
    );
  }
}


class ListViewItem extends StatelessWidget {
  final bool isSelected;
  final String text;
  final bool isKorean;

  const ListViewItem({Key? key, required this.isSelected, required this.isKorean, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget item;
    Color textColor;
    double textSize;
    if (isKorean) {
      textSize = 40;
    } else {
      textSize = 30;
    }

    if (isSelected) {
      textColor = AppThemes.mainPink;
    } else {
      textColor = AppThemes.mainPink_40;
    }
    item = Center(
      child: Text(text,
          style: TextStyle(color: textColor, fontSize: textSize),
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
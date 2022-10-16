import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';

class MainBottomNavigationBarWidget extends StatefulWidget {
  const MainBottomNavigationBarWidget({
    Key? key,
    required this.onTapHander,
    required this.bottomTabs,
  }) : super(key: key);

  final Function(int) onTapHander;

  final List<BottomNavigationBarItem> bottomTabs;

  @override
  State<MainBottomNavigationBarWidget> createState() =>
      _MainBottomNavigationBarWidgetState();
}

class _MainBottomNavigationBarWidgetState
    extends State<MainBottomNavigationBarWidget> {
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // fix 为取消下边栏点击按钮时的水波纹,特意处理一层theme
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: widget.bottomTabs,
        // 类型设置(一旦超过4个,type会发生变化,所以最好设置一下)
        type: BottomNavigationBarType.fixed,
        // 设置bar激活时的颜色
        fixedColor: ColorUtil.hexToColor(Const.defaultSystemThemeColor),
        // 选择时的key
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          widget.onTapHander(index);
        },
        // 选择时文字大小
        selectedFontSize: 10,
        // 未选中时文字大小
        unselectedFontSize: 10,
      ),
    );
  }
}

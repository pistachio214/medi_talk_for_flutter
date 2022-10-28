import 'package:flutter/material.dart';
import 'package:medi_talk_for_flutter/handle/no_shadow_scroll_behavior_handle.dart';
import 'package:medi_talk_for_flutter/lang/const.dart';
import 'package:medi_talk_for_flutter/utils/color_util.dart';
import 'package:medi_talk_for_flutter/utils/logs_util.dart';

class MessageDetail extends StatefulWidget {
  const MessageDetail({Key? key}) : super(key: key);

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> with WidgetsBindingObserver {
  late final ScrollController _scrollController = ScrollController();

  //实例化
  late final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    /// 初始化
    WidgetsBinding.instance.addObserver(this);

    //输入框焦点
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // 失去焦点
      } else {
        // print('得到焦点');
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    /// 销毁
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _focusNode.unfocus();
  }

  void _clickMessageContainer() {
    // 判定如果键盘已唤醒,就收起
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          /// 键盘已收回
        } else {
          /// 键盘已弹出
          // 收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        }
      });
    });
  }

  // 构建头像和名称
  Widget _buildTitleWidget() {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 头像
          Container(
            width: 40,
            height: 40,
            //超出部分，可裁剪
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: ColorUtil.hexToColor("#D0E4FF"),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              "assets/images/doctor-item.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          // 名称和是否在线
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Dr. Mathew",
                  style: TextStyle(
                    color: Const.defaultFontColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.fiber_manual_record_sharp,
                      size: 8,
                      color: ColorUtil.hexToColor("#45BD9F"),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: ColorUtil.hexToColor("#45BD9F"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 构建操作按钮
  Widget _buildAction(IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Align(
        child: Container(
          height: 30,
          width: 30,
          //超出部分，可裁剪
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: () {},
            child: Icon(
              iconData,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final EdgeInsets edgeInsets = MediaQuery.of(context).padding;

    double viewWith = size.width;
    double height = size.height;

    double availableHeight =
        height - AppBar().preferredSize.height - edgeInsets.top - edgeInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: _buildTitleWidget(),
        backgroundColor: Const.defaultBarAndBodyThemColor,
        centerTitle: false,
        actions: [
          _buildAction(Icons.phone_sharp),
          _buildAction(Icons.videocam_sharp),
        ],
      ),
      backgroundColor: Const.defaultBarAndBodyThemColor,
      body: SafeArea(
        child: Container(
          width: viewWith,
          height: availableHeight,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _clickMessageContainer(),
                  child: Container(
                    width: viewWith,
                    constraints: BoxConstraints(
                      minHeight: 20,
                      maxHeight: height,
                    ),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ScrollConfiguration(
                      behavior: NoShadowScrollBehaviorHandle(),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            _buildAcrossWidget(
                              viewWith,
                              "hello,Ferdous 有什么可以帮助你的，我尽量的帮助你",
                            ),
                            _buildMySelfWidget(
                              viewWith,
                              "hello,Dr.Mathew 我的手不舒服,总是感觉很累,但是总也找不到原因",
                            ),
                            _buildAcrossWidget(
                              viewWith,
                              "Ferdous 你能发个照片吗?",
                            ),
                            _buildMySelfWidget(
                              viewWith,
                              "好的,马上发给您",
                            ),
                            _buildAcrossWidget(
                              viewWith,
                              "那你倒是发呀！",
                            ),
                            _buildMySelfWidget(
                              viewWith,
                              "我在拍呀",
                            ),
                            _buildMySelfWidget(
                              viewWith,
                              "你不要慌嘛",
                            ),
                            _buildAcrossWidget(
                              viewWith,
                              "快点的，别墨迹！我个急脾气",
                            ),
                            _buildAcrossWidget(
                              viewWith,
                              "能不快点的，我快没电了，坚持不了多久了",
                            ),
                            _buildMySelfWidget(
                              viewWith,
                              "再催下去，我都开始手抖了",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _buildInputAction(),
            ],
          ),
        ),
      ),
    );
  }

  // 我方的文本
  Widget _buildMySelfWidget(double viewWith, String content) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      constraints: BoxConstraints(
        minHeight: 50,
        maxWidth: viewWith - 25 * 2,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            child: Text(
              "2020-07-06 17:01",
              style: TextStyle(
                color: Colors.black12,
                fontSize: 12,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Align(
                child: Container(
                  margin: const EdgeInsets.only(right: 15, top: 10),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Const.defaultSystemThemeColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: viewWith - 25 * 2 - 15 - 50,
                      minHeight: 20,
                      minWidth: 50,
                    ),
                    child: Text(
                      content,
                      softWrap: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.topCenter,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 30,
                    width: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: ColorUtil.hexToColor("#D0E4FF"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/images/avatar.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 对方的文本
  Widget _buildAcrossWidget(double viewWith, String content) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      constraints: BoxConstraints(
        minHeight: 50,
        maxWidth: viewWith - 25 * 2,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            child: Text(
              "2020-07-06 17:01",
              style: TextStyle(
                color: Colors.black12,
                fontSize: 12,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                alignment: Alignment.topCenter,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 30,
                    width: 30,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: ColorUtil.hexToColor("#D0E4FF"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/images/doctor-item.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
              Align(
                child: Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: viewWith - 25 * 2 - 15 - 50,
                      minHeight: 20,
                      minWidth: 50,
                    ),
                    child: Text(
                      content,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Const.defaultFontColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInputAction() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 15),
      constraints: const BoxConstraints(minHeight: 55),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(minHeight: 55),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          decoration: const InputDecoration(
                            hintText: "Type here...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        constraints: const BoxConstraints(
                          minHeight: 55,
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.add,
                            color: Color.fromRGBO(25, 59, 104, 0.5),
                            size: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 55,
                height: 55,
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Const.defaultSystemThemeColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () => _sendMessage(),
                  child: const Icon(
                    Icons.send_sharp,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    //清除输入框焦点
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

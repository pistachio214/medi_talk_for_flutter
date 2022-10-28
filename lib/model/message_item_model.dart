class MessageItemModel {
  // 发送方 1：对方 2我方
  late int type;

  // 消息类型 1:文本 2:图片
  late int messageType;

  // 消息内容
  late String content;

  // 发送时间
  late String createdAt;

  // 我方的头像
  late String mySelfAvatar;

  // 对方的头像
  late String acrossAvatar;

  MessageItemModel(
    this.type,
    this.messageType,
    this.content,
    this.createdAt,
    this.mySelfAvatar,
    this.acrossAvatar,
  );
}

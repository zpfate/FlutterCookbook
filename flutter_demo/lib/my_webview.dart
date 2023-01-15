// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
//
//
// class MyWebView extends StatefulWidget {
//   final String mUrl;
//   final String? topBarTitle;
//
//   /// 是否需要js注入：default is true
//   final bool shouldJSInjection;
//
//   const MyWebView({Key? key, required this.mUrl, this.topBarTitle, required this.shouldJSInjection}) : super(key: key);
//
//   @override
//   State<MyWebView> createState() => _MyWebViewState();
// }
//
// class _MyWebViewState extends State<MyWebView> {
//   late WebViewController _controller;
//   bool mIsFinish = false;
//   String _title = "";
//
//   /// 是否支持分享
//   bool shareDisable = true;
//
//   List<JavascriptChannel> _jsChannels = [];
//
//   @override
//   void initState() {
//     super.initState();
//     jsInitStateFuntion();
//     WidgetsBinding.instance!.addPostFrameCallback((duration) {
//       ///页面初始化完成后再构建数据
//       _setupTimer();
//     });
//   }
//
//   @override
//   void dispose() async {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   void _setupTimer() {
//     const timeout = const Duration(seconds: 1);
//     Timer.periodic(timeout, (timer) async {
//       //callback function
//
//       String? result = await _controller.getTitle();
//
//       if (widget.topBarTitle != null) {
//         _title = widget.topBarTitle!;
//       } else {
//         _title = result!;
//         setState(() {});
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         child: Scaffold(
//             body: Column(
//           children: <Widget>[
//             buildWebHeaderWidget(),
//             buildWebBodyWidget(),
//           ],
//         )),
//         onWillPop: () async {
//           gobackFunction();
//           return Future.value(false);
//         });
//   }
//
//   buildWebHeaderWidget() {
//     return Container(
//       height: 80,
//       width: MediaQuery.of(context).size.width,
//       alignment: Alignment(-1, 0.5),
//       child: Stack(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 _title,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 17.0),
//               ),
//             ],
//           ),
//           InkWell(
//             onTap: () {
//               gobackFunction();
//             },
//             child: Container(
//               padding: EdgeInsets.only(left: 12, right: 12),
//               child: Icon(Icons.arrow_back),
//             ),
//           ),
//           Positioned(
//             left: 50,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context, true);
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 12, right: 12),
//                 child: Text(
//                   "关闭",
//                   key: null,
//                 ),
//               ),
//             ),
//           ),
//           // Positioned(
//           //   right: 0,
//           //   child: Offstage(
//           //     offstage: shareDisable,
//           //     child: InkWell(
//           //       onTap: () {
//           //         _getShareInfo(true);
//           //       },
//           //       child: Row(
//           //         children: <Widget>[
//           //           Image.asset(ImageUtil.getFitImgsPath("webview_share"),
//           //             width: 20,
//           //             height: 20,
//           //           ),
//           //           Container(
//           //             padding: EdgeInsets.only(left: 2, right: 12),
//           //             child: Text("分享",),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
//
//   buildWebBodyWidget() {
//     return Expanded(
//       child: Stack(
//         children: <Widget>[
//           WebView(
//             onWebViewCreated: (controller) {
//               _controller = controller;
//             },
//
//             /// js调用flutter
//             javascriptChannels: _jsChannels.toSet(),
//             onPageFinished: (url) {
//               _controller.evaluateJavascript("document.title").then((result) {
//                 mIsFinish = true;
//                 _getShareInfo(false);
//                 setState(() {
//                   if (widget.topBarTitle != null) {
//                     _title = widget.topBarTitle!;
//                   } else {
//                     _title = result.replaceAll("\"", "");
//                   }
//                 });
//               });
//             },
//             onPageStarted: (url) {
//               LogUtil.v(url);
//             },
// //            onAlertShow: (message) {
// //              globalShowCenterToast(message);
// //            },
//             navigationDelegate: (NavigationRequest request) {
//               if (request.url.startsWith("weixin://wap/pay?")) {
//
//                 try {
//                   /// 使用默认浏览器打开
//                   // launch(request.url);
//                 } catch (e) {
//                 }
//                 return NavigationDecision.prevent;
//               } else if (request.url.contains('tel')) {
//                 String url = request.url.replaceRange(0, 4, "");
//               }
//               return NavigationDecision.navigate;
//             },
//             initialUrl: widget.mUrl,
//             //JS执行模式 是否允许JS执行
//             javascriptMode: JavascriptMode.unrestricted,
//           ),
//           Offstage(
//             offstage: mIsFinish ? true : false,
//             child:const Center(
//               child:  CupertinoActivityIndicator(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _callPhone(Map json) async {
//     if (json['phone'] == null) {
//       // globalShowCenterToast("无法获取电话");
//     } else {
//       // CallUtil.doCall(json['phone'].toString());
//     }
//   }
//
//
//   _getShareInfo(bool share) {
//     /// 调用js方法返回分享所需要的参数
//     _controller.evaluateJavascript("window.shareByApp()").then((result) {
//       if (result == null) {
//         /// 无法分享
//         return;
//       }
//       if (result == 'denyShare') {
//         /// 不支持分享
//       } else {
//         if (share) {
//           var json = jsonDecode(result);
//           ShareUtil.shareToWechat(context,
//               title: json['title'], url: json['url'], img: json['img']);
//         } else {
//           /// 显示分享
//           shareDisable = false;
//           setState(() {});
//         }
//       }
//     });
//   }
//
//
//   void gobackFunction() async {
//     if (_controller != null) {
//       bool isGoBack = await _controller.canGoBack();
//       if (isGoBack) {
//         _controller.goBack();
//       } else {
//         Navigator.pop(context, true);
//       }
//     } else {
//     }
//   }
//
//   void refreshFunction() async {
//     if (_controller != null) {
//       _controller.reload();
//     } else {
//     }
//   }
//
//   void jsInitStateFuntion() {
//     if (widget.shouldJSInjection) {
//       _jsChannels = [
//         /// 分享
//         JavascriptChannel(
//             name: "share",
//             onMessageReceived: (JavascriptMessage message) {
//               Map<String, dynamic> json = jsonDecode(message.message);
//               ShareUtil.shareToWechat(context,
//                   title: json["title"],
//                   content: json["content"],
//                   url: json["url"],
//                   img: json["img"]);
//             }),
//
//         /// 关闭输入法
//         JavascriptChannel(
//             name: "closefocus",
//             onMessageReceived: (JavascriptMessage message) {
//               LogUtil.v("关闭输入法：");
//               FocusScope.of(context).requestFocus(FocusNode());
//             }),
//
//         /// 保存用户信息到本地
//         JavascriptChannel(
//             name: "userinfo",
//             onMessageReceived: (JavascriptMessage message) {
//               LogUtil.v("参数： ${message.message}");
//               Map<String, dynamic> json = jsonDecode(message.message);
//               updateLoginModel(LoginModel.fromMap(json)!);
//             }),
//
//         /// 关闭当前页面
//         JavascriptChannel(
//             name: "closeCurrentPage",
//             onMessageReceived: (JavascriptMessage message) {}),
//
//         /// 跳到收银台
//         JavascriptChannel(
//             name: "pay",
//             onMessageReceived: (JavascriptMessage message) {
//               Map<String, dynamic> json = jsonDecode(message.message);
//
//             }),
//
//         ///拨打电话
//         JavascriptChannel(
//             name: "callPhone",
//             onMessageReceived: (JavascriptMessage message) {
//               Map<String, dynamic> json = jsonDecode(message.message);
//               _callPhone(json);
//             }),
//
//         /// 跳转到网红轮胎页
//         JavascriptChannel(
//             name: "tyre",
//             onMessageReceived: (JavascriptMessage message) {
//               Map<String, dynamic> json = jsonDecode(message.message);
//               updateLoginModel(LoginModel.fromMap(json)!);
//             }),
//
//         /// 网红轮胎列表页
//         JavascriptChannel(
//             name: "tyrelist",
//             onMessageReceived: (JavascriptMessage message) {
//               NavigatorUtil.goHome(context, index: 3, homeTabIndex: 2);
//             }),
//
//         /// 首页
//         JavascriptChannel(
//             name: "home",
//             onMessageReceived: (JavascriptMessage message) {
//               NavigatorUtil.goHome(context, index: 0, homeTabIndex: 0);
//             }),
//
//         /// 轮胎详情页
//         JavascriptChannel(
//             name: "tyredetail",
//             onMessageReceived: (JavascriptMessage message) {
//               Map<String, dynamic> json = jsonDecode(message.message);
//               GoodsListItemModel? model = GoodsListItemModel.fromMap(json);
//               if (model != null) {
//                 NavigatorUtil.pushPage(
//                   context,
//                   GoodsDetailNew(
//                     itemId: model.itemId,
//                     goodsListItemModel: model,
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                 );
//               }
//             }),
//
//         /// 我的优惠券
//         JavascriptChannel(
//             name: "mycoupon",
//             onMessageReceived: (JavascriptMessage message) {
//               NavigatorUtil.pushPage(
//                   context,
//                   MyCoupon(
//                     defaultTabIndex: 0,
//                   ));
//             }),
//
//         /// 我的钱包
//         JavascriptChannel(
//             name: "toMyWallet",
//             onMessageReceived: (JavascriptMessage message) {
//               NavigatorUtil.pushPage(context, MyWalletPage());
//             }),
//
//         /// 分享成微信小程序
//         JavascriptChannel(
//             name: "shareMini",
//             onMessageReceived: (JavascriptMessage message) {
//               Map<String, dynamic> json = jsonDecode(message.message);
//               ShareUtil.shareMiniProgramToFriends(
//                   context: context,
//                   description: json["title"],
//                   url: json["url"],
//                   imagePath: json["img"]);
//             }),
//       ];
//     }
//   }
// }

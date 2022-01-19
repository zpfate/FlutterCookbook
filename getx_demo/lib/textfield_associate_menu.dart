import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldAssociateMenuController extends GetxController {

  List<String> data = [];
  TextFieldAssociateMenuController({required this.data});
  updateList(List<String> list) {
    data = list;
    update();
  }
}

class TextFieldAssociateMenu {

  static OverlayEntry? overlayEntry;
  static TextFieldAssociateMenuController? _associateMenuController;

  static void showOverlay(
      BuildContext context,{
        required GlobalKey globalKey,
        required List<String> list,
        required Function(int index) onSelected}
      ) {
    if (overlayEntry == null) {
      RenderObject? renderObject = globalKey.currentContext?.findRenderObject();
      if (renderObject != null) {
        Size size = renderObject.paintBounds.size;
        var vector = renderObject.getTransformTo(null).getTranslation();
        final double dx = vector.x;
        final double dy = vector.y;
        overlayEntry = createOverlayEntry(
          list: list,
            left: dx, top: dy + size.height,
            onSelected: onSelected);
        Overlay.of(context)?.insert(overlayEntry!);
      }
    } else {
      TextFieldAssociateMenuController controller = Get.find();
      controller.updateList(list);
    }
  }

  static void hideOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

 static OverlayEntry createOverlayEntry({
    double left = 0.0, double top = 0.0,
   required List<String> list,
   required Function(int index) onSelected}) {

    return OverlayEntry(builder: (context){
      return Positioned(
        width: 200,
        left: left,
        top: top,
        child: new CompositedTransformFollower(
          link: LayerLink(),
          child: new Material(
            child: MediaQuery.removePadding(
              context: context,
                removeTop: true,
                child: GetBuilder(
                  init: TextFieldAssociateMenuController(data: list),
                  builder: (TextFieldAssociateMenuController controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        String value = controller.data[index];
                        return ListTile(
                          dense: true,
                          hoverColor: Color(0xFF333333),
                          title: Text(value),
                          onTap: () {
                            onSelected(index);
                            hideOverlay();
                          },
                        );
                      },
                    );
                  },
                ),
            ),
          ),
        ),
      );
    });

}


}

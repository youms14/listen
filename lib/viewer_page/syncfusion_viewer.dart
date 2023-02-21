import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/bulletin_page/components/download_button.dart';
import 'package:listen/bulletin_page/components/item_bulletin.dart';
import 'package:listen/bulletin_page/components/share_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../api/bulletins_api_controller.dart';
import '../constants.dart';
import 'components/custom_appbar_viewer.dart';
import 'components/download_button_footer.dart';
import 'components/share_button_footer.dart';

class SyncfusionViewer extends StatefulWidget {
  const SyncfusionViewer({super.key});

  @override
  State<SyncfusionViewer> createState() => _SyncfusionViewerState();
}

class _SyncfusionViewerState extends State<SyncfusionViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final BulletinApiController _bullApiController =
      Get.find<BulletinApiController>();

  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kdc,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Get.find<CustomAppBarViewer>()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  height: s.height * 0.85,
                  //TODO: gerer le cas d'erreur quand le serveur ne reponds pas(penser à mettre un minuteur)
                  child: Obx(() => SfPdfViewer.file(
                        _bullApiController.file[0],
                        //'bulletins/Bulletin-810386J_2022_12.pdf',
                        // 'http://10.100.212.106:3000/newbullpdf/810386J/2022/12',
                        key: _pdfViewerKey,
                        controller: _pdfViewerController,
                        initialScrollOffset: const Offset(30, 0),
                        enableTextSelection: true,
                        canShowScrollHead: true,
                        canShowPaginationDialog: true,
                        canShowScrollStatus: true,
                        enableDoubleTapZooming: true,
                        initialZoomLevel: 1.2,
                        pageLayoutMode: PdfPageLayoutMode.continuous,
                        scrollDirection: PdfScrollDirection.vertical,
                        onDocumentLoadFailed: (details) => {
                          print(details),
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // icon: const Icon(
                                  //   Icons.remove_circle_outline_rounded,
                                  //   color: Colors.red,
                                  // ),
                                  icon: SizedBox(
                                    child: Image.asset(
                                      "assets/images/not_available.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  title: const Text('Oups!'),
                                  //content: Text('Erreur de document\n$details'),
                                  content: Text(
                                      "Bulletin du mois ${_bullApiController.mois} de l'année ${_bullApiController.annee} n'est pas encore disponible. Merci de réessayer avec d'autres paramètres."),
                                  actions: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        //Navigator.of(context).pop();
                                        Navigator.pop(context);
                                        Get.toNamed('/bulletin');
                                      },
                                    ),
                                  ],
                                );
                              })
                        },
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: s.height * 0.75,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //DownloadButtonFooter(), ShareButtonFooter()
                          DownloadButton(),
                          ShareButton()
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     //elevation: 8,
      //     //iconSize: 15,
      //     selectedItemColor: k1c,
      //     // onTap: _onItemTapped,
      //     elevation: 20,
      //     currentIndex: 1,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: ItemBulletinFooter(), label: '12-2022'),
      //       BottomNavigationBarItem(
      //           icon: ItemBulletinFooter(), label: '11-2022'),
      //       BottomNavigationBarItem(
      //           icon: ItemBulletinFooter(), label: '10-2022'),
      //     ]),
    );
  }
}

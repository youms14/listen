import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listen/bulletin_page/components/download_button.dart';
import 'package:listen/bulletin_page/components/item_bulletin.dart';
import 'package:listen/bulletin_page/components/share_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../constants.dart';
import 'components/custom_appbar_viewer.dart';
import 'components/download_button_footer.dart';
import 'components/item_bulletin_footer.dart';
import 'components/share_button_footer.dart';

class SyncfusionViewer extends StatefulWidget {
  const SyncfusionViewer({super.key});

  @override
  State<SyncfusionViewer> createState() => _SyncfusionViewerState();
}

class _SyncfusionViewerState extends State<SyncfusionViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

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
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                height: s.height * 0.85,
                //TODO: gerer le cas d'erreur quand le serveur ne reponds pas(penser à mettre un minuteur)
                child: SfPdfViewer.asset(
                  'bulletins/Bulletin-810386J_2022_12.pdf',
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
                            title: const Text('Oups!'),
                            content: Text('Erreur de document\n$details'),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        })
                  },
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

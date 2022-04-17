import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('title')),
        body: PdfPreview(
          build: (format) => _generatePdf(format, 'title'),
        ),
      );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final image = await imageFromAssetBundle('assets/images/sg.jpg');
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
          marginBottom: 0,
          marginLeft: 0,
          marginRight: 0,
          marginTop: 0,
          width: 175*2.83,
          height: 80*2.83,
        ),
          // buildBackground: (context) => pw.Image(
          //   image,dpi: 300,
          // ),
            
      ),
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                child:  pw.Stack(
                  children: [
                    pw.Positioned(
                      right: 19                ,
                      top: 13,
                      child: pw.Text('12345678.00', style: pw.TextStyle(font: font, fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Positioned(
                      left: 100                ,
                      top: 57,
                      child: pw.Text('Mokhtar ALILAT', style: pw.TextStyle(font: font, fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Positioned(
                      left: 15                ,
                      top: 71,
                      child: pw.Text('Mokhtar ALILAT', style: pw.TextStyle(font: font, fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Positioned(
                      left: 55                ,
                      top: 85,
                      child: pw.Text('Mokhtar ALILAT', style: pw.TextStyle(font: font, fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Positioned(
                      right: 38               ,
                      top: 125,
                      child: pw.Text('17/04/2022', style: pw.TextStyle(font: font, fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.Positioned(
                      right: 160               ,
                      top: 125,
                      child: pw.Text('Alger', style: pw.TextStyle(font: font, fontSize: 11, fontWeight: pw.FontWeight.bold)),
                    ),
              ],
              ),
          width: 175*2.82,
          height: 80*2.82,
              )
              
              
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}


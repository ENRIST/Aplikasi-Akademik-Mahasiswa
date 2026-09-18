import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class KalenderPage extends StatelessWidget {
  const KalenderPage({super.key});

  static const Color _primaryBlue = Color(0xFF4285F4);
  static const Color _iconBg = Color(0xFFE8EEFC);
  static const Color _bgPage = Color(0xFFF1F3F9);
  static const Color _green = Color(0xFF22C55E);
  static const Color _greenBg = Color(0xFFE7F8EE);
  static const Color _textGray = Color(0xFF8E95A5);
  static const Color _textDark = Color(0xFF1F2937);

  static const List<Map<String, String?>> _data = [
    {'tahun': '2026/2027', 'pdf': 'assets/pdf/kalender_2026_2027.pdf'},
    {'tahun': '2025/2026', 'pdf': 'assets/pdf/kalender_2025_2026.pdf'},
    {'tahun': '2024/2025', 'pdf': null},
    {'tahun': '2023/2024', 'pdf': null},
    {'tahun': '2022/2023', 'pdf': null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgPage,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                itemCount: _data.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, i) {
                  final d = _data[i];
                  final pdfPath = d['pdf'];

                  return _KalenderCard(
                    tahun: d['tahun']!,
                    onTapPdf: () =>
                        _handlePdfTap(context, d['tahun']!, pdfPath),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePdfTap(BuildContext context, String tahun, String? pdfPath) {
    if (pdfPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF $tahun belum tersedia'),
          backgroundColor: _primaryBlue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PdfPreviewModal(tahun: tahun, pdfPath: pdfPath),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 26),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4A8BF5), Color(0xFF3B72E8)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: const Text(
        'Kalender Akademik',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _KalenderCard extends StatelessWidget {
  final String tahun;
  final VoidCallback onTapPdf;

  const _KalenderCard({required this.tahun, required this.onTapPdf});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: KalenderPage._iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.calendar_month_rounded,
              color: KalenderPage._primaryBlue,
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kalender Akademik',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: KalenderPage._textDark,
                    height: 1.2,
                  ),
                ),
                Text(
                  tahun,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: KalenderPage._textDark,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Universitas Negeri Surabaya',
                  style: TextStyle(
                    fontSize: 12,
                    color: KalenderPage._textGray,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: KalenderPage._greenBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: KalenderPage._green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Tersedia',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF15803D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              _buildPdfButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPdfButton() {
    return Material(
      color: KalenderPage._primaryBlue,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTapPdf,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.filePdf, color: Colors.white, size: 14),
              SizedBox(width: 6),
              Text(
                'Lihat PDF',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PdfPreviewModal extends StatelessWidget {
  final String tahun;
  final String pdfPath;

  const _PdfPreviewModal({required this.tahun, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 12, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Preview Kalender $tahun',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded, size: 24),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: SfPdfViewer.asset(
                  pdfPath,
                  controller: PdfViewerController(),
                  canShowScrollHead: false,
                  canShowScrollStatus: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

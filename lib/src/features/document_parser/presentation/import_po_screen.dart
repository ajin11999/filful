import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/excel_po_parser.dart';
import '../data/pdf_po_parser.dart';
import '../domain/parsed_po.dart';
import 'po_import_preview_screen.dart';

class ImportPoScreen extends ConsumerStatefulWidget {
  const ImportPoScreen({super.key});

  @override
  ConsumerState<ImportPoScreen> createState() => _ImportPoScreenState();
}

class _ImportPoScreenState extends ConsumerState<ImportPoScreen> {
  bool _isLoading = false;

  Future<void> _pickAndParseFile() async {
    try {
      final files = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'xlsx', 'xls'],
      );

      if (files.isNotEmpty && files.first.path != null) {
        final filePath = files.first.path!;
        await _processFilePath(filePath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error memilih file: $e'),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    }
  }

  Future<void> _processFilePath(String filePath) async {
    setState(() => _isLoading = true);
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('File tidak ditemukan: $filePath');
      }

      ParsedPo parsedPo;
      final ext = filePath.split('.').last.toLowerCase();

      if (ext == 'pdf') {
        const parser = PdfPoParser();
        parsedPo = await parser.parseFile(file);
      } else if (ext == 'xlsx' || ext == 'xls') {
        const parser = ExcelPoParser();
        parsedPo = await parser.parseFile(file);
      } else {
        throw Exception('Format file tidak didukung: .$ext');
      }

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PoImportPreviewScreen(parsedPo: parsedPo),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal memproses file: $e'),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // Helper shortcut to import sample PO 045 directly on test devices / emulator
  Future<void> _importSamplePo() async {
    const samplePath = '/home/ajin/Downloads/PO 045 - Cahyadi (KP Ketapang) Rev 01.pdf';
    final sampleFile = File(samplePath);
    if (await sampleFile.exists()) {
      await _processFilePath(samplePath);
    } else {
      await _pickAndParseFile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Impor Dokumen PO'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.upload_file_rounded,
                  size: 72,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Pilih File PO Perusahaan',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sistem akan otomatis membaca nomor PO, daftar barang, jumlah, dan harga satuan.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 36),

              FilledButton.icon(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _isLoading ? null : _pickAndParseFile,
                icon: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                      )
                    : const Icon(Icons.folder_open_rounded, size: 28),
                label: Text(
                  _isLoading ? 'Membaca Dokumen...' : 'Pilih File (PDF / Excel)',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 16),

              // Sample PO Shortcut button for instant testing
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _isLoading ? null : _importSamplePo,
                icon: const Icon(Icons.auto_awesome, color: Colors.orange),
                label: const Text(
                  'Coba Impor Contoh PO 045 (49 Item)',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 32),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.offline_pin_outlined,
                            size: 20, color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          '100% Bekerja Offline',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Semua proses ekstraksi PDF dan Excel berjalan langsung di perangkat Anda tanpa membutuhkan koneksi internet.',
                      style: TextStyle(
                        fontSize: 13,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

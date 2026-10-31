import 'dart:io';
import 'dart:typed_data';

/// PingFang ships as a font collection under a hashed asset directory.
File get pingFangCollection => Directory('/System/Library/AssetsV2')
    .listSync()
    .whereType<Directory>()
    .where((dir) => dir.path.contains('com_apple_MobileAsset_Font'))
    .expand((dir) => dir.listSync())
    .map((asset) => File('${asset.path}/AssetData/PingFang.ttc'))
    .firstWhere(
      (file) => file.existsSync(),
      orElse: () => throw StateError('PingFang.ttc not found'),
    );

/// The test engine only reads the first font of a collection. This copies
/// the named font out of [file] as a standalone font.
ByteData fontFromCollection(File file, String postScriptName) {
  final collection = ByteData.sublistView(file.readAsBytesSync());
  final fontCount = collection.getUint32(8);
  for (var i = 0; i < fontCount; i++) {
    final fontOffset = collection.getUint32(12 + i * 4);
    if (_postScriptName(collection, fontOffset) == postScriptName) {
      return _extractFont(collection, fontOffset);
    }
  }
  throw StateError('$postScriptName not found in ${file.path}');
}

typedef _TableRecord = ({int tag, int checksum, int offset, int length});

List<_TableRecord> _tableRecords(ByteData collection, int fontOffset) {
  final tableCount = collection.getUint16(fontOffset + 4);
  return [
    for (var i = 0; i < tableCount; i++)
      (
        tag: collection.getUint32(fontOffset + 12 + i * 16),
        checksum: collection.getUint32(fontOffset + 16 + i * 16),
        offset: collection.getUint32(fontOffset + 20 + i * 16),
        length: collection.getUint32(fontOffset + 24 + i * 16),
      ),
  ];
}

/// Windows names are UTF-16. Some Apple fonts such as Thonburi only have a
/// Mac name, which is one byte per character for a PostScript name.
String? _postScriptName(ByteData collection, int fontOffset) {
  const nameTag = 0x6E616D65;
  final table = _tableRecords(
    collection,
    fontOffset,
  ).firstWhere((record) => record.tag == nameTag);
  final recordCount = collection.getUint16(table.offset + 2);
  final stringsOffset = table.offset + collection.getUint16(table.offset + 4);
  for (var i = 0; i < recordCount; i++) {
    final record = table.offset + 6 + i * 12;
    final platformId = collection.getUint16(record);
    final nameId = collection.getUint16(record + 6);
    if (nameId != 6 || (platformId != 1 && platformId != 3)) continue;
    final length = collection.getUint16(record + 8);
    final start = stringsOffset + collection.getUint16(record + 10);
    final codeUnits = platformId == 1
        ? [for (var j = 0; j < length; j++) collection.getUint8(start + j)]
        : [
            for (var j = 0; j < length; j += 2) collection.getUint16(start + j),
          ];
    return String.fromCharCodes(codeUnits);
  }
  return null;
}

ByteData _extractFont(ByteData collection, int fontOffset) {
  final records = _tableRecords(collection, fontOffset);
  final headerLength = 12 + records.length * 16;
  final paddedLengths = records.map((record) => (record.length + 3) & ~3);
  final output = ByteData(
    headerLength + paddedLengths.fold(0, (sum, length) => sum + length),
  );
  final source = Uint8List.sublistView(collection);
  final bytes = output.buffer.asUint8List()
    ..setRange(0, 12, source, fontOffset);
  var dataOffset = headerLength;
  for (final (i, record) in records.indexed) {
    output
      ..setUint32(12 + i * 16, record.tag)
      ..setUint32(16 + i * 16, record.checksum)
      ..setUint32(20 + i * 16, dataOffset)
      ..setUint32(24 + i * 16, record.length);
    bytes.setRange(
      dataOffset,
      dataOffset + record.length,
      source,
      record.offset,
    );
    dataOffset += (record.length + 3) & ~3;
  }
  return output;
}

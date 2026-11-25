import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weeksebelas/model/barang.dart';
import 'package:weeksebelas/presentation/controller/barang_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<BarangController>();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        children: [
          Text("LIST BARANG"),

          Expanded(
            child: Obx(() {
              if (ctr.barangList.isEmpty) {
                return Center(child: Text("Data Belum Ada"));
              }

              return ListView.builder(
                itemCount: ctr.barangList.length,
                itemBuilder: (context, index) {
                  final barang = ctr.barangList[index];
                  return Card(
                    child: ListTile(
                      title: Text(barang.nama),
                      subtitle: Text("Stok Barang ${barang.stok}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              dialogEdit(context, ctr, barang);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              dialogHapus(context, ctr, barang);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogTambah(context, ctr);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void dialogTambah(BuildContext context, BarangController ctr) {
    final namaC = TextEditingController();
    final stokC = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Barang"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaC,
                decoration: InputDecoration(labelText: "Nama Barang"),
              ),
              TextField(
                controller: stokC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Stok"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (namaC.text.isEmpty || stokC.text.isEmpty) {
                  return;
                }
                final barangBaru = Barang(
                  nama: namaC.text,
                  stok: int.tryParse(stokC.text) ?? 0,
                );
                ctr.tambahBarang(barangBaru);
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void dialogEdit(BuildContext context, BarangController ctr, Barang barang) {
    final namaC = TextEditingController(text: barang.nama);
    final stokC = TextEditingController(text: barang.stok.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Barang"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaC,
                decoration: InputDecoration(labelText: "Nama Barang"),
              ),
              TextField(
                controller: stokC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Stok"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (namaC.text.isEmpty || stokC.text.isEmpty) {
                  return;
                }
                final barangEdit = Barang(
                  id: barang.id,
                  nama: namaC.text,
                  stok: int.tryParse(stokC.text) ?? 0,
                );
                ctr.updateBarang(barangEdit);
                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void dialogHapus(BuildContext context, BarangController ctr, Barang barang) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Barang"),
          content: Text("Yakin mau hapus ${barang.nama}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                ctr.hapusBarang(barang.id!);
                Navigator.pop(context);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}

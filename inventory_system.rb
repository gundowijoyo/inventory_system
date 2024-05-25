# Kelas untuk menyimpan data barang
class Barang
  attr_accessor :id, :nama, :stok

  def initialize(id, nama, stok)
    @id = id
    @nama = nama
    @stok = stok
  end
end

# Kelas untuk sistem inventaris barang
class SistemInventaris
  def initialize
    @barang_list = []
  end

  # Fungsi untuk menambah barang baru
  def tambah_barang(id, nama, stok)
    barang_baru = Barang.new(id, nama, stok)
    @barang_list << barang_baru
    puts "Barang berhasil ditambahkan: #{nama}"
  end

  # Fungsi untuk menghapus barang berdasarkan ID
  def hapus_barang(id)
    @barang_list.delete_if { |barang| barang.id == id }
    puts "Barang dengan ID #{id} berhasil dihapus."
  end

  # Fungsi untuk memperbarui stok barang
  def update_barang(id, stok_baru)
    barang = @barang_list.find { |b| b.id == id }
    if barang
      barang.stok = stok_baru
      puts "Stok barang #{barang.nama} berhasil diperbarui."
    else
      puts "Barang dengan ID #{id} tidak ditemukan."
    end
  end

  # Fungsi untuk mencatat masuknya barang
  def catat_masuk(id, jumlah)
    barang = @barang_list.find { |b| b.id == id }
    if barang
      barang.stok += jumlah
      puts "Stok barang #{barang.nama} berhasil ditambah."
    else
      puts "Barang dengan ID #{id} tidak ditemukan."
    end
  end

  # Fungsi untuk mencatat keluarnya barang
  def catat_keluar(id, jumlah)
    barang = @barang_list.find { |b| b.id == id }
    if barang
      if barang.stok >= jumlah
        barang.stok -= jumlah
        puts "Stok barang #{barang.nama} berhasil dikurangi."
      else
        puts "Stok barang tidak mencukupi."
      end
    else
      puts "Barang dengan ID #{id} tidak ditemukan."
    end
  end

  # Fungsi untuk menampilkan laporan stok barang
  def laporan_stok
    puts "\nLaporan Stok Barang"
    puts "ID\tNama\tStok"
    @barang_list.each do |barang|
      puts "#{barang.id}\t#{barang.nama}\t#{barang.stok}"
    end
  end
end

def main
  sistem_inventaris = SistemInventaris.new

  loop do
    # Menampilkan menu utama
    puts "\nSistem Inventaris Barang"
    puts "1. Tambah Barang"
    puts "2. Hapus Barang"
    puts "3. Update Stok Barang"
    puts "4. Catat Barang Masuk"
    puts "5. Catat Barang Keluar"
    puts "6. Laporan Stok Barang"
    puts "7. Keluar"
    print "Masukkan pilihan: "
    pilihan = gets.chomp.to_i

    # Memproses pilihan pengguna
    case pilihan
    when 1
      print "Masukkan ID barang: "
      id = gets.chomp
      print "Masukkan nama barang: "
      nama = gets.chomp
      print "Masukkan stok awal: "
      stok = gets.chomp.to_i
      sistem_inventaris.tambah_barang(id, nama, stok)
    when 2
      print "Masukkan ID barang yang akan dihapus: "
      id = gets.chomp
      sistem_inventaris.hapus_barang(id)
    when 3
      print "Masukkan ID barang yang akan diupdate: "
      id = gets.chomp
      print "Masukkan stok baru: "
      stok_baru = gets.chomp.to_i
      sistem_inventaris.update_barang(id, stok_baru)
    when 4
      print "Masukkan ID barang yang masuk: "
      id = gets.chomp
      print "Masukkan jumlah barang yang masuk: "
      jumlah = gets.chomp.to_i
      sistem_inventaris.catat_masuk(id, jumlah)
    when 5
      print "Masukkan ID barang yang keluar: "
      id = gets.chomp
      print "Masukkan jumlah barang yang keluar: "
      jumlah = gets.chomp.to_i
      sistem_inventaris.catat_keluar(id, jumlah)
    when 6
      sistem_inventaris.laporan_stok
    when 7
      puts "Keluar dari aplikasi."
      break
    else
      puts "Pilihan tidak valid."
    end
  end
end

main

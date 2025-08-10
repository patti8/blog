# This file should contain all the record creation needed to seed the database with its default values.

puts "Cleaning database..."
Article.destroy_all

puts "Creating articles..."

Article.create!([
  {
    title: 'Konsep "Digital Garden" untuk Berpikir Lebih Jernih',
    lead: 'Meninggalkan format blog tradisional dan beralih ke kebun digital yang lebih dinamis dan saling terhubung. Sebuah pendekatan baru dalam berbagi pengetahuan.',
    content: '<p>Konsep <strong>Digital Garden</strong> atau "kebun digital" adalah sebuah metafora untuk ruang online pribadi yang lebih fokus pada proses belajar dan eksplorasi daripada sekadar memamerkan hasil akhir...</p><h2>Perbedaan Utama dengan Blog Tradisional</h2><p>Perbedaan mendasarnya terletak pada pola pikir...</p><blockquote>"Kebun adalah untuk ditanami, dirawat, dan dinikmati proses pertumbuhannya. Bukan sekadar tempat untuk memajang bunga yang sudah dipetik."</blockquote>',
    published_at: Time.zone.parse('2025-08-07')
  },
  {
    title: 'Mengapa Minimalisme Fungsional Penting dalam Desain UI',
    lead: 'Fokus pada esensi dan membuang semua yang tidak perlu. Bagaimana prinsip "less is more" menciptakan pengalaman pengguna yang lebih baik dan intuitif.',
    content: '<p>Minimalisme fungsional adalah pendekatan desain yang mengutamakan kesederhanaan dan kejelasan di atas segalanya...</p>',
    published_at: Time.zone.parse('2025-07-25')
  },
  {
    title: 'Memilih Tipografi yang Tepat untuk Keterbacaan Maksimal',
    lead: 'Lebih dari sekadar estetika, tipografi adalah tentang fungsionalitas. Panduan praktis memilih dan memasangkan font untuk blog Anda.',
    content: '<p>Tipografi adalah seni menata huruf, dan dalam konteks digital, tujuannya adalah untuk membuat teks mudah dibaca dan nyaman di mata...</p>',
    published_at: Time.zone.parse('2025-07-10')
  }
])

puts "Finished seeding #{Article.count} articles."


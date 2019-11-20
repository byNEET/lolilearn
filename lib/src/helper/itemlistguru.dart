class InfoGuru {
  final String id;
  final String nama;
  final String posisi;
  final String email;
  final String urlgambar;
  final Detailguruku detailguru;
  InfoGuru(
      {this.id,
      this.nama,
      this.posisi,
      this.email,
      this.urlgambar,
      this.detailguru});
}

class Detailguruku {
  final String bio;
  Detailguruku({this.bio});
}

List<InfoGuru> listInfoGuru = [
  InfoGuru(
    id: "1",
    nama: "R. Ananta WK",
    posisi: "Direktur Q_Smart",
    email: "jscvrnd19@gmail.com",
    urlgambar: 'images/ananta.jpg',
    detailguru: Detailguruku(
      bio:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ),
  InfoGuru(
    id: "2",
    nama: "Darlena, S.Si., M.Sc",
    posisi: "Manager Q_Smart",
    email: "yupi97@gmail.com",
    urlgambar: 'images/lena.jpg',
    detailguru: Detailguruku(
      bio:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ),
  InfoGuru(
    id: "3",
    nama: "Janiati, S.Si",
    posisi: "Pengajar Q_Smart",
    email: "jscvrnd19@gmail.com",
    urlgambar: 'images/janiati.jpg',
    detailguru: Detailguruku(
      bio:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ),
  InfoGuru(
    id: "4",
    nama: "Titin, A.Md",
    posisi: "Pengajar Q_Smart",
    email: "yupi97@gmail.com",
    urlgambar: 'images/titin.jpg',
    detailguru: Detailguruku(
      bio:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ),
  InfoGuru(
    id: "5",
    nama: "Yulita",
    posisi: "Pengajar Q_Smart",
    email: "jscvrnd19@gmail.com",
    urlgambar: 'images/yulita.jpg',
    detailguru: Detailguruku(
      bio:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ),
  InfoGuru(
    id: "6",
    nama: "Puji Nina, S.Pd",
    posisi: "Pengajar Q_Smart",
    email: "yupi97@gmail.com",
    urlgambar: 'images/nina.jpg',
    detailguru: Detailguruku(
      bio:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
  ),
];

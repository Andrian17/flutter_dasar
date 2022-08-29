class PizzaHut {
  String nama;
  String kategori;
  String deskripsi;
  int harga;
  String gambar;
  bool fav;

  PizzaHut(
      {required this.nama,
      required this.kategori,
      required this.deskripsi,
      required this.harga,
      required this.gambar,
      required this.fav});
}

var PizzaHutList = [
  PizzaHut(
      kategori: "pizza",
      nama: "Meat Lover",
      deskripsi:
          "Irisan sosis sapi, daging sapi cincang, burger sapi, sosis ayam.",
      harga: 49500,
      fav: false,
      gambar: "images/menu/meat-lover.jpg"),
  PizzaHut(
      kategori: "pizza",
      nama: "Super Supreme",
      deskripsi:
          "Daging ayam dan sapi asap, daging sapi cincang, burger sapi, jamur, paprika merah dan paprika hijau.",
      harga: 49500,
      fav: false,
      gambar: "images/menu/supreme.jpg"),
  PizzaHut(
      kategori: "pizza",
      nama: "Tuna Melt",
      deskripsi: "Irisan daging ikan tuna, butiran jagung, saus mayonnaise.",
      harga: 49500,
      fav: false,
      gambar: "images/menu/tuna-melt.jpg"),
  PizzaHut(
      kategori: "pizza",
      nama: "American Favourite",
      deskripsi: "Pepperoni sapi, daging sapi cincang, jamur.",
      harga: 49500,
      fav: false,
      gambar: "images/menu/american-favourite.jpg"),
  PizzaHut(
      kategori: "pasta",
      nama: "Beef Spaghetti",
      deskripsi: "Pepperoni sapi, daging sapi cincang, jamur.",
      harga: 43000,
      fav: false,
      gambar: "images/menu/beef-spaghetti.jpg"),
  PizzaHut(
      kategori: "pasta",
      nama: "Beef Lasagna",
      deskripsi:
          "Dipanggang, daging sapi cincang. krim putih lembut di tiap lapisan.",
      harga: 48000,
      fav: false,
      gambar: "images/menu/beef-lasagna.jpg"),
  PizzaHut(
      kategori: "pasta",
      nama: "Creamy Beef Fettuccine",
      deskripsi: "Daging sapi asap dan jamur, ditumis dengan saus krim lembut.",
      harga: 43000,
      fav: false,
      gambar: "images/menu/creamy-beef-fettuccine.jpg"),
  PizzaHut(
      kategori: "nasi",
      nama: "Meatballs Beef Mushroom",
      deskripsi: "Bola daging sapi dengan saus daging sapi cincang dan jamur.",
      harga: 40000,
      fav: true,
      gambar: "images/menu/meatballs-beef-mushroom.jpg"),
  PizzaHut(
      kategori: "nasi",
      nama: "Black Pepper Chicken",
      deskripsi: "Ayam dengan saus lada hitam.",
      harga: 40000,
      fav: false,
      gambar: "images/menu/black-pepper-chicken.jpg"),
  PizzaHut(
      kategori: "nasi",
      nama: "Oriental Chicken",
      deskripsi: "Daging ayam berpadu dengan saus oriental.",
      harga: 40000,
      fav: true,
      gambar: "images/menu/oriental-chicken.jpg"),
  PizzaHut(
      kategori: "minuman",
      nama: "Choco Mint",
      deskripsi:
          "As its name suggests, Chocolate mint is a variety of mint that has nuances of chocolate in both fragrance and flavor. Subtle notes of cocoa and vanilla mix with a traditional spicy mint finish. When grown in sufficient sunlight, the lush green leaves even develop burgundy veins to match the chocolate-colored stems.",
      harga: 24000,
      fav: true,
      gambar: "images/menu/choco-mint.jpg"),
  PizzaHut(
      kategori: "minuman",
      nama: "Toffee Coffee",
      deskripsi:
          "Coffee Toffee offers a burst of coffee flavours in a bite-sized toffee. Made with just milk, coffee and sugar, this super easy toffee recipe is a must-try. You can easily make it in just 20 minutes and then let it set in the fridge for some time.",
      harga: 24000,
      fav: false,
      gambar: "images/menu/toffee-coffee.jpg"),
  PizzaHut(
      kategori: "minuman",
      nama: "Green Tea Shake",
      deskripsi:
          "At their most basic, green smoothies combine leafy greens like spinach, kale, arugula, and microgreens with a base liquid like water. ",
      harga: 24000,
      fav: false,
      gambar: "images/menu/green-tea-shake.jpg"),
  PizzaHut(
      kategori: "minuman",
      nama: "Strawberry Milkshake",
      deskripsi:
          "It fights cholesterol and cancer, helps in skin improvement, keeps blood pressure in balance, helps in the reduction of inflammation of the joints, and helps in the reduction of inflammation of the joints controlling type two diabetes if you are diabetic.",
      harga: 24000,
      fav: false,
      gambar: "images/menu/strawberry-milkshake.jpg"),
  PizzaHut(
      kategori: "minuman",
      nama: "Chocolate Milkshake",
      deskripsi:
          "a thoroughly shaken or blended drink made of milk, a flavoring syrup, and often ice cream a chocolate milkshake.",
      harga: 24000,
      fav: true,
      gambar: "images/menu/chocolate-milkshake.jpg")
];

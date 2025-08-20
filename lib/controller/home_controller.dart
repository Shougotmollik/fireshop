import 'package:fireshop/model/category_model.dart';
import 'package:fireshop/model/product_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // category demo data list
  final List<CategoryModel> categories = [
    CategoryModel(name: 'Headphone', icon: 'assets/images/headphone_icon.png'),
    CategoryModel(name: 'Laptop', icon: 'assets/images/laptop.png'),
    CategoryModel(name: 'Watch', icon: 'assets/images/watch.png'),
    CategoryModel(name: 'TeleVision', icon: 'assets/images/TV.png'),
  ];

  // Expanded product demo data list with longer titles and descriptions
  final List<ProductModel> products = [
    ProductModel(
      title:
          'Zebronics Over-Ear Wired Headphone with Noise Cancellation and Deep Bass',
      imagePath: 'assets/images/headphone2.png',
      description:
          'Experience crystal clear sound with the Zebronics over-ear wired headphone. Designed for music lovers, it comes with powerful bass, noise cancellation, and a comfortable cushioned design that makes it perfect for long listening sessions whether at home, work, or while traveling.',
      price: 200,
    ),
    ProductModel(
      title:
          'Asus Vivobook 15.6-inch Laptop with Intel Core i5, 8GB RAM, and 512GB SSD Storage',
      imagePath: 'assets/images/laptop2.png',
      description:
          'The Asus Vivobook is a lightweight yet powerful laptop featuring Intel Core i5, 8GB RAM, and 512GB SSD storage. Perfect for students, professionals, and gamers, it comes with a full HD display and long battery life that ensures productivity throughout the day.',
      price: 400,
    ),
    ProductModel(
      title:
          'Digital LED Sports Watch for Men and Women with Waterproof Design and Multiple Features',
      imagePath: 'assets/images/watch.png',
      description:
          'This stylish digital LED watch is designed for everyday wear. It is waterproof, durable, and comes with multiple features including a stopwatch, alarm, and backlight display. Perfect for both casual and sports use.',
      price: 199,
    ),
    ProductModel(
      title:
          'Smart Fitness Watch with Heart-Rate Monitoring, Step Counter, and Mobile Connectivity',
      imagePath: 'assets/images/watch2.png',
      description:
          'Stay connected and fit with this premium smart fitness watch. Track your steps, calories burned, and heart rate in real time. Receive notifications directly from your smartphone, control music, and enjoy its sleek design with a vibrant display.',
      price: 299,
    ),
    ProductModel(
      title:
          'Portable Bluetooth Wireless Speaker with Surround Sound and 12 Hours Battery Backup',
      imagePath: 'assets/images/laptop2.png',
      description:
          'Enjoy immersive sound with this portable Bluetooth wireless speaker. It delivers deep bass, clear vocals, and surround sound experience. Compact and lightweight, it is perfect for travel, parties, or home use with up to 12 hours of battery life.',
      price: 149,
    ),
    ProductModel(
      title:
          'Apple iPhone 15 Pro Max 256GB with A16 Bionic Chip and Super Retina XDR Display',
      imagePath: 'assets/images/laptop2.png',
      description:
          'The iPhone 15 Pro Max is Apple’s most advanced smartphone, featuring the powerful A16 Bionic chip, a stunning Super Retina XDR display, and an improved triple-camera system with advanced night mode and 8K video recording capabilities.',
      price: 1200,
    ),
    ProductModel(
      title:
          'Samsung Galaxy S23 Ultra 512GB with Snapdragon 8 Gen 2 Processor and S-Pen Support',
      imagePath: 'assets/images/galaxy.png',
      description:
          'The Samsung Galaxy S23 Ultra is built for performance and creativity. Featuring the Snapdragon 8 Gen 2 processor, up to 512GB storage, a quad-camera setup with 200MP sensor, and the iconic S-Pen for productivity, it redefines smartphone innovation.',
      price: 999,
    ),
    ProductModel(
      title:
          'Sony Professional DSLR Camera with 24.2MP Sensor, 4K Recording, and Wi-Fi Connectivity',
      imagePath: 'assets/images/camera.png',
      description:
          'Capture your best moments with the Sony professional DSLR camera. Equipped with a 24.2MP sensor, 4K video recording, fast autofocus, and built-in Wi-Fi for instant sharing. Ideal for photography enthusiasts and professionals alike.',
      price: 800,
    ),
    ProductModel(
      title:
          'Dell Gaming Laptop with Intel Core i7, RTX 3060 Graphics, 16GB RAM, and 1TB SSD',
      imagePath: 'assets/images/laptop_gaming.png',
      description:
          'The Dell Gaming Laptop is engineered for gamers and creators. Featuring Intel Core i7, NVIDIA RTX 3060, 16GB RAM, and a 1TB SSD, it offers smooth gameplay, high-speed multitasking, and a stunning full HD display with 144Hz refresh rate.',
      price: 1500,
    ),
    ProductModel(
      title:
          'Apple iPad Pro 12.9-inch Tablet with M2 Chip, Liquid Retina XDR Display, and 5G Support',
      imagePath: 'assets/images/ipad.png',
      description:
          'The iPad Pro redefines tablet computing with the powerful M2 chip, Liquid Retina XDR display, and 5G connectivity. Ideal for creative professionals, it supports the Apple Pencil and Magic Keyboard for a complete workstation experience.',
      price: 1100,
    ),
    ProductModel(
      title:
          'Samsung 55-inch 4K Ultra HD Smart TV with HDR10+, Dolby Vision, and Voice Assistant',
      imagePath: 'assets/images/tv.png',
      description:
          'Upgrade your home entertainment with the Samsung 55-inch 4K Ultra HD Smart TV. With HDR10+, Dolby Vision, and built-in voice assistants like Alexa and Google Assistant, it provides a cinematic viewing experience with vibrant colors and deep contrast.',
      price: 999,
    ),
  ];
}

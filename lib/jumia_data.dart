import 'package:jumia_clone/models/review_model.dart';

import '../models/product_model.dart';
import 'core/util/product_tag.dart';
import 'models/product_details_model.dart';
import 'models/promotion.dart';

class JumiaData {
  static final List<String> promoImages = [
    'https://ng.jumia.is/cms/0-6-anniversary/2025/Emoji-challenge/Desktop-Homepage-Slider_-712x384.gif',
    'https://ng.jumia.is/cms/0-6-anniversary/2025/Global-early-bird-deals/712X384_.jpg',
    'https://ng.jumia.is/cms/0-6-anniversary/2025/Flash-Sales/Desktop-Homepage-Slider_-712x384.gif',
    'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Awoof-deals/May/AOTM_APRIL_MOTION_712x384.gif',
    'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Week_22/Beauty_style/712X384.jpg',
    'https://ng.jumia.is/cms/0-1-weekly-cps/0-2025/Week_22/Children-s_Collection/712x384.gif',
  ];

  static final List<ProductModel> productItems = [
    ProductModel(
        id: '1',
        isOfficialStore: true,
        title: 'Stainless Steel Cookware Set',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation. Each piece is crafted from high-grade stainless steel that distributes heat evenly, preventing hot spots and ensuring consistent cooking results every time.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking and cleaning',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
            'Scratch-resistant surface that maintains appearance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
            'Warranty': '2 years manufacturer warranty',
          },
        ),
        price: 42900,
        imageUrls: [
          'https://images.unsplash.com/photo-1588279102567-67db026f11c0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fENPT0tXQVJFJTIwU0VUfGVufDB8fDB8fHww',
        ],
        rating: 4.5,
        totalUnits: 25,
        itemsLeft: 10,
        ratingCount: 120,
        ratingSum: 540,
        label: ProductTag.payOnDelivery(),
        brandId: 'Hilda\'s Kitchen',
        isFlashSale: true,
      reviews: [
        ReviewModel(
          userId: '1',
          title: 'Very good',
          userName: 'Edirin',
          comment: 'Good sound, balanced bass, long lasting. Good music sound. Great for calls too',
          rating: 5,
          createdAt: DateTime(2025, 6, 10),
          isVerifiedPurchase: true,
        ),
        ReviewModel(
          userId: '2',
          title: 'Not bad',
          userName: 'Ada',
          comment: 'Battery is okay. Sounds decent. A bit uncomfortable after long use.',
          rating: 3,
          createdAt: DateTime(2025, 6, 9),
          isVerifiedPurchase: true,
        ),
        ReviewModel(
          userId: '3',
          title: 'Disappointed',
          userName: 'Musa',
          comment: 'One side stopped working after a week. Not worth it.',
          rating: 2,
          createdAt: DateTime(2025, 6, 8),
          isVerifiedPurchase: false,
        ),
        ReviewModel(
          userId: '4',
          title: 'Excellent quality',
          userName: 'Bola',
          comment: 'Very clear audio. Great mic. I use it daily for work calls.',
          rating: 5,
          createdAt: DateTime(2025, 6, 7),
          isVerifiedPurchase: true,
        ),
      ]
    ),
    ProductModel(
        id: '2',
        isOfficialStore: false,
        title: 'Ceramic Dinnerware Set',
        productDetails: ProductDetails(
          description: 'Elevate your dining experience with this elegant 16-piece ceramic dinnerware set that combines functionality with sophisticated design. Made from high-quality ceramic material, this set is perfect for everyday meals and special occasions alike. The smooth, glazed finish not only looks beautiful but also makes cleaning effortless. Each piece is carefully crafted to withstand daily use while maintaining its pristine appearance for years to come.',
          keyFeatures: [
            'Microwave and dishwasher safe ceramic construction',
            'Chip-resistant and durable design',
            'Elegant neutral color that complements any decor',
            'Complete set for family dining',
            'Easy to clean smooth glazed surface',
          ],
          specification: {
            'Material': 'High-quality ceramic',
            'Set Includes': '4 dinner plates, 4 salad plates, 4 bowls, 4 mugs',
            'Microwave Safe': 'Yes',
            'Dishwasher Safe': 'Yes',
            'Color': 'Classic White with subtle texture',
          },
        ),
        price: 15000,
        originalPrice: 25000,
        discountPercentage: 40,
        imageUrls: [
          'https://images.unsplash.com/photo-1599958681123-88cd5957db83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2VyYW1pYyUyMGRpbm5lcndhcmV8ZW58MHx8MHx8fDA%3D',
        ],
        rating: 4.2,
        totalUnits: 30,
        itemsLeft: 10,
        ratingCount: 85,
        ratingSum: 357,
        label: ProductTag.nonReturnable(),
        brandId: 'Hilda\'s Kitchen',
        isFlashSale: true,

    ),
    ProductModel(
        id: '3',
        isOfficialStore: false,
        title: 'Electric Kettle',
        productDetails: ProductDetails(
          description: 'Experience the convenience of rapid boiling with this advanced 1.7L electric kettle featuring premium stainless steel construction and intelligent safety features. Designed for busy households and offices, this kettle combines speed, efficiency, and safety in one sleek package. The rapid boil technology ensures you get hot water in minutes, while the automatic shut-off feature provides peace of mind during operation.',
          keyFeatures: [
            'Rapid boil technology for quick heating',
            'Automatic shut-off when water reaches boiling point',
            'Cool-touch exterior for safe handling',
            'Large 1.7L capacity perfect for families',
            'Easy-pour spout with precision control',
          ],
          specification: {
            'Capacity': '1.7 Liters',
            'Material': 'Stainless Steel body with plastic handle',
            'Power': '2200W for rapid heating',
            'Safety Features': 'Auto shut-off, boil-dry protection',
            'Cord Length': '1.2 meters with cord storage',
          },
        ),
        price: 18500,
        originalPrice: 22000,
        discountPercentage: 16,
        imageUrls: [
          'https://media.istockphoto.com/id/1571815108/photo/close-up-shot-of-an-unrecognisable-woman-using-kettle-in-kitchen.jpg?s=1024x1024&w=is&k=20&c=Sx7l5iHqlUsDCNN4ix1p7acB73u4SR8Dz4E9nfq0rTU=',
        ],
        rating: 4.7,
        totalUnits: 35,
        itemsLeft: 9,
        ratingCount: 200,
        ratingSum: 940,
        brandId: 'Hilda\'s Kitchen',
        isFlashSale: true
    ),
    ProductModel(
        id: '4',
        isOfficialStore: true,
        title: 'Blender with Glass Jar',
        productDetails: ProductDetails(
          description: 'Transform your kitchen into a smoothie bar with this powerful high-performance blender featuring a durable glass jar and multiple speed settings. Whether you\'re making morning smoothies, crushing ice for cocktails, or preparing baby food, this versatile appliance handles it all with ease. The robust motor and precision-engineered blades ensure consistent results every time, while the glass jar provides superior durability and easy cleaning.',
          keyFeatures: [
            'High-power motor for crushing ice and tough ingredients',
            'Durable borosilicate glass jar that won\'t absorb odors',
            'Multiple speed settings plus pulse function',
            'Easy-clean removable blade assembly',
            'Slip-resistant base for stable operation',
          ],
          specification: {
            'Motor Power': '1200W high-performance motor',
            'Jar Material': 'Borosilicate glass',
            'Capacity': '1.5L glass pitcher',
            'Speed Settings': '10 variable speeds plus pulse',
            'Safety Features': 'Locking lid, overload protection',
          },
        ),
        price: 35000,
        imageUrls: [
          'https://images.unsplash.com/photo-1570222094114-d054a817e56b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8QkxFTkRFUnxlbnwwfHwwfHx8MA%3D%3D',
        ],
        rating: 4.3,
        totalUnits: 55,
        itemsLeft: 49,
        ratingCount: 150,
        ratingSum: 645,
        label: ProductTag.payOnDelivery(),
        brandId: 'Hilda\'s Kitchen',
        isFlashSale: true,
        reviews: [
          ReviewModel(
            userId: '1',
            title: 'Very good',
            userName: 'Edirin',
            comment: 'Good sound, balanced bass, long lasting. Good music sound. Great for calls too',
            rating: 5,
            createdAt: DateTime(2025, 6, 10),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '2',
            title: 'Not bad',
            userName: 'Ada',
            comment: 'Battery is okay. Sounds decent. A bit uncomfortable after long use.',
            rating: 3,
            createdAt: DateTime(2025, 6, 9),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '3',
            title: 'Disappointed',
            userName: 'Musa',
            comment: 'One side stopped working after a week. Not worth it.',
            rating: 2,
            createdAt: DateTime(2025, 6, 8),
            isVerifiedPurchase: false,
          ),
          ReviewModel(
            userId: '4',
            title: 'Excellent quality',
            userName: 'Bola',
            comment: 'Very clear audio. Great mic. I use it daily for work calls.',
            rating: 5,
            createdAt: DateTime(2025, 6, 7),
            isVerifiedPurchase: true,
          ),
        ]
    ),
  ];

  static final List<ProductModel> electronics = [
    ProductModel(
        id: '1',
        isOfficialStore: false,
        title: 'Logitech H390 USB Headset',
        productDetails: ProductDetails(
          description: 'Experience crystal-clear communication with the Logitech H390 USB headset, designed for professionals who demand superior audio quality during calls and virtual meetings. This plug-and-play headset features advanced noise-canceling technology that filters out background noise, ensuring your voice comes through clearly even in busy environments. The comfortable over-ear design allows for extended wear without fatigue, making it perfect for long work sessions, online learning, or gaming marathons.',
          keyFeatures: [
            'Advanced noise-canceling microphone for clear voice transmission',
            'Plug-and-play USB connectivity - no drivers required',
            'In-line audio controls for volume and mute functions',
            'Comfortable padded headband and ear cushions',
            'Compatible with major video conferencing platforms',
          ],
          specification: {
            'Connectivity': 'Wired USB-A connection',
            'Microphone': 'Rotating boom with noise-canceling technology',
            'Frequency Response': '20Hz - 20kHz',
            'Weight': '197g lightweight design',
            'Compatibility': 'Windows, macOS, Chrome OS',
            'Cable Length': '2.4 meters',
          },
        ),
        price: 42900,
        imageUrls: ['https://images.unsplash.com/photo-1599669454699-248893623440?w=300&h=300&fit=crop'],
        rating: 4.5,
        brandId: 'Logitech',
        isFlashSale: false,
        reviews: [
          ReviewModel(
            userId: '1',
            title: 'Very good',
            userName: 'Edirin',
            comment: 'Good sound, balanced bass, long lasting. Good music sound. Great for calls too',
            rating: 5,
            createdAt: DateTime(2025, 6, 10),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '2',
            title: 'Not bad',
            userName: 'Ada',
            comment: 'Battery is okay. Sounds decent. A bit uncomfortable after long use.',
            rating: 3,
            createdAt: DateTime(2025, 6, 9),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '3',
            title: 'Disappointed',
            userName: 'Musa',
            comment: 'One side stopped working after a week. Not worth it.',
            rating: 2,
            createdAt: DateTime(2025, 6, 8),
            isVerifiedPurchase: false,
          ),
          ReviewModel(
            userId: '4',
            title: 'Excellent quality',
            userName: 'Bola',
            comment: 'Very clear audio. Great mic. I use it daily for work calls.',
            rating: 5,
            createdAt: DateTime(2025, 6, 7),
            isVerifiedPurchase: true,
          ),
        ]
    ),
    ProductModel(
        id: '2',
        isOfficialStore: false,
        title: 'Havit PC Gaming Headset',
        productDetails: ProductDetails(
          description: 'Immerse yourself in the ultimate gaming experience with the Havit PC Gaming Headset, featuring spectacular RGB lighting effects and premium surround sound technology. This professional gaming headset is engineered for competitive gamers who demand precision audio and striking visual appeal. The advanced 7.1 surround sound creates an immersive audio landscape that gives you a competitive edge by allowing you to pinpoint enemy locations and environmental cues with remarkable accuracy.',
          keyFeatures: [
            'Dynamic RGB lighting with customizable color effects',
            'Virtual 7.1 surround sound for immersive gaming',
            'High-sensitivity omnidirectional microphone',
            'Comfortable memory foam ear cushions',
            'Durable braided cable with inline controls',
          ],
          specification: {
            'Audio': '50mm dynamic drivers with 7.1 surround sound',
            'Microphone': 'Omnidirectional with noise reduction',
            'Lighting': 'RGB LED with multiple color modes',
            'Connectivity': '3.5mm + USB for RGB power',
            'Compatibility': 'PC, PS4, PS5, Xbox, Nintendo Switch',
            'Cable Length': '2.2 meters braided cable',
          },
        ),
        price: 15000,
        originalPrice: 25000,
        discountPercentage: 40,
        imageUrls: ['https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=300&h=300&fit=crop'],
        rating: 4.2,
        itemsLeft: 25,
        brandId: 'Havit',
        isFlashSale: false,
        reviews: [
          ReviewModel(
            userId: '1',
            title: 'Very good',
            userName: 'Edirin',
            comment: 'Good sound, balanced bass, long lasting. Good music sound. Great for calls too',
            rating: 5,
            createdAt: DateTime(2025, 6, 10),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '2',
            title: 'Not bad',
            userName: 'Ada',
            comment: 'Battery is okay. Sounds decent. A bit uncomfortable after long use.',
            rating: 3,
            createdAt: DateTime(2025, 6, 9),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '3',
            title: 'Disappointed',
            userName: 'Musa',
            comment: 'One side stopped working after a week. Not worth it.',
            rating: 2,
            createdAt: DateTime(2025, 6, 8),
            isVerifiedPurchase: false,
          ),
          ReviewModel(
            userId: '4',
            title: 'Excellent quality',
            userName: 'Bola',
            comment: 'Very clear audio. Great mic. I use it daily for work calls.',
            rating: 5,
            createdAt: DateTime(2025, 6, 7),
            isVerifiedPurchase: true,
          ),
        ]

    ),
    ProductModel(
        id: '3',
        isOfficialStore: false,
        title: 'Wireless Gaming Mouse',
        productDetails: ProductDetails(
          description: 'Elevate your gaming performance with this high-precision wireless gaming mouse that combines cutting-edge sensor technology with stunning RGB aesthetics. Designed for serious gamers who refuse to be tethered by cables, this mouse delivers lightning-fast response times and pixel-perfect accuracy. The ergonomic design ensures comfortable gameplay during extended sessions, while the customizable RGB lighting adds a personalized touch to your gaming setup.',
          keyFeatures: [
            'High-precision optical sensor up to 12,000 DPI',
            '2.4GHz wireless connection with minimal latency',
            'Customizable RGB lighting with multiple effects',
            'Ergonomic design for comfortable extended use',
            'Programmable buttons for personalized gameplay',
          ],
          specification: {
            'Sensor': 'Optical sensor with up to 12,000 DPI',
            'Connectivity': '2.4GHz wireless with USB receiver',
            'Battery Life': 'Up to 50 hours continuous use',
            'Buttons': '7 programmable buttons',
            'Lighting': 'RGB with 16.8 million colors',
            'Compatibility': 'Windows, macOS, Linux',
          },
        ),
        price: 18500,
        originalPrice: 22000,
        discountPercentage: 16,
        imageUrls: ['https://images.unsplash.com/photo-1527814050087-3793815479db?w=300&h=300&fit=crop'],
        rating: 4.7,
        itemsLeft: 12,
        brandId: 'Havit',
        isFlashSale: false,
        reviews: [
          ReviewModel(
            userId: '1',
            title: 'Very good',
            userName: 'Edirin',
            comment: 'Good sound, balanced bass, long lasting. Good music sound. Great for calls too',
            rating: 5,
            createdAt: DateTime(2025, 6, 10),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '2',
            title: 'Not bad',
            userName: 'Ada',
            comment: 'Battery is okay. Sounds decent. A bit uncomfortable after long use.',
            rating: 3,
            createdAt: DateTime(2025, 6, 9),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '3',
            title: 'Disappointed',
            userName: 'Musa',
            comment: 'One side stopped working after a week. Not worth it.',
            rating: 2,
            createdAt: DateTime(2025, 6, 8),
            isVerifiedPurchase: false,
          ),
          ReviewModel(
            userId: '4',
            title: 'Excellent quality',
            userName: 'Bola',
            comment: 'Very clear audio. Great mic. I use it daily for work calls.',
            rating: 5,
            createdAt: DateTime(2025, 6, 7),
            isVerifiedPurchase: true,
          ),
        ]
    ),
    ProductModel(
        id: '4',
        isOfficialStore: false,
        title: 'Mechanical Keyboard RGB',
        productDetails: ProductDetails(
          description: 'Dominate the competition with this premium mechanical gaming keyboard featuring authentic mechanical switches and mesmerizing RGB backlighting. Each key press delivers the satisfying tactile feedback and audible click that mechanical keyboard enthusiasts crave, while the advanced anti-ghosting technology ensures every keystroke is registered accurately during intense gaming sessions. The aircraft-grade aluminum construction provides exceptional durability that can withstand years of heavy use.',
          keyFeatures: [
            'Authentic mechanical switches for tactile feedback',
            'Per-key RGB backlighting with multiple effects',
            'Anti-ghosting technology for accurate keystrokes',
            'Aircraft-grade aluminum construction',
            'Detachable braided USB-C cable',
          ],
          specification: {
            'Switch Type': 'Blue mechanical switches (tactile & clicky)',
            'Backlighting': 'Per-key RGB with 16.8M colors',
            'Layout': '104-key full-size QWERTY',
            'Construction': 'Aluminum top plate with ABS keycaps',
            'Connectivity': 'USB-C with detachable cable',
            'Compatibility': 'Windows, macOS, Linux',
          },
        ),
        price: 35000,
        imageUrls: ['https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=300&h=300&fit=crop'],
        rating: 4.3,
        brandId: 'Havit',
        isFlashSale: false,
        reviews: [
          ReviewModel(
            userId: '1',
            title: 'Very good',
            userName: 'Edirin',
            comment: 'Good sound, balanced bass, long lasting. Good music sound. Great for calls too',
            rating: 5,
            createdAt: DateTime(2025, 6, 10),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '2',
            title: 'Not bad',
            userName: 'Ada',
            comment: 'Battery is okay. Sounds decent. A bit uncomfortable after long use.',
            rating: 3,
            createdAt: DateTime(2025, 6, 9),
            isVerifiedPurchase: true,
          ),
          ReviewModel(
            userId: '3',
            title: 'Disappointed',
            userName: 'Musa',
            comment: 'One side stopped working after a week. Not worth it.',
            rating: 2,
            createdAt: DateTime(2025, 6, 8),
            isVerifiedPurchase: false,
          ),
          ReviewModel(
            userId: '4',
            title: 'Excellent quality',
            userName: 'Bola',
            comment: 'Very clear audio. Great mic. I use it daily for work calls.',
            rating: 5,
            createdAt: DateTime(2025, 6, 7),
            isVerifiedPurchase: true,
          ),
        ]
    ),
  ];

  static final List<ProductModel> phonesAndTablet = [
    ProductModel(
        id: '201',
        isOfficialStore: true,
        title: 'Samsung Galaxy A54 5G',
        productDetails: ProductDetails(
          description: 'Step into the future of mobile technology with the Samsung Galaxy A54 5G, a premium smartphone that delivers flagship features at an accessible price point. This cutting-edge device combines Samsung\'s renowned build quality with the latest 5G connectivity, ensuring you stay connected at blazing-fast speeds. The stunning Super AMOLED display brings your content to life with vibrant colors and sharp details, while the advanced camera system captures professional-quality photos and videos in any lighting condition.',
          keyFeatures: [
            'Vibrant 6.4" Super AMOLED display with 120Hz refresh rate',
            'Lightning-fast 5G connectivity for seamless streaming',
            'Triple camera system with advanced night mode',
            'All-day 5000mAh battery with fast charging',
            'Water-resistant design with IP67 rating',
          ],
          specification: {
            'Display': '6.4" Super AMOLED, 2340x1080, 120Hz',
            'Processor': 'Exynos 1380 Octa-core',
            'Memory': '8GB RAM, 128GB internal storage',
            'Camera': '50MP main + 12MP ultra-wide + 5MP macro',
            'Battery': '5000mAh with 25W fast charging',
            'OS': 'Android 13 with One UI 5.1',
          },
        ),
        price: 295000,
        originalPrice: 320000,
        discountPercentage: 8,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/28/2223353/1.jpg?3444',
        ],
        rating: 4.7,
        itemsLeft: 10,
        brandId: 'Samsung',
        isFlashSale: false
    ),
    ProductModel(
        id: '202',
        isOfficialStore: true,
        title: 'Oraimo FreePods 3',
        productDetails: ProductDetails(
          description: 'Experience true wireless freedom with the Oraimo FreePods 3, featuring advanced noise cancellation technology and exceptional battery life that keeps you connected all day long. These premium earbuds deliver studio-quality sound with deep bass and crystal-clear highs, making them perfect for music lovers, podcast enthusiasts, and busy professionals who need reliable hands-free calling. The ergonomic design ensures a comfortable fit for extended wear, while the sleek charging case provides convenient portability.',
          keyFeatures: [
            'Active noise cancellation for immersive listening',
            'Extended 20-hour total playtime with charging case',
            'Touch controls for easy music and call management',
            'IPX5 water resistance for workout protection',
            'Quick charge technology - 10 minutes for 2 hours play',
          ],
          specification: {
            'Driver Size': '10mm dynamic drivers',
            'Battery Life': '5 hours earbuds + 15 hours case',
            'Charging': 'USB-C with wireless charging support',
            'Connectivity': 'Bluetooth 5.2 with AAC codec',
            'Water Resistance': 'IPX5 rated',
            'Weight': '4.5g per earbud',
          },
        ),
        price: 25000,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/56/6975982/1.jpg?4201',
        ],
        rating: 4.5,
        brandId: 'Oraimo',
        isFlashSale: false
    ),
    ProductModel(
        id: '203',
        isOfficialStore: true,
        title: 'Infinix Smart 7',
        productDetails: ProductDetails(
          description: 'Discover exceptional value and performance with the Infinix Smart 7, a feature-rich smartphone designed for users who demand quality without compromise. This stylish device combines modern aesthetics with practical functionality, featuring a large HD+ display that\'s perfect for streaming videos, browsing social media, and staying productive on the go. The reliable battery life ensures you can use your phone throughout the day without worrying about frequent charging.',
          keyFeatures: [
            'Large 6.6" HD+ display for immersive viewing',
            'Smooth performance with 4GB RAM and 64GB storage',
            'Long-lasting 5000mAh battery for all-day use',
            'Dual rear camera system with AI photography',
            'Modern Android experience with regular updates',
          ],
          specification: {
            'Display': '6.6" HD+ IPS LCD, 1612x720 resolution',
            'Processor': 'UNISOC Tiger T606 Octa-core',
            'Memory': '4GB RAM, 64GB storage (expandable)',
            'Camera': '13MP + AI lens rear, 8MP front',
            'Battery': '5000mAh with 10W charging',
            'OS': 'Android 12 with XOS 10.6',
          },
        ),
        price: 85000,
        originalPrice: 95000,
        discountPercentage: 10,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/39/8857604/1.jpg?8011',
        ],
        rating: 4.3,
        itemsLeft: 15,
        brandId: 'Infinix',
        isFlashSale: false
    ),
    ProductModel(
        id: '204',
        isOfficialStore: true,
        title: 'Philips Air Fryer HD9252/90',
        productDetails: ProductDetails(
          description: 'Revolutionize your cooking experience with the Philips Air Fryer HD9252/90, featuring innovative Rapid Air Technology that circulates hot air to cook food evenly with little to no oil. This premium kitchen appliance allows you to enjoy your favorite fried foods with up to 90% less fat, making it the perfect choice for health-conscious individuals and families. The spacious 4.1L capacity can accommodate meals for up to 6 people, while the intuitive digital display makes operation simple and convenient.',
          keyFeatures: [
            'Rapid Air Technology for even cooking with minimal oil',
            'Large 4.1L capacity suitable for family meals',
            'Digital touchscreen with preset cooking programs',
            'Dishwasher-safe parts for easy cleanup',
            'Energy-efficient cooking saves time and electricity',
          ],
          specification: {
            'Capacity': '4.1 Liters (serves up to 6 people)',
            'Technology': 'Rapid Air with TurboStar design',
            'Power': '1500W with temperature control up to 200°C',
            'Programs': '7 preset programs plus manual control',
            'Timer': '60-minute timer with auto shut-off',
            'Dimensions': '31.5 x 31.5 x 41.6 cm',
          },
        ),
        price: 120000,
        imageUrls: [
          'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/40/0629883/1.jpg?6147',
        ],
        rating: 4.6,
        itemsLeft: 5,
        brandId: 'Philips',
        isFlashSale: false
    ),
  ];

  static final List<ProductModel> sponsoredProducts = [
    ProductModel(
        id: '1',
        isOfficialStore: true,
        title: 'Stainless Steel Cookware Set',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
        price: 42900,
        imageUrls: [
          'https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_1280.jpg',
          'https://picsum.photos/300/300?random=1',
        ],
        rating: 4.5,
        totalUnits: 25,
        itemsLeft: 10,
        ratingCount: 120,
        ratingSum: 540,
        label: ProductTag.payOnDelivery(),
        brandId: 'Hilda\'s Kitchen',
        isFlashSale: false
    ),
    ProductModel(
      id: '2',
      isOfficialStore: false,
      title: 'Ceramic Dinnerware Set',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 15000,
      originalPrice: 25000,
      discountPercentage: 40,
      imageUrls: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzdyvmk7BrT2EuuPhzznwPmgThpoAxH700Og&s',
        'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg',
      ],
      rating: 4.2,
      totalUnits: 30,
      itemsLeft: 10,
      ratingCount: 85,
      ratingSum: 357,
      label: ProductTag.nonReturnable(),
      brandId: 'Hilda\'s Kitchen',
        isFlashSale: false
    ),
    ProductModel(
      id: '3',
      isOfficialStore: false,
      title: 'Electric Kettle',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 18500,
      originalPrice: 22000,
      discountPercentage: 16,
      imageUrls: [
        'https://images.unsplash.com/photo-1571552879083-e93b6ea70d1d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8RUxFQ1RSSUMlMjBLRVRUTEV8ZW58MHx8MHx8fDA%3D',
        'https://images.unsplash.com/photo-1579752898926-3bcbc125ae2e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fEVMRUNUUklDJTIwS0VUVExFfGVufDB8fDB8fHww',
      ],
      rating: 4.7,
      totalUnits: 35,
      itemsLeft: 9,
      ratingCount: 200,
      ratingSum: 940,
      brandId: 'Hilda\'s Kitchen',
        isFlashSale: false
    ),
    ProductModel(
      id: '4',
      isOfficialStore: true,
      title: 'Blender with Glass Jar',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 35000,
      imageUrls: [
        'https://plus.unsplash.com/premium_photo-1681826671576-8d612accc77a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxlbmRlcnxlbnwwfHwwfHx8MA%3D%3D',
        'https://cdn.pixabay.com/photo/2017/05/11/19/44/fresh-fruits-2305192_1280.jpg',
      ],
      rating: 4.3,
      totalUnits: 55,
      itemsLeft: 49,
      ratingCount: 150,
      ratingSum: 645,
      label: ProductTag.payOnDelivery(),
      brandId: 'Hilda\'s Kitchen',
        isFlashSale: false
    ),
  ];

  static final List<ProductModel> anniversaryDeals = [
    ProductModel(
      id: '4',
      isOfficialStore: true,
      title: 'Blender with Glass Jar',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 35000,
      imageUrls: [
        'https://plus.unsplash.com/premium_photo-1681826671576-8d612accc77a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YmxlbmRlcnxlbnwwfHwwfHx8MA%3D%3D',
        'https://cdn.pixabay.com/photo/2017/05/11/19/44/fresh-fruits-2305192_1280.jpg',
      ],
      rating: 4.3,
      totalUnits: 55,
      itemsLeft: 49,
      ratingCount: 150,
      ratingSum: 645,
      label: ProductTag.payOnDelivery(),
      brandId: 'Hilda\'s Kitchen',
        isFlashSale: false
    ),
    ProductModel(
      id: '4',
      isOfficialStore: false,
      title: 'Mechanical Keyboard RGB',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 35000,
      imageUrls: ['https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=300&h=300&fit=crop'],
      rating: 4.3,
      brandId: 'Havit',
        isFlashSale: false
    ),
    ProductModel(
      id: '204',
      isOfficialStore: true,
      title: 'Philips Air Fryer HD9252/90',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 120000,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/40/0629883/1.jpg?6147',
      ],
      rating: 4.6,
      itemsLeft: 5,
      brandId: 'Havit',
        isFlashSale: false
    ),

    ProductModel(
      id: '203',
      isOfficialStore: true,
      title: 'Infinix Smart 7',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 85000,
      originalPrice: 95000,
      discountPercentage: 10,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/39/8857604/1.jpg?8011',
      ],
      rating: 4.3,
      itemsLeft: 15,
      brandId: 'Havit',
        isFlashSale: false
    ),
  ];

  static final List<ProductModel> xiaomiOfficialStoreItems = [
    ProductModel(
      id: '101',
      isOfficialStore: true,
      title: 'Xiaomi Redmi Note 13 Pro',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 189000,
      originalPrice: 210000,
      discountPercentage: 10,
      imageUrls: [
        'https://i01.appmifile.com/webfile/globalimg/in/cms/Redmi_Note_13_Pro_5G_Black.png',
      ],
      rating: 4.8,
      itemsLeft: 14,
      brandId: 'Havit',
        isFlashSale: false
    ),
    ProductModel(
      id: '102',
      isOfficialStore: true,
      title: 'Xiaomi Smart Band 8',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 23000,
      imageUrls: [
        'https://i01.appmifile.com/webfile/globalimg/in/cms/Mi_Band_8_Black.png',
      ],
      rating: 4.6,
      brandId: 'Havit',
        isFlashSale: false
    ),
    ProductModel(
      id: '103',
      isOfficialStore: true,
      title: 'Xiaomi Robot Vacuum Mop 2 Pro',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 179000,
      originalPrice: 200000,
      discountPercentage: 11,
      imageUrls: [
        'https://i01.appmifile.com/webfile/globalimg/in/cms/Robot_Vacuum_Mop_2_Pro_White.png',
      ],
      rating: 4.5,
      itemsLeft: 8,
      brandId: 'Havit',
        isFlashSale: false
    ),
    ProductModel(
      id: '104',
      isOfficialStore: true,
      title: 'Xiaomi TV Box S 2nd Gen',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 45000,
      imageUrls: [
        'https://i01.appmifile.com/webfile/globalimg/in/cms/TV_Box_S_2nd_Gen_Black.png',
      ],
      rating: 4.4,
      itemsLeft: 20,
      brandId: 'Havit',
        isFlashSale: false
    ),
  ];

  static final List<ProductModel> niveaOfficialStoreItems = [
    ProductModel(
      id: '301',
      isOfficialStore: true,
      title: 'NIVEA Perfect & Radiant Body Lotion',
        productDetails: ProductDetails(
          description: '400ml, Even Tone, Vitamin C & E, SPF 15, 48h Moisturization',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 3500,
      originalPrice: 4000,
      discountPercentage: 12,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/15/1713401/1.jpg?0547',
      ],
      rating: 4.6,
      itemsLeft: 25,
      brandId: 'Havit',
        label: ProductTag.officialStore(),
        isFlashSale: false
    ),
    ProductModel(
      id: '302',
      isOfficialStore: true,
      title: 'NIVEA MEN Fresh Active Roll-On Deodorant',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),      price: 1200,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/98/3213401/1.jpg?1011',
      ],
      rating: 4.5,
      brandId: 'Nivea',
        isFlashSale: false
    ),
    ProductModel(
      id: '303',
      isOfficialStore: true,
      title: 'NIVEA Luminous Even Glow Day Cream',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),      price: 6500,
      originalPrice: 7200,
      discountPercentage: 10,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/55/1713401/1.jpg?5747',
      ],
      rating: 4.7,
      itemsLeft: 15,
      brandId: 'Nivea',
        isFlashSale: false
    ),
    ProductModel(
      id: '304',
      isOfficialStore: true,
      title: 'NIVEA Cocoa Nourish Body Lotion',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
        price: 3800,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/26/8523401/1.jpg?1668',
      ],
      rating: 4.4,
      itemsLeft: 20,
      brandId: 'Nivea',
        isFlashSale: false
    ),
  ];

  static final List<ProductModel> jumiaTopSellersItems = [
    ProductModel(
      id: '401',
      isOfficialStore: true,
      title: 'Infinix Hot 40 Pro',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),
      price: 220000,
      originalPrice: 245000,
      discountPercentage: 10,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/78/456123/1.jpg',
      ],
      rating: 4.7,
      itemsLeft: 12,
      brandId: 'Transsion',
        isFlashSale: false
    ),
    ProductModel(
      id: '402',
      isOfficialStore: true,
      title: 'Oraimo FreePods 4',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),      price: 28000,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/90/789456/1.jpg',
      ],
      rating: 4.6,
      brandId: 'Transsion',
        isFlashSale: false
    ),
    ProductModel(
      id: '403',
      isOfficialStore: true,
      title: 'NIVEA Perfect & Radiant Body Lotion',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),      price: 3500,
      originalPrice: 4000,
      discountPercentage: 12,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/12/901234/1.jpg',
      ],
      rating: 4.6,
      itemsLeft: 25,
      brandId: 'Nivea',
        isFlashSale: false
    ),
    ProductModel(
      id: '404',
      isOfficialStore: true,
      title: 'Fashion Men’s Sneakers',
        productDetails: ProductDetails(
          description: 'This premium 10-piece stainless steel cookware set revolutionizes your kitchen experience with its non-stick coating and durable construction. Perfect for both amateur home cooks and professional chefs, this versatile set includes everything you need for comprehensive meal preparation.',
          keyFeatures: [
            'Premium non-stick coating for easy cooking',
            'Heat-resistant handles with ergonomic design',
            'Compatible with all stovetops including induction',
            'Dishwasher safe for convenient maintenance',
          ],
          specification: {
            'Material': 'Stainless Steel with Non-stick Coating',
            'Set Includes': '10 pieces - various pots and pans',
            'Compatibility': 'All stovetops including induction',
            'Care Instructions': 'Dishwasher safe',
          },
        ),      price: 15000,
      imageUrls: [
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/23/567890/1.jpg',
      ],
      rating: 4.4,
      itemsLeft: 30,
      brandId: 'Paul',
        isFlashSale: false
    ),
  ];

  static final promotions = [
    Promotion(
      text: "Call 07006000000 To Place Your Order",
      onTap: () {
        // Handle phone call
        print("Calling 07006000000");
      },
    ),
    Promotion(
      text: "Need extra money? Loan up to N500,000 on the JumiaPay Android app.",
      onTap: () {
        // Handle loan navigation
        print("Navigate to JumiaPay loan");
      },
    ),
    Promotion(
      text: "Enjoy cheaper shipping fees when you select a PickUp Station at checkout.",
      onTap: () {
        // Handle pickup station info
        print("Show pickup station info");
      },
    ),
  ];
}
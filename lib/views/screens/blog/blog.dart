import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blogPosts = [
      {
        'title': 'The Future of AI: Trends and Predictions',
        'excerpt':
            'Explore the latest advancements in artificial intelligence and what the future holds for this rapidly evolving field.',
        'content':
            'Discuss the current state of AI, recent breakthroughs, and potential future developments. Include applications in various industries, ethical considerations, and the impact on the job market.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvkTX4sLxU8dMfO7o2jxgVPKypXR5PSV_E1w&s', // Replace with your image URL
      },
      {
        'title': 'Top 10 Smartphones of 2024: Features and Reviews',
        'excerpt':
            'A comprehensive review of the top 10 smartphones of 2024, highlighting their features, pros, and cons.',
        'content':
            'Provide detailed reviews of each smartphone, including specifications, performance, camera quality, battery life, and unique features. Compare them to help readers choose the best phone for their needs.',
        'image':
            'https://m-cdn.phonearena.com/images/article/64576-wide-two_1200/The-Best-Phones-to-buy-in-2024---our-top-10-list.jpg?1716206294', // Replace with your image URL
      },
      {
        'title': 'The Evolution of Laptops: From 1972 to 2021',
        'excerpt':
            'A look back at the technological advancements in laptops over the past two decades.',
        'content':
            'Trace the history of laptops, highlighting significant innovations and changes in design, performance, and functionality. Discuss how these advancements have impacted productivity and user experience.',
        'image':
            'https://i.ytimg.com/vi/hz7NQS9D6HM/maxresdefault.jpg', // Replace with your image URL
      },
      {
        'title': 'The Role of Blockchain Technology Beyond Cryptocurrency',
        'excerpt':
            'An exploration of how blockchain technology is being used in various industries beyond digital currencies.',
        'content':
            'Explain the fundamentals of blockchain technology and its applications in supply chain management, healthcare, finance, and more. Discuss its potential to revolutionize different sectors.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjWaLnZQSd9wV2BAA5R8av2nZTorl1rjH3eg&s',
      },
      {
        'title':
            'Virtual Reality and Augmented Reality: Transforming the Digital Experience',
        'excerpt':
            'Discover how VR and AR are changing the way we interact with digital content.',
        'content':
            'Examine the differences between virtual reality and augmented reality, their current applications, and future potential. Highlight innovative uses in gaming, education, healthcare, and other fields.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGhoq0Jvn_Xvv1fgEEGO6AtKFv27QIb7Mpaw&s', // Replace with your image URL
      },
      {
        'title': 'Cybersecurity in 2024: Protecting Your Digital Life',
        'excerpt':
            'Tips and strategies for safeguarding your personal and professional digital information in 2024.',
        'content':
            'Discuss the latest cybersecurity threats and trends, including ransomware, phishing, and data breaches. Provide practical advice on how to protect sensitive information, secure devices, and stay safe online.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCHn68-VsE7VrVPrsb3x0IoqFFNVUTxzVLgQ&s', // Replace with your image URL
      },
      {
        'title': 'The Rise of Quantum Computing: What You Need to Know',
        'excerpt':
            'An introduction to quantum computing and its potential impact on technology and society.',
        'content':
            'Explain the basics of quantum computing, how it differs from classical computing, and its potential applications. Discuss the challenges and opportunities in this emerging field.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOu0piBrYlF5gmFOil4Q7fSXfnmJDCbH-ong&s', // Replace with your image URL
      },
      {
        'title': 'Smart Home Technology: Creating the Home of the Future',
        'excerpt':
            'How smart home devices and systems are enhancing convenience, security, and energy efficiency.',
        'content':
            'Explore various smart home technologies, including smart speakers, thermostats, security systems, and appliances. Discuss the benefits of integrating these devices into a cohesive smart home ecosystem.',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSaxxXY9TuP-8kovJxbgudXb52ZpNYBQmNLg&s', // Replace with your image URL
      },
      {
        'title':
            '5G Technology: Revolutionizing Connectivity and Communication',
        'excerpt':
            'An overview of 5G technology and its implications for mobile connectivity and beyond.',
        'content':
            'Explain what 5G technology is, how it works, and its advantages over previous generations. Highlight its impact on mobile communication, IoT, and other industries, as well as potential challenges.',
        'image':
            'https://www.thefastmode.com/media/k2/items/src/a5ba713859dbcdfc73b104275d2fecd7.jpg?t=20200611_091200', // Replace with your image URL
      },
      {
        'title': 'Wearable Technology: Innovations and Health Benefits',
        'excerpt':
            'A look at the latest wearable tech devices and how they are improving health and fitness.',
        'content':
            'Review various wearable devices such as smartwatches, fitness trackers, and health monitors. Discuss their features, benefits, and how they can help users track and improve their health and wellness.',
        'image':
            'https://via.placeholder.com/150', // Replace with your image URL
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tech Blog'),
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(8.0),
              leading: Image.network(
                blogPosts[index]['image']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(blogPosts[index]['title']!),
              subtitle: Text(blogPosts[index]['excerpt']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetailScreen(
                      title: blogPosts[index]['title']!,
                      content: blogPosts[index]['content']!,
                      image: blogPosts[index]['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const BlogDetailScreen({
    required this.title,
    required this.content,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image),
            SizedBox(height: 16.0),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 16.0),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}

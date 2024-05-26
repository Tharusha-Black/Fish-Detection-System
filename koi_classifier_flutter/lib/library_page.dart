import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/menu.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to login page
          },
        ),
        title: Text('Koi Fish Library'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          KoiFishCard(
              name: 'Showa',
              imagePath: 'assets/showa.jpg', // Replace with your image path
              summary:
                  'Showa is a striking variety of Koi with a black body adorned with red and white markings.',
              description:
                  '''Showa koi are renowned for their vibrant and contrasting colors, prominently featuring black (sumi), red (beni), and white (shiroji) markings. The black patterns often create a striking contrast against the white or red background, resembling bold brush strokes in Japanese ink paintings. Showa koi may exhibit various patterns, with each fish displaying unique and individual markings. 

Identification Tips:
• Bold and well-defined sumi (black markings).
• Clear and vibrant beni (red markings).
• Bright and clean shiroji (white base).

Color Changes Over Time: As Showa koi mature, the intensity and distribution of the sumi, beni, and shiroji markings may change subtly. Young Showa koi often exhibit bold and distinct color patterns, while older specimens may develop richer and more intricate sumi patterns, with additional shades of gray or blue emerging within the markings. The beni and shiroji colors may also deepen or become more lustrous with age.

Breeding and Development: Showa koi are bred through selective breeding efforts aimed at enhancing and refining their color patterns. Breeders carefully select parent fish with desirable sumi, beni, and shiroji characteristics to produce offspring with vibrant and well-balanced coloration. Breeding programs focus on improving color intensity, pattern symmetry, and overall aesthetic appeal while preserving the traditional traits of the variety.

Variations and Subtypes: While Showa koi typically feature black, red, and white markings, variations in color intensity, pattern distribution, and sumi placement can result in unique subtypes within the variety. Examples include:
• Tancho Showa: Featuring a single red marking on the head resembling the Japanese flag.
• Kin Showa: Exhibiting metallic scales in addition to traditional color patterns.

Symbolism and Cultural Significance: Showa koi are revered for their beauty, resilience, and symbolic significance in Japanese culture. They represent strength, perseverance, and overcoming adversity, making them a popular choice for koi enthusiasts and collectors seeking to evoke these qualities in their ponds or gardens. Showa koi are also featured prominently in traditional Japanese art, literature, and folklore, symbolizing prosperity, good fortune, and success.

Health and Disease Prevention: Showa koi require diligent care to maintain their health and vibrant coloration. Regular monitoring of water quality, temperature, and pH levels is essential to prevent stress-related illnesses and maintain optimal conditions for the fish. They are susceptible to common koi diseases such as parasites, bacterial infections, and fungal outbreaks, so preventive measures such as quarantine procedures and proper nutrition are crucial.

Environmental Considerations: Showa koi thrive in clean and well-oxygenated water with ample space to swim and explore. Adequate filtration, aeration, and regular water changes are essential to maintain optimal water quality and prevent the buildup of harmful pollutants. They are relatively hardy and adaptable to a wide range of environmental conditions, but sudden fluctuations in temperature or water chemistry can stress the fish and compromise their health.

Interactions with Other Varieties: Showa koi coexist harmoniously with other koi varieties in pond environments, often forming social hierarchies based on size, age, and dominance. While they may display territorial behavior and occasional aggression towards other fish, they generally interact peacefully with compatible tank mates. Introducing new fish to a pond should be done gradually to minimize stress and acclimatize the fish to their new environment.

Conservation Efforts: Conservation efforts aimed at preserving and protecting Showa koi focus on maintaining genetic diversity, promoting responsible breeding practices, and raising awareness about the importance of koi conservation. Breeding programs, genetic research, and educational initiatives help ensure the long-term sustainability of Showa koi populations and safeguard their cultural heritage for future generations.

Seasonal Considerations: Showa koi may exhibit variations in behavior, appetite, and coloration in response to seasonal changes, such as temperature fluctuations and daylight length. Providing seasonal care tips, such as adjusting feeding schedules, monitoring water temperature, and protecting fish from extreme weather conditions, can help users maintain the health and well-being of their Showa koi throughout the year.

Educational Resources: Recommend additional educational resources, such as books, websites, forums, or educational videos, where users can further expand their knowledge of Showa koi and koi keeping practices. Access to reliable and informative resources empowers users to become knowledgeable and responsible koi enthusiasts.

Environmental Enrichment: Suggest ways to enrich the pond environment for Showa koi, such as adding natural vegetation, aquatic structures, or underwater caves to encourage exploration and stimulation. Providing a stimulating and dynamic environment promotes the physical and mental well-being of Showa koi, enhancing their overall quality of life.

Community Engagement: Encourage users to join online koi keeping communities or local koi clubs where they can connect with fellow enthusiasts, share experiences, and seek advice and support. Engaging with a community of like-minded individuals fosters camaraderie, knowledge sharing, and mutual support, enriching the koi keeping experience for users.

Ethical Considerations: Address ethical considerations related to koi keeping, such as responsible breeding practices, avoiding invasive species introduction, and respecting the natural habitat of koi fish. Promoting ethical practices ensures the sustainability and well-being of koi populations and their environments.

Growth Rate and Size: Discuss the typical growth rate and size potential of Showa koi, including factors that influence growth, such as water quality, temperature, and feeding regimen. Providing information on expected size ranges can help users plan their pond or aquarium setup accordingly.

Show Quality Standards: Explain the criteria used to judge Showa koi in competitions and exhibitions, including standards for color intensity, pattern symmetry, and overall conformation. Understanding show quality standards can help users evaluate the quality of their own fish and aspire to achieve competitive success.

Famous Showa Koi: Showcase notable or famous Showa koi specimens that have achieved recognition and acclaim within the koi community. Highlighting exceptional examples of the variety can inspire users and showcase the diversity of Showa koi coloration and patterning.

Historical Significance: Explore the historical development and evolution of the Showa koi variety, including key milestones, influential breeders, and notable breeding breakthroughs. Understanding the historical context can deepen users' appreciation for the variety's heritage and cultural significance.

Artificial Color Enhancement: Discuss common techniques used to enhance or maintain the vibrant colors of Showa koi, such as color food supplements, light exposure, and selective breeding practices. Address any ethical considerations or potential risks associated with artificial color enhancement methods.

Personal Stories and Testimonials: Share personal stories, testimonials, or anecdotes from koi enthusiasts who have experience with Showa koi. Hearing firsthand accounts of the joys and challenges of keeping Showa koi can resonate with users and provide valuable insights into the hobby.

Interactive Element: Include an interactive element like an identification challenge to test users' knowledge and sharpen their skills by identifying different koi varieties, including Showa, based on provided images and descriptions.

Care Information:
• Water Quality: Showa koi thrive in clean and well-maintained water conditions. Regular water testing and filtration are essential to ensure optimal health and coloration.
• Feeding: Provide a balanced diet of high-quality koi pellets, supplemented with occasional treats like vegetables or fruits. Avoid overfeeding to prevent health issues and water pollution.
• Temperature: Maintain a stable water temperature between 59°F to 77°F (15°C to 25°C) to support the overall health and well-being of Showa koi.
• Space: Provide ample space in the pond for Showa koi to swim and explore. Avoid overcrowding to minimize stress and aggression among fish.
• Health Monitoring: Regularly monitor the health and behavior of Showa koi, and promptly address any signs of illness or injury with appropriate treatment.
'''),
          KoiFishCard(
              name: 'Hiutsuri',
              imagePath: 'assets/hiutsuri.jpg', // Replace with your image path
              summary:
                  'Hiutsuri is a koi variety with a black body and bright red markings.',
              description:
                  '''Environmental Considerations: Kohaku koi thrive in clean and well-oxygenated water with ample space to swim and explore. Adequate filtration, aeration, and regular water changes are essential to maintain optimal water quality and prevent the buildup of harmful pollutants. They are relatively hardy and adaptable to a wide range of environmental conditions, but sudden fluctuations in temperature or water chemistry can stress the fish and compromise their health.

Interactions with Other Varieties: Kohaku koi coexist harmoniously with other koi varieties in pond environments, often forming social hierarchies based on size, age, and dominance. While they may display territorial behavior and occasional aggression towards other fish, they generally interact peacefully with compatible tank mates. Introducing new fish to a pond should be done gradually to minimize stress and acclimatize the fish to their new environment.

Conservation Efforts: Conservation efforts aimed at preserving and protecting Kohaku koi focus on maintaining genetic diversity, promoting responsible breeding practices, and raising awareness about the importance of koi conservation. Breeding programs, genetic research, and educational initiatives help ensure the long-term sustainability of Kohaku koi populations and safeguard their cultural heritage for future generations.

Seasonal Considerations: Kohaku koi may exhibit variations in behavior, appetite, and coloration in response to seasonal changes, such as temperature fluctuations and daylight length. Providing seasonal care tips, such as adjusting feeding schedules, monitoring water temperature, and protecting fish from extreme weather conditions, can help users maintain the health and well-being of their Kohaku koi throughout the year.

Educational Resources: Recommend additional educational resources, such as books, websites, forums, or educational videos, where users can further expand their knowledge of Kohaku koi and koi keeping practices. Access to reliable and informative resources empowers users to become knowledgeable and responsible koi enthusiasts.

Environmental Enrichment: Suggest ways to enrich the pond environment for Kohaku koi, such as adding natural vegetation, aquatic structures, or underwater caves to encourage exploration and stimulation. Providing a stimulating and dynamic environment promotes the physical and mental well-being of Kohaku koi, enhancing their overall quality of life.

Community Engagement: Encourage users to join online koi keeping communities or local koi clubs where they can connect with fellow enthusiasts, share experiences, and seek advice and support. Engaging with a community of like-minded individuals fosters camaraderie, knowledge sharing, and mutual support, enriching the koi keeping experience for users.

Ethical Considerations: Address ethical considerations related to koi keeping, such as responsible breeding practices, avoiding invasive species introduction, and respecting the natural habitat of koi fish. Promoting ethical practices ensures the sustainability and well-being of koi populations and their environments.

Growth Rate and Size: Discuss the typical growth rate and size potential of Kohaku koi, including factors that influence growth, such as water quality, temperature, and feeding regimen. Providing information on expected size ranges can help users plan their pond or aquarium setup accordingly.

Show Quality Standards: Explain the criteria used to judge Kohaku koi in competitions and exhibitions, including standards for color intensity, pattern symmetry, and overall conformation. Understanding show quality standards can help users evaluate the quality of their own fish and aspire to achieve competitive success.

Famous Kohaku Koi: Showcase notable or famous Kohaku koi specimens that have achieved recognition and acclaim within the koi community. Highlighting exceptional examples of the variety can inspire users and showcase the diversity of Kohaku koi coloration and patterning.

Historical Significance: Explore the historical development and evolution of the Kohaku koi variety, including key milestones, influential breeders, and notable breeding breakthroughs. Understanding the historical context can deepen users' appreciation for the variety's heritage and cultural significance.

Artificial Color Enhancement: Discuss common techniques used to enhance or maintain the vibrant colors of Kohaku koi, such as color food supplements, light exposure, and selective breeding practices. Address any ethical considerations or potential risks associated with artificial color enhancement methods.

Personal Stories and Testimonials: Share personal stories, testimonials, or anecdotes from koi enthusiasts who have experience with Kohaku koi. Hearing firsthand accounts of the joys and challenges of keeping Kohaku koi can resonate with users and provide valuable insights into the hobby.

Interactive Element: Include an interactive element like an identification challenge to test users' knowledge and sharpen their skills by identifying different koi varieties, including Kohaku, based on provided images and descriptions.

Care Information:
•	Water Quality: Kohaku koi thrive in clean and well-maintained water conditions. Regular water testing and filtration are essential to ensure optimal health and coloration.
•	Feeding: Provide a balanced diet of high-quality koi pellets, supplemented with occasional treats like vegetables or fruits. Avoid overfeeding to prevent health issues and water pollution.
•	Temperature: Maintain a stable water temperature between 59°F to 77°F (15°C to 25°C) to support the overall health and well-being of Kohaku koi.
•	Space: Provide ample space in the pond for Kohaku koi to swim and explore. Avoid overcrowding to minimize stress and aggression among fish.
•	Health Monitoring: Regularly monitor the health and behavior of Kohaku koi, and promptly address any signs of illness or injury with appropriate treatment.
'''),
          KoiFishCard(
              name: 'Kohaku',
              imagePath: 'assets/kohaku.jpg', // Replace with your image path
              summary:
                  'Kohaku is a classic koi variety featuring a white body with red markings.',
              description:
                  '''Description of Physical Characteristics: Hiutsuri koi are striking and bold, featuring a black (sumi) body with vibrant red (hi) markings. The red markings can vary in shape and size, often resembling flames or streaks of fire against the black base, creating a dramatic and eye-catching contrast. The clarity and intensity of the red and black colors are key characteristics that define the beauty of Hiutsuri koi.

Identification Tips: When identifying a Hiutsuri koi fish, look for:
•	A deep, rich black base (sumi).
•	Bright, intense red (hi) markings.
•	A pattern that is well-distributed and aesthetically balanced.

Color Changes Over Time: As Hiutsuri koi mature, their red and black coloration can change. The intensity of the red (hi) markings may deepen or become more defined, while the black (sumi) can become richer and more pronounced. Environmental factors, diet, and genetics all play roles in the development and maintenance of their vibrant colors.

Breeding and Development: Hiutsuri koi are bred through careful selective breeding to enhance the contrast between their red and black coloration. Breeders select parent fish with the most desirable color intensity, pattern clarity, and distribution to produce high-quality offspring. The breeding process aims to achieve vibrant red markings against a solid black base.

Variations and Subtypes: While Hiutsuri koi typically feature red markings on a black base, there can be variations in the pattern and intensity of the colors. Some Hiutsuri may display more extensive red markings, while others may have a more balanced mix of red and black.

Symbolism and Cultural Significance: Hiutsuri koi, with their bold and fiery appearance, are often seen as symbols of strength, energy, and transformation. Their dramatic coloration can symbolize overcoming challenges and thriving despite adversity. Hiutsuri koi are admired for their dynamic patterns and are a popular choice among koi enthusiasts who appreciate their striking visual impact.

Health and Disease Prevention: Hiutsuri koi require diligent care to maintain their health and vibrant coloration. Regular monitoring of water quality, temperature, and pH levels is essential to prevent stress-related illnesses and maintain optimal conditions for the fish. Hiutsuri koi are susceptible to common koi diseases such as parasites, bacterial infections, and fungal outbreaks, so preventive measures such as quarantine procedures and proper nutrition are crucial.

Environmental Considerations: Hiutsuri koi thrive in clean and well-oxygenated water with ample space to swim and explore. Adequate filtration, aeration, and regular water changes are essential to maintain optimal water quality and prevent the buildup of harmful pollutants. They are relatively hardy and adaptable to a wide range of environmental conditions, but sudden fluctuations in temperature or water chemistry can stress the fish and compromise their health.

Interactions with Other Varieties: Hiutsuri koi coexist harmoniously with other koi varieties in pond environments, often forming social hierarchies based on size, age, and dominance. While they may display territorial behavior and occasional aggression towards other fish, they generally interact peacefully with compatible tank mates. Introducing new fish to a pond should be done gradually to minimize stress and acclimatize the fish to their new environment.

Conservation Efforts: Conservation efforts aimed at preserving and protecting Hiutsuri koi focus on maintaining genetic diversity, promoting responsible breeding practices, and raising awareness about the importance of koi conservation. Breeding programs, genetic research, and educational initiatives help ensure the long-term sustainability of Hiutsuri koi populations and safeguard their cultural heritage for future generations.

Seasonal Considerations: Hiutsuri koi may exhibit variations in behavior, appetite, and coloration in response to seasonal changes, such as temperature fluctuations and daylight length. Providing seasonal care tips, such as adjusting feeding schedules, monitoring water temperature, and protecting fish from extreme weather conditions, can help users maintain the health and well-being of their Hiutsuri koi throughout the year.

Educational Resources: Recommend additional educational resources, such as books, websites, forums, or educational videos, where users can further expand their knowledge of Hiutsuri koi and koi keeping practices. Access to reliable and informative resources empowers users to become knowledgeable and responsible koi enthusiasts.

Environmental Enrichment: Suggest ways to enrich the pond environment for Hiutsuri koi, such as adding natural vegetation, aquatic structures, or underwater caves to encourage exploration and stimulation. Providing a stimulating and dynamic environment promotes the physical and mental well-being of Hiutsuri koi, enhancing their overall quality of life.

Community Engagement: Encourage users to join online koi keeping communities or local koi clubs where they can connect with fellow enthusiasts, share experiences, and seek advice and support. Engaging with a community of like-minded individuals fosters camaraderie, knowledge sharing, and mutual support, enriching the koi keeping experience for users.

Ethical Considerations: Address ethical considerations related to koi keeping, such as responsible breeding practices, avoiding invasive species introduction, and respecting the natural habitat of koi fish. Promoting ethical practices ensures the sustainability and well-being of koi populations and their environments.

Growth Rate and Size: Discuss the typical growth rate and size potential of Hiutsuri koi, including factors that influence growth, such as water quality, temperature, and feeding regimen. Providing information on expected size ranges can help users plan their pond or aquarium setup accordingly.

Show Quality Standards: Explain the criteria used to judge Hiutsuri koi in competitions and exhibitions, including standards for color intensity, pattern symmetry, and overall conformation. Understanding show quality standards can help users evaluate the quality of their own fish and aspire to achieve competitive success.

Famous Hiutsuri Koi: Showcase notable or famous Hiutsuri koi specimens that have achieved recognition and acclaim within the koi community. Highlighting exceptional examples of the variety can inspire users and showcase the diversity of Hiutsuri koi coloration and patterning.

Historical Significance: Explore the historical development and evolution of the Hiutsuri koi variety, including key milestones, influential breeders, and notable breeding breakthroughs. Understanding the historical context can deepen users' appreciation for the variety's heritage and cultural significance.

Artificial Color Enhancement: Discuss common techniques used to enhance or maintain the vibrant colors of Hiutsuri koi, such as color food supplements, light exposure, and selective breeding practices. Address any ethical considerations or potential risks associated with artificial color enhancement methods.

Personal Stories and Testimonials: Share personal stories, testimonials, or anecdotes from koi enthusiasts who have experience with Hiutsuri koi. Hearing firsthand accounts of the joys and challenges of keeping Hiutsuri koi can resonate with users and provide valuable insights into the hobby.

Interactive Element: Include an interactive element like an identification challenge to test users' knowledge and sharpen their skills by identifying different koi varieties, including Hiutsuri, based on provided images and descriptions.

Care Information:
•	Water Quality: Hiutsuri koi thrive in clean and well-maintained water conditions. Regular water testing and filtration are essential to ensure optimal health and coloration.
•	Feeding: Provide a balanced diet of high-quality koi pellets, supplemented with occasional treats like vegetables or fruits. Avoid overfeeding to prevent health issues and water pollution.
•	Temperature: Maintain a stable water temperature between 59°F to 77°F (15°C to 25°C) to support the overall health and well-being of Hiutsuri koi.
•	Space: Provide ample space in the pond for Hiutsuri koi to swim and explore. Avoid overcrowding to minimize stress and aggression among fish.
•	Health Monitoring: Regularly monitor the health and behavior of Hiutsuri koi, and promptly address any signs of illness or injury with appropriate treatment.

'''),
        ],
      ),
    );
  }
}

class KoiFishCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String summary;
  final String description;

  KoiFishCard({
    required this.name,
    required this.imagePath,
    required this.summary,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(name),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imagePath),
                    SizedBox(height: 10),
                    Text(description),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    summary,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

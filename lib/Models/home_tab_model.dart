class HomeTabModel {
  final String imagePath;
  final String name;
  final List<Map<String, dynamic>> items; // Dynamic list with details

  HomeTabModel(
      {required this.imagePath, required this.name, required this.items});
}

List<HomeTabModel> hometab = [
  HomeTabModel(
    imagePath: "assets/homeAssets/sports.png",
    name: "Sports",
    items: [
      {
        'title': 'Football Tournament',
        'date': '2025-03-10',
        'location': 'New York Stadium',
        'teams': ['Team A', 'Team B'],
        'prize': '\$50,000',
        'registerLink': 'https://sports.com/football'
      },
      {
        'title': 'Basketball League',
        'date': '2025-04-05',
        'location': 'Los Angeles Arena',
        'teams': ['Lakers', 'Warriors'],
        'prize': '\$30,000',
        'registerLink': 'https://sports.com/basketball'
      },
    ],
  ),
  HomeTabModel(
    imagePath: "assets/homeAssets/news.png",
    name: "News",
    items: [
      {
        'title': 'Tech Innovations 2025',
        'date': '2025-03-05',
        'location': 'TechCrunch', // Source as location
        'teams': [], // Empty list
        'prize': null, // No prize
        'registerLink': 'https://techcrunch.com/innovations-2025'
      },
      {
        'title': 'Global Economy Update',
        'date': '2025-03-06',
        'location': 'Forbes',
        'teams': [],
        'prize': null,
        'registerLink': 'https://forbes.com/economy-update'
      },
    ],
  ),
  HomeTabModel(
    imagePath: "assets/homeAssets/internships.png",
    name: "Internships",
    items: [
      {
        'title': 'Software Engineering Intern',
        'date': '2025-06-01', // Start date
        'location': 'Remote',
        'teams': [],
        'prize': '\$2000/month', // Stipend
        'registerLink': 'https://careers.google.com/internship'
      },
      {
        'title': 'Data Science Intern',
        'date': '2025-06-15',
        'location': 'Seattle, WA',
        'teams': [],
        'prize': '\$2500/month',
        'registerLink': 'https://amazon.jobs/internship'
      },
    ],
  ),
  HomeTabModel(
    imagePath: "assets/homeAssets/university.png",
    name: "Uni Campus",
    items: [
      {
        'title': 'Hackathon 2025',
        'date': '2025-06-10',
        'location': 'MIT Campus',
        'teams': [],
        'prize': '\$20 Entry Fee',
        'registerLink': 'https://mit.edu/hackathon2025'
      },
      {
        'title': 'Cultural Fest',
        'date': '2025-07-15',
        'location': 'Harvard Grounds',
        'teams': [],
        'prize': 'Free Entry',
        'registerLink': 'https://harvard.edu/culturalfest'
      },
    ],
  ),
  HomeTabModel(
    imagePath: "assets/homeAssets/hackethon.png",
    name: "Hackathons",
    items: [
      {
        'title': 'AI Challenge',
        'date': '2025-05-25',
        'location': 'Online',
        'teams': [],
        'prize': '\$10,000',
        'registerLink': 'https://openai.com/ai-challenge'
      },
      {
        'title': 'Cyber Security Hackathon',
        'date': '2025-06-30',
        'location': 'San Francisco',
        'teams': [],
        'prize': '\$5,000',
        'registerLink': 'https://defcon.org/cyberhack'
      },
    ],
  ),
];

final List<Map<String, String>> carouselItems = [
  {
    "imagePath": "assets/homeAssets/caro1.jpg",
    "title": "Exciting Job Openings",
  },
  {
    "imagePath": "assets/homeAssets/caro1.jpg",
    "title": "Internship Opportunities",
  },
  {
    "imagePath": "assets/homeAssets/caro1.jpg",
    "title": "Skill Development Courses",
  },
  {
    "imagePath": "assets/homeAssets/caro1.jpg",
    "title": "Networking Events",
  },
];

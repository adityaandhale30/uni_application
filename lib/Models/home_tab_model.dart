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
"imagePath": "assets/homeAssets/job1.webp",
"title": "International Jobs And Internships",
"news": "New international job opportunities and internships are now open for applications worldwide.",
"info": "Explore opportunities with top companies globally.",
"startDate": "2025-04-01",
"endDate": "2025-06-01",
"url": "https://www.example.com/international-jobs",
},
{
"imagePath": "assets/homeAssets/job3.jpeg",
"title": "Hackathon Events",
"news": "Join the upcoming global hackathons and showcase your skills. The top winners will receive exciting prizes!",
"info": "Participate in competitive coding events and network with experts.",
"startDate": "2025-04-10",
"endDate": "2025-04-12",
"url": "https://www.example.com/hackathon-events",
},
{
"imagePath": "assets/homeAssets/caro1.jpg",
"title": "Exciting Job Openings",
"news": "Check out the latest job openings in various industries. Apply now to take your career to the next level!",
"info": "New roles available in software development, marketing, and more.",
"startDate": "2025-04-05",
"endDate": "2025-05-15",
"url": "https://www.example.com/job-openings",
},
{
"imagePath": "assets/homeAssets/job2.png",
"title": "Sports Events",
"news": "Stay updated on the latest sports tournaments and matches happening globally.",
"info": "Upcoming tournaments in football, cricket, and more.",
"startDate": "2025-05-01",
"endDate": "2025-06-15",
"url": "https://www.example.com/sports-events",
},
// {
// "imagePath": "assets/homeAssets/job4.jpg",
// "title": "Startup Networking",
// "news": "Meet industry leaders at startup networking events. A great opportunity for entrepreneurs!",
// "info": "Network with startups, investors, and entrepreneurs.",
// "startDate": "2025-04-20",
// "endDate": "2025-04-25",
// "url": "https://www.example.com/startup-networking",
// },
// {
// "imagePath": "assets/homeAssets/job5.png",
// "title": "Tech Conferences",
// "news": "Attend global tech conferences to stay ahead of trends in AI, Cloud Computing, and more.",
// "info": "Learn from top tech experts and share innovative ideas.",
// "startDate": "2025-05-05",
// "endDate": "2025-05-10",
// "url": "https://www.example.com/tech-conferences",
// },
{
"imagePath": "assets/homeAssets/job8.jpeg",
"title": "Startup Job Fair",
"news": "Find your next job at the startup job fair. Meet hiring companies and explore career opportunities.",
"info": "Meet companies looking for fresh talent in the startup ecosystem.",
"startDate": "2025-05-15",
"endDate": "2025-05-20",
"url": "https://www.example.com/startup-job-fair",
},
// {
// "imagePath": "assets/homeAssets/job7.jpg",
// "title": "Entrepreneurship Bootcamp",
// "news": "Join the entrepreneurship bootcamp to turn your ideas into successful ventures.",
// "info": "Workshops, mentorship, and hands-on experience for budding entrepreneurs.",
// "startDate": "2025-06-01",
// "endDate": "2025-06-05",
// "url": "https://www.example.com/entrepreneurship-bootcamp",
// },
];


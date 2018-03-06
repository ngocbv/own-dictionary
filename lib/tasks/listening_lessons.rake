namespace :listening_lessons do
  task :create => :environment do
    listening_lessons = ["Accidents","Babysitting","Calories","Actors","Bad Habits","Carbon Footprint",
      "Advertising","Banks","Careers","Advice","Baths","Cars","Airplanes","Beauty","Chickens","Airports",
      "Being Afraid","Children","Alcohol","Being Married","Chocolate","Aliens","Being Single","Christmas",
      "Animals","Birthdays","Climate Change","Anti-Aging Creams","Blood","Clothes","Apartments","Books",
      "Coffee","Art","Bullying","Computers","Autumn","Business","Cosmetic Surgery","Avatars","Busy",
      "Cosmetics","Credit Cards","Crime","Culture","Current Events","Cyber-bullying","Cyber Crime",
      "Dancing","E-Mail","Factories","Danger","Eating","Family","Death","Education","Famine","Dentists",
      "Eggs","Fashion","Diamonds","Electricity","Fast Food","Digital Cameras","Emergencies","Fear",
      "Directions","Energy","Feet","Disability","English","First Impressions","Discrimination","Evolution",
      "Fish","Diseases","Exercise","Fishing","Divorce","Flowers","Doctors","Flying","Dogs","Food","Dreams",
      "Food Safety","Driving","Football","Drugs","Formula One","Four Seasons","Freedom","French Fries",
      "Friends","Frustration","Fun","Funerals","Furniture","Gambling","Hacking","I Love You","Gangs",
      "Hair","Identity Cards","Gangsters","Haircuts","Immigration","Gardening","Halloween","Inflation",
      "Gardens","Hands","Information","Genetic Engineering","Hangovers","Insects","Genocide","Happiness",
      "Intelligence","Getting Married","Harry Potter","Internet","Global Warming","Hate Crimes","Investments",
      "Globalization","Health","God","Healthcare","Gold","Heart","Golden Week","Heart Attacks","Google",
      "Heaven","Gossip","Heroes","Grammar","Hiking","Gun Control","Hip-Hop","Guns","History","Holidays",
      "Home School","Homelessness","Homes","Horoscopes","Hospitals","Houses","Housewives","Human Rights",
      "Humour","Jewelry","Kissing","Laughter","Job Interviews","Knowledge","Language","Jokes","Laws",
      "Journalism","Leadership","Juice","Learning","Junk Mail","Libraries","Lies","Life","Lifestyle",
      "Listening","Literature","Love","Love at First Sight","Luck","Magazines","Nails","Obesity",
      "Management","Names","Oceans","Marathons","National Anthems","Oil","Marketing","Nationality",
      "OK","Marriage","Natural Disasters","Old Age","Mathematics","Neighbours","Olympics","Meat",
      "News","One","Media","Night","Operations","Medicine","No","Opinions","Meditation","Nobel Prize",
      "Organ Transplants","Memories","Noise","Overpopulation","Men","Noses","Ozone Layer","Mental Health",
      "Nuclear Energy","Microsoft","Nuclear Weapons","Milk","Numbers","Mobile Phones","Nursing","Models",
      "Modern Living","Monarchy","Money","Moon","Mothers","Mountains","Movies","MP3s","Multiculturalism",
      "Murder","Muscles","Museums","Music","Musical Instruments","Mysteries","Painting","Qualifications",
      "Racism","Panic","Quality","Radio","Paper","Quality of Life","Radios","Parenting","Quarreling","Rain",
      "Parks","Questions","Ramadan","Parties","Quizzes","Rap Music","Passports","Quotations","Reading",
      "Pasta","Reading Activities","Patience","Reality TV","Peace","Recycling","Pensions","Red","People",
      "Refugees","Perfume","Religion","Personal Problems","Rent","Personality","Research","Pets","Restaurants",
      "Philosophy","Retirement","Phobias","Rice","Photography","Risk","Physics","Road Rage","Picnics","Robots",
      "Pilots","Rock 'n' Roll","Pizza","Roses","Plagiarism","Royal Wedding","Planets","Rubbish","Plastic",
      "Rudeness","Poetry","Police","Politics","Pollution","Population","Pornography","Postal Service","Potatoes",
      "Poverty","Power","Prayer","Pregnancy","Prejudice","Prices","Pride","Privacy","Pronunciation","Property",
      "Prostitution","Protests","Psychology","Public Relations","Pubs, Clubs and Bars","Pyramids","Safety","Tax",
      "UFOs","Salad","Taxis","United Nations","Sand","Teaching","Universe","School","Tears","University","Science",
      "Technology","Science Fiction","Teddy Bears","Search Engines","Teenagers","Valentine's Day - Love","Security",
      "Teeth","Valentine's Day - Hate","Senility","Telephones","Vandalism","Senses","Television","Vegetarianism",
      "Seven Wonders of the World","Temperature","Video Games","Sex","Tennis","Violence","Sexism","Terrorism",
      "Vitamins","Shopping","Tests","Vocabulary","Sightseeing","The Family Pet","Vocabulary Activities",
      "Silence","Theatre","Volunteerism","Sin","Tigers","Voting","Skin","Time","Slavery","Tourism","Sleep",
      "Toys","Walking","Smells","Traffic","War","Smiling","Trains","War Crimes","Smoking","Translation","Water",
      "Snacks","Transplants","Wealth","Snakes","Transportation","Weapons","Snow","Travelling","Weather",
      "Social Issues","Websites","Social Networking","Wedding Anniversaries","Social Work","Weddings","Socialism",
      "Weekends","Society","Weight","Software","Whales","Solar Energy","Winter","Solar System","Winter Olympics",
      "Soldiers","Women","Sound","Words","Souvenirs","Writing","Speaking Activities","Writing Activities","Speed",
      "Spelling","Spelling Activities","Xenophobia","Spiders","X-Rays","Sport","Spring","Standard of Living","Yes",
      "Statistics","Youth","Stem Cell Research","Stereotypes","Stock Market","Zoos","Stress","Students","Studying",
      "Success","Sugar","Suicide","Summer","Sumo","Sun","Soccer World Cup 2010","Super Bowl XLIV",
      "Lessons on all teams","Supermarkets","Surgery","Sustainable Development","Sweatshops"]

    listening_lessons.each do |lesson|
      except_characters = /\'\-/
      link = lesson.downcase
      link.gsub!(/\'/, '')
      link.gsub!(/\s/, '')
      link = link.underscore
      link = "https://listenaminute.com/#{link[0]}/#{link}.mp3"

      ll = ListeningLesson.new name: lesson, link: link
      if ll.save
        puts "'#{lesson}' is created."
      else
        puts "Can't create '#{lesson}'."
      end
    end
  end
end

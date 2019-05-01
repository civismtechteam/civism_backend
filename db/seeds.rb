# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

PROFILE_PICTURES = [
  "https://images.unsplash.com/photo-1483410859390-6dbb1dc2337d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1540057268416-a8d6f0f60ac5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1532032877540-0793b44545a2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1541805500-0b420aa2d99c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1536763225213-b5592b525630?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1505075123357-35a9138620d9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1531750026848-8ada78f641c2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1535468850893-d6e543fbd7f5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9",
  "https://images.unsplash.com/photo-1521511189395-b82252213754?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=100&h=100&fit=crop&ixid=eyJhcHBfaWQiOjF9"
]

def random_comment
  [ Faker::GreekPhilosophers.quote, Faker::Hipster.sentence, Faker::Hacker.say_something_smart ].sample
end

Scoop.create!([
  {
    name: "Amazon's HQ2 in Long Island City",
    image_path: "./"
  }, {
    name: "The Green New Deal",
    image_path: "./"
  }
])

scoops = Scoop.all

10.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    image_path: PROFILE_PICTURES.pop || Faker::Avatar.image,
    verified: [true, false].sample
  })
end

users = User.all

# HQ2 Facts
Fact.create!({
  body: "Amazon claimed each HQ2 site would create 25,000 jobs.",
  scoop: scoops.first,
  source_link: "https://www.geekwire.com/2019/amazon-officially-hiring-new-york-hq2",
  user: users.sample
})
Fact.create!({
  body: "Amazon announced on Nov 13th, 2018 that chose Long Island City in NY as one of the locations for it's HQ2.",
  scoop: scoops.first,
  source_link: "https://www.citylab.com/life/2018/11/amazon-hq2-nyc-dc-headquarters-jeff-bezos-announcement/561236",
  user: users.sample
})
Fact.create!({
  body: "On Feb 14th, 2019, Amazon announced that it was pulling out of Long Island City.",
  scoop: scoops.first,
  source_link: "https://www.vox.com/the-goods/2019/2/14/18225003/amazon-hq2-new-york-pulling-out",
  user: users.sample
})
Fact.create!({
  body: "Amazon said it would oppose any attempt of it's NYC workers to unionize.",
  scoop: scoops.first,
  source_link: "https://ny.curbed.com/2019/2/8/18217129/amazon-hq2-new-york-long-island-city-reconsider",
  user: users.sample
})
Fact.create!({
  body: "Analysis by Mr. Cooper found that Amazon's HQ2 could drive up home prices in its chosen city by nearly 30%.",
  scoop: scoops.first,
  source_link: "https://www.businessinsider.com/amazon-hq2-disaster-new-york-city-2018-11#real-estate-prices-could-skyrocket-2",
  user: users.sample
})
Fact.create!({
  body: "New York gave the Amazon $1.7 billion in economic incentives to build HQ2 in Long Island Cidy.",
  scoop: scoops.first,
  source_link: "https://www.businessinsider.com/amazon-hq2-disaster-new-york-city-2018-11#taxpayers-will-be-on-the-hook-5",
  user: users.sample
})

facts = Fact.all[1..-1]

# HQ2 First Fact Comments
Comment.create!({
  user: users.sample,
  body: "They literally could have just given those 25,000 people 92,000 dollars each...",
  commentable: Fact.first
})
Comment.create!({
  user: users.sample,
  body: "How long until most of those jobs are automated by drones? Bookmark this page for when the layoffs are reported.",
  commentable: Fact.first
})
Comment.create!({
  user: users.sample,
  body: "Well their subsidies are paid out per job per year so it won;t cost the city as much if they do.",
  commentable: Comment.second
})
Comment.create!({
  user: users.sample,
  body: "The headquarters jobs are the people that program the drones. The warehouses are where the drones are used. These are not Amazon warehouses.",
  commentable: Comment.second
})
Comment.create!({
  user: users.sample,
  body: "Amazon's new headquarter is the product, the cities are potiential consumers. Amazon did this to start a bidding war between cities. Cities wanting the product for their own economic gain -thus creating high demand. Number if cities are high + supply (1 HQ) very low = high price (tax benefit).",
  commentable: Fact.first
})
Comment.create!({
  user: users.sample,
  body: "Corporations are high school cheerleaders the week before prom and municipalities/cities are pizza-faced nerds offering to do their homework for a year.",
  commentable: Fact.first
  })
Comment.create!({
  user: users.sample,
  body: "This is the largest economic development initiative that has ever been done by the City or the State or the City and the State together, believe it or not.",
  commentable: Fact.first
})
Comment.create!({
  user: users.sample,
  body: "But how much tax revenue will it create via new income taxes, and all the other additional taxes that the new employees will generate? Factor in the time the headquarters will spend in those given locations.",
  commentable: Fact.first
})

# HQ2 Perspectives
p1 = %q[
An honest and non-biased perspective on Amazon's HQ2.
1. NY giving away almost $2B of money is not worth the tax revenue benefits of Amazon moving to NYC.
    1.a. My evaluation is this is a bad argument.
    1.b. The agreement between NYS / NYC and Amazon clearly lay out the requirements for Amazon to have spent over $3.8B in capital and hire over 25K employees at an average salary of $150K. See appendix C for all the details. A timetable is laid out for when the incentives are given to Amazon and what Amazon has to do in advance of receiving those incentives. The negotiators of this agreement made it so that NY will see a net benefit in Tax revenue as a result of this move.
2. The $2B of incentives could have been better spent on <Subway, housing, education, pick your favorite policy>
    2.a. My evaluation is that this is a bad argument.
    2.b. Per point 1 above, the $1.7B in concessions offered by NY will return more than $1.7B in increased tax revenue, enabling the city to put even more money into your favorite policy at the end of the day.
3. Amazon would have moved to NYC with no or lower incentives
    3.a. My evaluation is that this is a good argument, with some nuance.
    3.b. Virginia attracted amazon with only $500M of inventives, vs. NY's $1.7B. Additionally, other states (e.g., maryland) offered as much as $8.5B in incentives which Amazon choose to turn down [Source]. This creates a strong argument for the case that Amazon liked new york for many reasons that had nothing to do with the incentives, and likely would have moved here even if the incentives were lower.
    3.c. However, it has been noted that NY has higher taxes and fees than other areas, including Virginia, so therefore NY offering more in incentives simply offsets those higher taxes.
]

p2 = %q[
Amazon’s HQ2 was a con, not a contest.
To dozens of cities across the United States, Amazon’s widely publicized search for a “second headquarters” looked like thousands of new jobs, up for grabs. To Pivot co-host Scott Galloway, it now looks like a “ruse.”
“I lease office space all the time for my businesses and I always tell my real estate agent, ‘We can lease any office in the world as long as I can walk there from where I live,’” Galloway said on the latest episode. “Amazon is now talking about having three headquarters, Seattle, Crystal City and Long Island City. The Bezos’s also own three homes, and the average distance from those three homes to a headquarters is 6.4 miles.
“This was never a contest,” he added. “It was a con meant to induce ridiculous terms that they then took to the cites all along that they knew they were going to be in.”
In other words: By soliciting bids from lots of place where it was never going to move, Galloway alleges, Amazon was probably able to get more tax breaks from the pre-determined “winners.”
]

p3 = %q[
College sees 36k on a weekly basis on its own, on one, local line (6). Queensboro has 2 lines (7,N/W), Queens Plaza at least 2 (E, M/R), and Court Sq. 1 more that the other two don't have (G). There's also the F at Queensbridge which isn't too far from the proposed site either.
Keeping ridership numbers in context is important here. Yes, the stations aren't empty, but the number of lines leading here is higher than other places, which spreads the increases across multiple lines rather than forcing everyone onto a single, congested train.
Also, there is an interesting argument that a fair chunk of their workers will probably commute into Queens from Manhattan, which would increase ridership on the line without materially affecting the capacity limitations on it (since trains out of Manhattan on all of these lines are pretty empty.
]

p4 = %q[
ULURP needs to be overhauled, it's completely corrupt and essentially all for show as most of the decisions are made in private meetings between the developers and their local councilman very early on. This city is in desperate need of more housing and the hundreds of thousands of dollars in consulting fees and three years it takes for property owners to get residential land use approval isn't helping anyone who needs it. The Annabel Basin project has been green lit for years, Plaxall has known what they wanted to build for years, the GPP and Amazon becoming a tenant just sped up the public part of the process and waiting periods.
]

[ p1, p2, p3, p4 ].each do |percpective_body|
  Perspective.create!({
    body: percpective_body,
    scoop: scoops.first,
    user: users.sample,
    viewpoint: %w[Conservative Liberal Moderate Neo-Liberal Laissez-Faire].sample
  })
end

# Perspective comments
Comment.create!({
  user: users.sample,
  body: "We'll see - I personally won't believe it until I see it.",
  commentable: Perspective.first
})
Comment.create!({
  user: users.sample,
  body: "According to the weekday rider stats, the Queensboro, Queens Plaza, and Court St stations combined already see 40k daily riders.",
  commentable: Perspective.first
})
Comment.create!({
  user: users.sample,
  body: "With the salaries being offered, there is a good chance many of the new riders will be 'reverse commuting' (from Manhattan to Queens) and have little effect on the crowding of the actual train. The platforms at Court Sq will get more clogged because of the lack of exits compared to some stations, but it's unlikely to affect large scale change on the Manhattan bound lines.",
  commentable: Perspective.first
})
Comment.create!({
  user: users.sample,
  body: "Thanks for this breakdown; it's helpful to see it put together in this way.",
  commentable: Perspective.first
})

perspectives = Perspective.all

100.times do
  Comment.create!({
    user: users.sample,
    body: random_comment,
    commentable: [ *facts, *perspectives, *Comment.order("RANDOM()").first(25) ].sample
  })
end

voteables = [ *facts, *perspectives, *Comment.all ]
directions = [ -1, 1 ]

1000.times do
  begin
    Vote.create({
      user: users.sample,
      direction: directions.sample,
      voteable: voteables.sample
    })
  rescue
  end
end

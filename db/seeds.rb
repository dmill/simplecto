require "csv"

#Seed Lingoes
CSV.foreach("./lib/lingoes.csv") do |lingo_row|
  if lingo_row[1]
    lingo = Lingo.find_or_initialize_by(term: lingo_row[0])
    lingo.definition = lingo_row[1]
    lingo.created_at = Faker::Date.between(900.days.ago, Date.today)
    lingo.save
  end
end

#Seed Experts

experts = ["design", "backend", "infrastructure", "frontend", "devops"].map do |exp_type|
            password = Faker::Internet.password
            User.create(expert: true, first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name, expert_type: exp_type,
                        email: Faker::Internet.email,
                        created_at: Faker::Date.between(905.days.ago, 903.days.ago),
                        password: password, password_confirmation: password)
          end

# Seed Regular Users
1000.times do
  print "."

  password = Faker::Internet.password
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                     subscribed: rand(4) == 0, email: Faker::Internet.email,
                     created_at: Faker::Date.between(900.days.ago, Date.today),
                     password: password, password_confirmation: password)

  rand(11).times do
    Question.create(user: user, question_text: Faker::Hipster.paragraph(rand(4)),
                    answer_text: Faker::ChuckNorris.fact, title: Faker::Hipster.sentence,
                    expert: experts[rand(experts.length)], created_at: Faker::Date.between(user.created_at, Date.today))
  end
end

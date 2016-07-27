require "csv"


CSV.foreach("./lib/lingoes.csv") do |lingo_row|
  if lingo_row[1]
    lingo = Lingo.find_or_initialize_by(term: lingo_row[0])
    lingo.definition = lingo_row[1]
    lingo.save
  end
end

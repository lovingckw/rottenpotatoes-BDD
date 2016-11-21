Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
  movie = Movie.find_by_title(title)
  if (not movie.nil?)
    assert movie.director == director, "#{title} director is #{movie.director} and it should be #{director}"
  end
end
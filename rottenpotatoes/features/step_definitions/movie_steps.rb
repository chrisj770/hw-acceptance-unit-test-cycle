# Add a declarative step here for populating the DB with movies.



Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    print(movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page_as_string = page.body
  first = page_as_string.index(e1)
  second = page_as_string.index(e2)
  (first.nil? || second.nil? || (first > second)) ? fail : nil
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  # uncheck is nil or something else
  
  strings = rating_list.split
  strings.each do |str|
    new_string = "ratings[" + str + "]"
      uncheck.nil? ? check(new_string) : uncheck(new_string)
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.all('#movies tbody tr').count.should == Movie.count
end

Then /^the director of "(.+)" should be "(.+)"$/ do |movie, name|
  movie = Movie.where(:title => movie).first
  (movie.director != name) ? fail : nil
end
  
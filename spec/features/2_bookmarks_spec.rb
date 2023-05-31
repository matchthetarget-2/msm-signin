require "rails_helper"


describe "/bookmarks" do
  it "has a form to create bookmarks", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/bookmarks"

    expect(page).to have_tag("form", :count => 1),
      "Expect '/bookmarks' page to have exactly one <form> tag, but couldn't find one. "
  end
end

describe "/bookmarks" do
  it "has a dropdown to select Movies by title", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/bookmarks"

    expect(page).to have_tag("select", :count => 1),
      "Expect '/bookmarks' page to have exactly one <select> tag, but couldn't find one. "
  end
end

describe "/bookmarks" do
  it "form creates a bookmark record", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save


    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save
    
    other_movie = Movie.new
    other_movie.title = "James and the average-sized Peach"
    other_movie.duration = 1
    other_movie.description = "Not very noteworthy."
    other_movie.year = 2022
    other_movie.image = "peach.png"
    other_movie.director_id = director.id
    other_movie.save

    old_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count
    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end
    
    visit "/bookmarks"
    
    within(:css, "form") do
      select other_movie.title
      find("button", :text => /Bookmark this movie/i).click
    end
    
    new_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count
    
    expect(old_bookmarks_count).to be < new_bookmarks_count
  end
end

describe "/bookmarks" do
  it "displays a list of the signed in user's bookmarks", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.duration = 120
    the_turgle.description = "Prepare to get turgled."
    the_turgle.year = 2022
    the_turgle.image = "turgle.png"
    the_turgle.director_id = carole_danvers.id
    the_turgle.save

    save_turgle = Bookmark.new
    save_turgle.user_id = the_user.id
    save_turgle.movie_id = the_turgle.id
    save_turgle.save

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/bookmarks"

    expect(page).to have_text("The Turgle")
  end
end

describe "/bookmarks" do
  it "has a link to delete each bookmark", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.duration = 120
    the_turgle.description = "Prepare to get turgled."
    the_turgle.year = 2022
    the_turgle.image = "turgle.png"
    the_turgle.director_id = carole_danvers.id
    the_turgle.save

    save_turgle = Bookmark.new
    save_turgle.user_id = the_user.id
    save_turgle.movie_id = the_turgle.id
    save_turgle.save

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/bookmarks"

    expect(page).to have_tag("a", :text => /Un-bookmark/i),
      "Expect page to have an <a> element with the text 'Un-bookmark' but couldn't find one."
  end
end

describe "/bookmarks" do
  it "has a link, 'Un-bookmark', that removes a Bookmark record", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.duration = 120
    the_turgle.description = "Prepare to get turgled."
    the_turgle.year = 2022
    the_turgle.image = "turgle.png"
    the_turgle.director_id = carole_danvers.id
    the_turgle.save

    save_turgle = Bookmark.new
    save_turgle.user_id = the_user.id
    save_turgle.movie_id = the_turgle.id
    save_turgle.save

    old_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/bookmarks"

    find("a", :text => /Un-bookmark/i).click


    new_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count
    
    expect(old_bookmarks_count).to be > new_bookmarks_count
  end
end

describe "/movies/[MOVIE ID]" do
  it "does NOT have a button, 'Bookmark this movie', to create a bookmark record when user is signed out", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save


    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save
    
    other_movie = Movie.new
    other_movie.title = "James and the average-sized Peach"
    other_movie.duration = 1
    other_movie.description = "Not very noteworthy."
    other_movie.year = 2022
    other_movie.image = "peach.png"
    other_movie.director_id = director.id
    other_movie.save

    visit "/movies/#{other_movie.id}"
    
    expect(page).to_not have_tag("button", :text => /Bookmark this movie/i),
      "Expect page to NOT have an <button> element with the text 'Bookmark this movie' but found one instead."

  end
end

describe "/movies/[MOVIE ID]" do
  it "has a form to create a bookmark record when user is signed in", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save


    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save
    
    other_movie = Movie.new
    other_movie.title = "James and the average-sized Peach"
    other_movie.duration = 1
    other_movie.description = "Not very noteworthy."
    other_movie.year = 2022
    other_movie.image = "peach.png"
    other_movie.director_id = director.id
    other_movie.save

    old_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count
    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end
    
    visit "/movies/#{other_movie.id}"
    
    find("button", :text => /Bookmark this movie/i).click
    
    new_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count
    
    expect(old_bookmarks_count).to be < new_bookmarks_count
  end
end

describe "/movies/[MOVIE ID]" do
  it "has a link 'Un-bookmark' to delete bookmark if signed-in user has bookmarked the movie", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.duration = 120
    the_turgle.description = "Prepare to get turgled."
    the_turgle.year = 2022
    the_turgle.image = "turgle.png"
    the_turgle.director_id = carole_danvers.id
    the_turgle.save

    save_turgle = Bookmark.new
    save_turgle.user_id = the_user.id
    save_turgle.movie_id = the_turgle.id
    save_turgle.save

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/movies/#{the_turgle.id}"

    expect(page).to have_tag("a", :text => /Un-bookmark/i),
      "Expect page to have an <a> element with the text 'Un-bookmark' but couldn't find one."
  end
end

describe "/movies/[MOVIE ID]" do
  it "has a link, 'Un-bookmark', that removes a Bookmark record, if the signed-in user has bookmarked the movie", :points => 1 do
    the_user = User.new
    the_user.email = "claire@example.com"
    the_user.first_name = "Claire"
    the_user.last_name = "_"
    the_user.password = "password"
    the_user.save

    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.duration = 120
    the_turgle.description = "Prepare to get turgled."
    the_turgle.year = 2022
    the_turgle.image = "turgle.png"
    the_turgle.director_id = carole_danvers.id
    the_turgle.save

    save_turgle = Bookmark.new
    save_turgle.user_id = the_user.id
    save_turgle.movie_id = the_turgle.id
    save_turgle.save

    old_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count

    visit "/user_sign_in"
    
    within(:css, "form") do
      fill_in "Email", with: the_user.email
      fill_in "Password", with: the_user.password
      find("button", :text => /Sign in/i ).click
    end

    visit "/movies/#{the_turgle.id}"

    find("a", :text => /Un-bookmark/i).click


    new_bookmarks_count = Bookmark.where({ :user_id => the_user.id }).count
    
    expect(old_bookmarks_count).to be > new_bookmarks_count
  end
end


require "rails_helper"

describe "User" do
  it "has an column called 'password_digest' of type 'string'", points: 0 do
    new_user = User.new
    expect(new_user.attributes).to include("password_digest"),
      "Expected to have a column called 'password_digest', but didn't find one."
    expect(User.column_for_attribute('password_digest').type).to be(:string),
      "Expected column to be of type 'string' but wasn't."
    end
  end
  
describe "User model" do
  it "does not have a password column", :points => 0 do
      expect(User.columns.map(&:name)).to_not include("password"),
        "Expected User to NOT have a column called 'password', but found one."

  end
end

describe "User model" do
  it "has the 'has_secure_password' helper in in the User model", :points => 0 do

    expect(User.attribute_method?(:password)).to be(true),
      "Expected to have a column called 'password', but didn't find one."
  end
end

describe "Bookmark model" do
  it "has 'user_id' column", :points => 0 do

    expect(Bookmark.columns.map(&:name)).to include("user_id"),
      "Expected to have a column called 'user_id', but didn't find one."
  end
end

describe "Bookmark model" do
  it "has 'movie_id' column", :points => 0 do

    expect(Bookmark.columns.map(&:name)).to include("movie_id"),
      "Expected to have a column called 'movie_id', but didn't find one."
  end
end

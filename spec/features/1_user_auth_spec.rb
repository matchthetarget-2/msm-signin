require "rails_helper"


describe "/user_sign_in" do
  it "has form to sign in a User", points: 1 do
    visit "/user_sign_in"

    expect(page).to have_tag("form", :count => 1),
      "Expect '/user_sign_in' page to have exactly one <form> tag, but couldn't find one. "
  end
end

describe "/user_sign_in" do
  it "has a <label> with the text 'Email'", points: 1 do
    visit "/user_sign_in"

    expect(page).to have_tag("label", :text => /Email/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Email', but didn't find one."
  end
end

describe "/user_sign_in" do
  it "has a label 'Email' with a matching input tag.", :points => 1 do
    visit "/user_sign_in"
    
    name_label = find("label", :text => /Email/i)
    for_attribute = name_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_in" do
  it "has a <label> with the text 'Password'", points: 1 do
    visit "/user_sign_in"

    expect(page).to have_tag("label", :text => /Password/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Password', but didn't find one."
  end
end


describe "/user_sign_in" do
  it "has a label 'Password' with a matching input tag.", :points => 1 do
    visit "/user_sign_in"
    
    password_label = find("label", :text => /Password/i)
    for_attribute = password_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_in" do
  it "redirects you to the homepage when form is submitted", :points => 1 do
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

    expect(page.current_path).to eq("/")
  end
end

describe "/user_sign_in" do
  it "displays the 'Sign out' link when user is signed in", :points => 1 do
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

    expect(page).to have_tag("a", :text => /Sign out/i)
  end
end

describe "/user_sign_up" do
  it "has form to sign up a User", points: 1 do
    visit "/user_sign_up"

    expect(page).to have_tag("form", :count => 1),
      "Expect '/user_sign_up' page to have exactly one <form> tag, but couldn't find one. "
  end
end

describe "/user_sign_up" do
  it "has a <label> with the text 'Email'", points: 1 do
    visit "/user_sign_up"

    expect(page).to have_tag("label", :text => /Email/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Email', but didn't find one."
  end
end

describe "/user_sign_up" do
  it "has a label 'Email' with a matching input tag.", :points => 1 do
    visit "/user_sign_up"
    
    name_label = find("label", :text => /Email/i)
    for_attribute = name_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_up" do
  it "has a <label> with the text 'First name'", points: 1 do
    visit "/user_sign_up"

    expect(page).to have_tag("label", :text => /First name/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'First name', but didn't find one."
  end
end

describe "/user_sign_up" do
  it "has a label 'First name' with a matching input tag.", :points => 1 do
    visit "/user_sign_up"
    
    name_label = find("label", :text => /First name/i)
    for_attribute = name_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_up" do
  it "has a <label> with the text 'Last name'", points: 1 do
    visit "/user_sign_up"

    expect(page).to have_tag("label", :text => /Last name/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Last name', but didn't find one."
  end
end

describe "/user_sign_up" do
  it "has a label 'Last name' with a matching input tag.", :points => 1 do
    visit "/user_sign_up"
    
    name_label = find("label", :text => /Last name/i)
    for_attribute = name_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_up" do
  it "has a <label> with the text 'Password'", points: 1 do
    visit "/user_sign_up"

    expect(page).to have_tag("label", :text => /Password\b*$/i, :min => 1),
      "Expected page to have exactly 1 <label> tag with text 'Password', but didn't find one."
  end
end


describe "/user_sign_up" do
  it "has a label 'Password' with a matching input tag.", :points => 1 do
    visit "/user_sign_up"
    
    password_label = find("label", :text => /Password\b*$/i)
    for_attribute = password_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_up" do
  it "has a <label> with the text 'Password Confirmation'", points: 1 do
    visit "/user_sign_up"

    expect(page).to have_tag("label", :text => /Password Confirmation/i, :min => 1),
      "Expected page to have exactly 1 <label> tag with text 'Password Confirmation', but didn't find one."
  end
end


describe "/user_sign_up" do
  it "has a label 'Password Confirmation' with a matching input tag.", :points => 1 do
    visit "/user_sign_up"
    
    password_label = find("label", :text => /Password Confirmation/i)
    for_attribute = password_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/user_sign_up" do
  it "displays the 'Sign out' link when a user signs up", :points => 1 do

    visit "/user_sign_up"
    
    within(:css, "form") do
      fill_in "Email", with: "admin@example.com"
      fill_in "First name", with: "Admin"
      fill_in "Last name", with: "User"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      find("button", :text => /Sign up/i ).click
    end

    expect(page).to have_tag("a", :text => /Sign out/i)
  end
end

describe "/user_sign_up" do
  it "creates a new user record when the form is submitted", :points => 1 do
    user_count = User.all.count

    visit "/user_sign_up"
    
    within(:css, "form") do
      fill_in "Email", with: "admin@example.com"
      fill_in "First name", with: "Admin"
      fill_in "Last name", with: "User"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      find("button", :text => /Sign up/i ).click
    end

    expect(user_count).to be < User.all.count
  end
end

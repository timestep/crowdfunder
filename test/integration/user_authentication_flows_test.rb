require 'test_helper'

class UserAuthenticationFlowsTest < ActionDispatch::IntegrationTest
  test '/users/new' do
  	visit '/users/new'
  	assert_equal new_user_path, current_path

  	#assert there is a link in the nav to signup
  	assert find('.navbar').has_link?('Sign Up')

  	user = FactoryGirl.build(:user)

  	#fill in form with infor from user
  	fill_in 'user[email]', :with => user.email
  	fill_in 'user[first_name]', :with => user.first_name
  	fill_in	'user[username]', :with => user.username
  	fill_in 'user[last_name]', :with => user.last_name
  	fill_in 'user[password]', :with => user.password
  	fill_in 'user[password_confirmation]', :with => user.password
  	click_button "Create Account"
  	
  	assert_equal root_path, current_path

  	assert page.has_content?("Account created")

  	assert find('.navbar').has_no_link('Sign Up')
  	assert find('.navbar').has_link?('Logout')
  end

  test "failed registration" do 
    visit "/users/new"
    user = FactoryGirl.build(:user) 

    # Invalid form submission ...
    fill_in "user[email]", :with => user.email
    click_button "Create Account"
    # Should redirect to users_path and ...
    assert_equal users_path, current_path
    # ... no message saying "Account created" should appear
    assert page.has_no_content?("Account created")
  end


end

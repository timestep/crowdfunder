require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest

	test 'browsing projects' do
		#create 3 projects
	
		# binding.pry
		project1 = FactoryGirl.create(:project, :title => 'Project 1')
		project2 = FactoryGirl.create(:project, :title => 'Project 2')
		project3 = FactoryGirl.create(:project, :title => 'Project 3')

		#visit /project page

		visit "/projects"
		# assume its the same page
		assert_equal projects_path, current_path

		#assert the page has words
		assert page.has_content?('Listing projects')

		assert page.has_content?('Project 1')
		assert page.has_content?('Project 2')
		assert page.has_content?('Project 3')

    # Click a link to the project1's show page
		click_link 'Project 1'
		 # Assert we're on project1's show page
		assert_equal project_path(project1), current_path
    # Assert on this page the first h1 has the text project1's title
		assert find('h1:first').has_content? project1.title
	end

	test 'navigation' do

		project1 = FactoryGirl.create(:project, :title => 'Project 1')
		#visit the root Url
		visit '/'
		#assert the page we're on is root
		assert_equal root_path, current_path
		#assert the home nav elemen tis active
		assert_equal "Home", find('.navbar ul li.active a').text

		#click on link to projects
		find('.navbar ul').click_link('Projects')

		#assert the page we're on is the projects page
		assert_equal projects_path, current_path
		#assert the projects nav element is active
		assert_equal "Projects", find('.navbar ul li.active a').text
		

		click_link 'Project 1'
	
		assert_equal 'Projects', find('.navbar ul li.active a').text
	end
end

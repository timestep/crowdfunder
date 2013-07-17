require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest

	test 'browsing projects' do
		#create 3 projects
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
	end

end
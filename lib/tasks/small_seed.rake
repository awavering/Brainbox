task :small_seed => :environment do
	require 'factory_girl_rails'
	fg = FactoryGirl

	super_user = fg.create(:super)
	admin = fg.create :admin
	teachers = fg.create_list :teacher, 5
	students = fg.create_list :student, 20
	
	# create between a course with two sections, each with one section, for each teacher
	teachers.each do |teacher|
		course = fg.create :course
		section = fg.create :section
		section.add_teacher teacher
		students = students.sample(10)
		students.each{ |student| section.add_student student }

		assignments = fg.create_list(:assignment, 2).each do |assignment|

			comments = fg.create_list(:comment, 3).each do |c|
				c.user = students.sample
				c.save

				assignment.comments << c
			end

			assignment.save
		end

		assignments.each{ |assignment| section.assignments << assignment }
		section.save

		course.sections << section
		course.save
	end

end

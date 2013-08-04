task :reset do
	Rake::Task["db:reset"].invoke
end

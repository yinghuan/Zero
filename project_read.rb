require 'xcodeproj'

project_path = File.join(File.dirname(__FILE__), "NewsMaster.xcodeproj")
project = Xcodeproj::Project.open(project_path)
project.targets.each do |target|
    if target.name == 'NewsMaster' || target.name == "NewsMasterJP"
        target.source_build_phase.files.each do |source_file|
            puts source_file.display_name
        end
        puts "---------------"
    end
end
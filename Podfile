# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

project 'Zero.xcodeproj'

target 'Zero' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  pod 'FMDB'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
    	if target.name == 'FMDB'
        target.source_build_phase.files.each do |source_file|
          if source_file.display_name == 'FMDB-dummy.m'
            target.source_build_phase.remove_build_file(source_file)
          end
        end
    		copy_headers_phases = target.new_copy_files_build_phase("Copy Headers")
            copy_headers_phases.symbol_dst_subfolder_spec = :products_directory
    		target.headers_build_phase.files.each do |header_file|
    			copy_headers_phases.add_file_reference(header_file.file_ref, true)
    		end
    		make_module_phase = target.new_shell_script_build_phase("Make Fake Module")
    		make_module_phase.shell_script = "../make_framework.sh"
    	end
    end
end

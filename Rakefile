
task :default => :selftest

task :selftest do
  exec('bin/ecto selftest')
end

# Run ecto seltest.
#
# Install/Uninstall ecto task.
task :install => :create_ecto_symlink do
  puts 'Installed ecto.'
end

task :create_ecto_symlink do
  ecto = File.dirname(__FILE__) + '/bin/ecto'
  File.symlink(ecto, '/usr/bin/ecto')
end

task :uninstall => :remove_ecto_symlink do
  puts 'Uninstalled ecto.'
end 

task :remove_ecto_symlink do
  if File.symlink? '/usr/bin/ecto'
    File.delete '/usr/bin/ecto'
  end
end

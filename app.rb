require("bundler/setup")
 Bundler.require(:default)
 Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
 also_reload("lib/**/*.rb")

 #used bundler to require all of our gems for us rather than listing them individually in each file
 #used Dir class as a file loading shortcut to navigate to the directories with files that need to be required
 #__FILE__ refers to current file and File.dirname(__FILE__) will give current directory

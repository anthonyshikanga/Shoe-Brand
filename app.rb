require("bundler/setup")
 Bundler.require(:default)
 also_reload("lib/**/*.rb")

 #used bundler to require all of our gems for us rather than listing them individually in each file

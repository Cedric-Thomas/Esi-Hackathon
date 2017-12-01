def dirlist()
	web_page = ""
	act_dir = Dir.pwd
	var = Dir["#{act_dir}/public/*"]
	var.each do 
   	|elem|
   	if File.directory?("#{elem}") == true
      	elem.slice! "#{act_dir}/public/"
      	link = %Q[<a href="/#{elem}/">[FOLDER]--#{elem}</a></br>]
   	else
      	elem.slice! "#{act_dir}/public/"
      	link = %Q[<a href="/#{elem}">#{elem}<a></br>]
   	end
   	web_page += link + "\n"
	end
return web_page
end
puts dirlist()

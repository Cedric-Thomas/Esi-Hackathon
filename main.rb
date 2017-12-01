require 'sinatra'

set :environment, :production

#-------------------------------------------------------------------------------
def dirlist()
	web_page =<<END
<!DOCTYPE html>
<html>
    <head>
        <style>
        body {
            background-color: black;
            font-family: Sans-Serif;
            text-align: left;
        }
        a {
            color: white;        
            font-size: 14pt;
        }
        a:link {
            color: white;
            text-decoration: none;
        }
        a:visited {
            color: white;
            text-decoration: none;
        }
        a:hover {
            color: red;
            text-decoration: underline;
        }
        a:active {
            text-decoration: underline;
        }
        </style>
    </head>
    <body>
        <hr align="left" width="50%" height="4px" color="white" background-color="white">
END
	act_dir = Dir.pwd
	var = Dir["#{act_dir}/public/*"]
	var.each do 
   	|elem|
   	if File.directory?("#{elem}") == true
      	elem.slice! "#{act_dir}/public/"
      	link = %Q[      <a href="/#{elem}/">[FOLDER]--#{elem}</a></br>]
   	else
      	elem.slice! "#{act_dir}/public/"
      	link = %Q[      <a href="/#{elem}">#{elem}</a></br>]
   	end
   	web_page += link + "\n"
	end
    web_page += %Q[       <hr align="left" width="50%" height="4px" color="white" background-color="white">\n   </body>\n</html>]
return web_page
end
#-------------------------------------------------------------------------------

get '/' do
    erb :index
end

get '/form' do
    erb :form
end

get '/dir' do
        dirlist()
end

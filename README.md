Sinatra Event App
Welcome to Sinatra Event App! 



Installation, Usage & Development
Clone this repository to your computer and run the following commands in your terminal:

<p>1.bundle install</p>
<p>2. run rake db:migrate and rake db:seed</p>
<p>3.shotgun</p>
<p>4.Then navigate to localhost:9393 in your browser to see it in action.</p>
<p>5.If You Encounter Issue with Session Secret you can change this in <p>
<code>
Application Controller :<br>
set :session_secret, ENV.fetch('SESSION_SECRET')
</code>

put mp4 file in public/images/mp4 <br>
change name of file in app/views/index.html.erb to add your own mp4 file in welcome page <br>
<code>
source src="/images/mp4/Mt_Baker.mp4" type="video/mp4"
</code>



Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/bojosteph/sinatra-event-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License
The program is available as open source under the terms of the MIT License.

Code of Conduct
Everyone interacting in the Sinatra Event App project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
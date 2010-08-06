Typedeploy
=======

Manage and deploy your Typekit kits from the comfort of your own project.

    cd ~/Project

    vi Gemfile
    # Add gem "typedeploy"

    bundle install

    vi Rakefile
    # Add
    # import 'tasks/typedeploy'
    # Typedeploy::Config.api_token = 'secrettypekittoken'
    # Typedeploy::Config.directory = File.dirname(__FILE__)

    rake typekit:init

    vi kits/example.yml
    # edit as desired, be sure to change the default domain list

    rake typekit:create
    rake typekit:update

Then to use your example kit, do something like this

    <script type="text/javascript" src="http://use.typekit.com/<%= Typedeploy::Config.kits['example'] %>.js"></script>
    <script type="text/javascript">try{Typekit.load({});}catch(e){}</script>

Handling new versions
---------------------

Say you decide that you want to redesign your site but you don't want to break
your existing site. Easy. Just make your changes to kits/*.yml and

    rake typekit:create
    rake typekit:update

Brand new kits have been created for you to develop with and ultimately
publish, that way when you deploy you know that your kits are exactly as you
expect.

Notes
-----
Be sure to check in your kits.yml and kits/*.yml files as they are now vital to
the proper functioning of your project.

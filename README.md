# WikiMed
The goal of WikiMed is to create an open-source platform that allows people to get pricing estimates for different procedures at different facilities 
(hospitals, clinics, doctor's office, ect.). These pricing estimates are collected through others voluntarily entering their billing information in
the database. 

## Set-Up in Terminal
Install Rails 
    sudo gem install rails
Install Gems
    bundle install
Migrate the Database
    rake db:migrate

### Trouble Shooing
If this error is displayed:
> Environment data not found in the schema.
enter this in the terminal
`bin/rails db:environment:set RAILS_ENV=development`
`rake db:reset`

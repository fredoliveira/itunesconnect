# Autoingestion

This is a ruby port of Apple's own java-based Autoingest tool, that downloads app sales reports from iTunes Connect. It is a slightly more ruby-friendly fork of wjlafrance's take on the app. 

# Grabbing daily reports

In order to grab daily reports from the day before, configure your account by creating `config.yml` and running `bin/autoingestion`. Output will be saved in the `output` directory. Processing the output is up to you.

You can automate this process by adding this to your favorite version of cron.

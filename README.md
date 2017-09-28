# README

A simple chatbot for facebook messenger, uses api.ai natural language processing.
This is just a sandbox created to play around with api.ai and messenger APIs, certainly not intended for any serious use.

### Installation and setup

1. Install required services (see configuration section)
2. If You want to run this locally, use a service like https://ngrok.com/ to redirect traffic
3. Create developer account on https://developers.facebook.com and follow steps 1-4 described here: https://developers.facebook.com/docs/messenger-platform/getting-started/quick-start
  Instead of `/webhook`, endpoint for this bot is `/bot`
4. Create account on https://api.ai, create new agent and import file `ruby-chatbot-agent.zip`.
5. Create `config/application.yml` and paste Your tokens and keys from facebook and api.ai into it (template is in `config/application.yml.example`). Remember not to share this file in Your public repos. 
Detailed overview of required environment variables can be found at: https://github.com/jgorset/facebook-messenger#configuration
6. Create the database `$ rails db:create` and then `$ rails db:migrate`

### Starting server

Use `run-dev-server.sh` to start the server.
`Ctrl+C` to stop server

### Configuration

* Ruby version: 2.3.3
* Rails 5.1.4
* Sidekiq 5.0.4
* Redis server 3.2.9

Created and tested on macOS Sierra, config and installation steps should be identical for most linux distributions.

### License

The MIT License (MIT)

Copyright (c) 2017 Krzysztof Kowalczyk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

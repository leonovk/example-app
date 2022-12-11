# example-app
## Инструкция по разворачиванию приложений на Синатре

### Локально:

- `git clone https://github.com/leonovk/example-app.git`
- `cd example-app`
- `bundle install`
- `bundle exec puma`

### На сервере Ubuntu 22.04 + NginX:

(для начала создайте юзера и залогиньтесь в него)
(для примера будет юзер deploy)

- `sudo apt update`
- `sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev`
- `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash`
- `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
- `echo 'eval "$(rbenv init -)"' >> ~/.bashrc`
- `source ~/.bashrc`
- `rbenv install 3.1.2`
- `rbenv global 3.1.2`
- `echo "gem: --no-document" > ~/.gemrc`
- `gem install bundler`
- `sudo apt install nginx`
- `sudo nano /etc/nginx/sites-enabled/default`

```
upstream sinatra {
server 0.0.0.0:3000;
}

server {
listen 80;
root /home/deploy/example-app/public;
server_name localhost;

location / {
try_files $uri $uri/index.html @puma;
}

location @puma {
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header Host $http_host;
proxy_redirect off;
proxy_pass http://sinatra;
}

}
```

- `sudo service nginx restart`

(Если нет ошибок все ок, если есть, земля пухом)

- `git clone https://github.com/leonovk/example-app.git`
- `cd example-app`
-  Переименуйте файл '.env.example' в '.env'
- `bundle install`
- `bundle exec puma`
# example-app
## Рыба для приложений на Sinatra

- Предварительно установит ruby
- `bundle install`
- запуск пумы `puma -t 8:32 -w 3`
- Удалить все процессы пумы можно `killall puma`

## NginX

`
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
`
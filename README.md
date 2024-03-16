# README

This is a dummy Rails 7 project created as a bad example of code to be refactored.

bundle install

yarn install

bundle exec rails db:create db:migrate db:seed

# Preparar banco de testes
bundle exec rails db:migrate RAILS_ENV=test

# Exeutar testes
bundle exec rspec

# Levantar servidor
bin/dev

# Usuário de acesso:
# admin@admin.com
# 111111

git remote add org git@github.com:tiagogeraldi/association.git

# reinstalar org se necessario
git remote remove org
git remote add org https://github.com/tiagogeraldi/association.git
git pull org main --rebase

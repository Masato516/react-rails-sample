FROM ruby:2.7

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       postgresql-client \
                       vim \
                       yarn \
    && rm -rf /var/lib/apt/lists/*

# RUN mkdir /todo_app
ENV APP_ROOT /todo_app
WORKDIR $APP_ROOT

#ホスト側からDocker側にGemfileをコピー
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
COPY . $APP_ROOT

# コンテナ起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]
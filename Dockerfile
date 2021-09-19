FROM ruby:3.0.2

WORKDIR /site
COPY Gemfile* .
RUN bundle
COPY ./ .

ENTRYPOINT [ "jekyll" ]
CMD [ "serve", "-H", "0.0.0.0" ]

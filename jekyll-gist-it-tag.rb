module Jekyll
  class GistItTag < Liquid::Tag
    
    def initialize(tag_name, url, tokens)
      super
      
      @url = url
      
      /https:\/\/github.com\/(.+?)\/(.+?)\/blob\/(.+?)\/(.*\.[a-zA-Z]+)/ =~ @url
      
      @user = $1
      @repo = $2
      @branch = $3
      @file = $4
    end
    
    def render(context)
      "<script async=\"async\" src=\"http://gist-it.appspot.com/github/#{@user}/#{@repo}/raw/#{@branch}/#{@file}\"></script>"
    end
  end
end

Liquid::Template.register_tag('gist-it', Jekyll::GistItTag)
module Jekyll
  class ImageTag < Liquid::Tag

    def initialize(tag_name, config, tokens)
      super
      @url, @caption = config.split(nil, 2)
    end

    def render(context)
      <<-EOF
      <div class="image_with_caption">
      <img src="#{@url}"/>
      <p>#{@caption}</p>
      </div>
      EOF
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)
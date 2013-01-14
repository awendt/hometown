module Jekyll
  class Image < Liquid::Block

    ALLOWED_ATTRS = %w(license author original source size caption)

    def initialize(name, params, tokens)
      @config = {}
      super
    end

    def unknown_tag(name, params, tokens)
      if ALLOWED_ATTRS.include?(name)
        @config[name.to_sym] = params
      else
        super
      end
    end

    def render(context)
      <<-EOS
      <div class="image_with_caption">
      <img src="#{@config[:source]}" width="#{@config[:size].split('x').first}" height="#{@config[:size].split('x').last}" />
      <p class="caption">#{@config[:caption]}</p>
      #{attribution}
      </div>
      EOS
    end

    def attribution; end
  end

  class CCImage < Image
    def attribution
      <<-EOS
      <p class="attribution">
        <a href="#{@config[:original]}">#{@config[:author].strip}, CC-#{(@config[:license] || 'by-sa').upcase}</a>
      </p>
      EOS
    end
  end
end

Liquid::Template.register_tag('ccimage', Jekyll::CCImage)
Liquid::Template.register_tag('image', Jekyll::Image)
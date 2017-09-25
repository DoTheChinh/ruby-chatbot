class GifFinder
  SOURCE_API_LINK = 'http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC'.freeze
  DIG_KEYS = %i[data image_url].freeze

  def initialize search_tag='animals'
    @search_tag = search_tag
  end

  def gif_by_tag
    gif_data = HTTP.get(gif_url).parse
    gif_data.deep_symbolize_keys.dig(*DIG_KEYS)
  end

  private

  def gif_url
    "#{SOURCE_API_LINK}&tag=#{@search_tag}"
  end
end

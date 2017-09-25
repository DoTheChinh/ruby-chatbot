class GifFinder
  SOURCE_API_LINK = 'http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC'.freeze
  DIG_KEYS = %i[data image_url].freeze

  def self.gif_url search_tag='animals'
    HTTP.get("#{SOURCE_API_LINK}&tag=#{search_tag}").parse.deep_symbolize_keys.dig(*DIG_KEYS)
  end
end

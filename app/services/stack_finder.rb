class StackFinder
  SEARCH_URL_PREFIX = 'https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle='.freeze
  SEARCH_URL_SUFIX = '&site=stackoverflow'.freeze
  WORDS_TO_REMOVE = %w{how to can does}.freeze

  ANSWER_UR_PREFIX = 'https://api.stackexchange.com/2.2/answers/'.freeze
  ANSWER_URL_SUFIX = '?pagesize=100&order=desc&sort=activity&site=stackoverflow&filter=!b0OfNR*gkS.97-'.freeze

  def initialize question
    @question = question
    @query = prepare_query
  end

  def answer
    return @answer if @answer.present?

    search_results.take_while do |result|
      if result.dig('accepted_answer_id') && !result.dig('closed_date')
        @answer_id = result.dig('accepted_answer_id')
      end
    end
    @answer = parse_answer
  end

  private

  attr_reader :question

  def prepare_query
    split_question = question.chomp('?').split(' ')
    filtered_query = split_question - WORDS_TO_REMOVE
    filtered_query.join('%20')
  end

  def search_results
    @search_results ||= parsed_get_request(search_url).dig('items')
  end

  #TODO: Parse markdown to plain text, gem: https://github.com/vmg/redcarpet
  def parse_answer
    answer = parsed_get_request(answer_url).dig('items').first
    {
      title: answer.dig('title'),
      body: answer.dig('body_markdown'),
      link: answer.dig('link')
    }
  end

  def parsed_get_request url
    HTTP.use(:auto_inflate).headers('Accept-Encoding' => 'gzip').get(url).parse
  end

  def search_url
    SEARCH_URL_PREFIX + @query + SEARCH_URL_SUFIX
  end

  def answer_url
    ANSWER_UR_PREFIX + @answer_id.to_s + ANSWER_URL_SUFIX
  end
end

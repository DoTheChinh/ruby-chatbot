class StackFinder
  SEARCH_URL_PREFIX = 'https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle='
  SEARCH_URL_SUFIX = '&site=stackoverflow'
  WORDS_TO_REMOVE = %w{how to can does}

  ANSWER_UR_PREFIX = 'https://api.stackexchange.com/2.2/answers/'
  ANSWER_URL_SUFIX = '?order=desc&sort=activity&site=stackoverflow&filter=!-*f(6sFKmjY2'

  attr_reader :answer

  def initialize question
    split_question = question.chomp('?').split(' ')
    filtered_query = split_question - WORDS_TO_REMOVE
    @query = filtered_query.join('%20')
  end

  def find_answer
    search_results.any? do |result|
      !closed?(result) && @answer_id = accepted_answer(result)
    end
    @answer = parse_answer if @answer_id.present?
  end

  private

  def search_url
    SEARCH_URL_PREFIX + @query + SEARCH_URL_SUFIX
  end

  def answer_url
    ANSWER_UR_PREFIX + @answer_id.to_s + ANSWER_URL_SUFIX
  end

  def search_results
    @search_results ||= parsed_get_request(search_url).parse.dig('items')
  end

  def closed? result_item
    result_item.dig('closed_date')
  end

  def accepted_answer result_item
    result_item.dig('accepted_answer_id')
  end

  #TODO: Parse markdown to plain text, gem: https://github.com/vmg/redcarpet
  def parse_answer
    answer = parsed_get_request(answer_url).parse.dig('items').first
    {
      title: answer.dig('title'),
      body: answer.dig('body_markdown')
    }
  end

  def parsed_get_request url
    HTTP.use(:auto_inflate).headers('Accept-Encoding' => 'gzip').get(url)
  end
end

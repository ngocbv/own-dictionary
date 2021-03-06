class WordsApiService
  def initialize
    @dictionary = Dictionary.find_by(name: 'Words API')
    @language = 'en'
  end

  def search(keyword)
    keyword = keyword.strip.downcase
    response = HTTParty.get "https://www.wordsapi.com/mashape/words/#{keyword}?when=2017-11-23T13:20:45.519Z&encrypted=8cfdb28de723929be89207beec58bcb9aeb4280935fe9eb8"

    if response.code == 200
      # Create word
      word = Word.find_by(name: keyword)
      puts word.errors.messages unless word.valid?

      results = response['results']
      results.each do |result|
        # Get meaning
        meaning = Meaning.find_or_create_by(word: word, dictionary: @dictionary, definition: result['definition'])

        # Get example
        examples = result['examples'] || []
        examples.each do |example|
          ex = Example.find_or_create_by(meaning: meaning, content: example)
          puts ex.errors.messages unless ex.valid?
        end

        # Get synonyms
        synonym = Synonym.find_by word: word, meaning: meaning
        if synonym
          content = synonym.content
          content << result['synonyms']
          content.flatten.compact.uniq
          synonym.update content: content
        elsif result['synonyms'].present?
          syn = Synonym.find_or_create_by word: word, meaning: meaning, content: result['synonyms']
          puts syn.errors.messages unless syn.valid?
        end

        # Get antonyms
        antonym = Antonym.find_by word: word, meaning: meaning
        if antonym
          content = antonym.content
          content << result['antonyms']
          content.flatten.uniq
          antonym.update content: content
        elsif result['synonyms'].present?
          anto = Antonym.find_or_create_by word: word, meaning: meaning, content: result['antonyms']
          puts anto.errors.messages unless anto.valid?
        end
      end

      # Get pronunciation
      pronunciation = response['pronunciation']
      if pronunciation.present? && pronunciation['all'].present?
        pron = Pronunciation.find_by word: word
        Pronunciation.create word: word, phonetic_spelling: pronunciation['all'] unless pron
      end
    else
      p "Not found"
    end
  end
end

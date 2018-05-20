class OxfordDictionariesService
  def initialize
    @headers = {
      app_id: ENV['OXFORD_APP_ID'],
      app_key: ENV['OXFORD_APP_KEY']
    }
    @dictionary = Dictionary.find_by(name: 'Oxford Dictionaries')
  end

  def search(keyword)
    keyword = keyword.strip.downcase
    response = HTTParty.get("https://od-api.oxforddictionaries.com/api/v1/entries/en/#{keyword}",
      headers: @headers)

    if response.code == 200
      result = response['results'][0]
      language = result['language']

      # Create word
      word = Word.find_by(name: keyword)
      puts word.errors.messages unless word.valid?

      lexicalEntry = result['lexicalEntries'][0]
      lexicalEntry['entries'].each do |entry|
        entry['senses'].each do |sense|
          # Get meaning
          meaning = Meaning.find_or_create_by(word: word, dictionary: @dictionary, definition: (sense['definitions'] || []).join(' | '))

          # Get example
          examples = sense['examples'] || []
          examples.each do |example|
            ex = Example.find_or_create_by(meaning: meaning, content: example['text'])
            puts ex.errors.messages unless ex.valid?
          end
        end
      end

      # Get pronunciation
      entr = lexicalEntry['entries'][0]
      pronunciation = entr.has_key?('pronunciations') ? entr['pronunciations'][0] : ''
      Pronunciation.find_or_create_by(word: word, audio_link: pronunciation['audioFile'],
        dialects: pronunciation['dialects'], phonetic_notation: pronunciation['phoneticNotation'],
        phonetic_spelling: pronunciation['phoneticSpelling'])
    else
      p "Not found"
    end
  end
end

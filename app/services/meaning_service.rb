class MeaningService
  def self.from_google(vocabulary)
    mean_arr = []
    begin
      url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=vi&dt=t&q=" + URI::encode(vocabulary)
      response = Faraday.get url
      body = response.body.force_encoding('UTF-8')

      if body.present?
        data = JSON.parse body
        if data[0].present? && data[0][0].present? && data[0][0][0].present?
          mean_arr.push(data[0][0][0])
        end
      end
    rescue Exception => e
      puts "NokogiriGetMeans.from_google ERROR: #{e}"
    end

    return mean_arr.uniq
  end

  def self.from_vi2en(vocabulary)
    mean_arr = []

    begin
      url = "https://vi2en.com/vi/en/vi/" + URI::encode(vocabulary)
      response = Faraday.get url
      html = response.body.force_encoding('UTF-8')

      data  = Nokogiri::HTML(html)
      mean_case_1 = data.css("div.row").css("div.col-md-9").css("h2")[0]
      if mean_case_1.present? && mean_case_1.text.present?
        mean_split = mean_case_1.text.split("–")
        if mean_split.length == 2
          mean_arr.push(mean_split[0].gsub(/\u00a0/,""))
        end
      end

      mean_case_2 = data.css("div.row").css("div.col-md-9").css("p")[0]
      if mean_case_2.present? && mean_case_2.text.present?
        mean_arr.push(mean_case_2.text)
      end

      data.css("dl.dl-horizontal dt a").map do |node|
        mean_arr.push(node.text)
      end
    rescue Exception => e
      puts "NokogiriGetMeans.from_vi2en ERROR: #{e}"
    end

    return mean_arr.uniq
  end

  def self.remove_multi_comment(str)
    str_removed = str.dup
    while str_removed.gsub!(/\([^()]*\)/,""); end
    return str_removed
  end

  def self.from_vdict(vocabulary)
    mean_arr = []
    mean_arr_all = []
    mean_arr_except = []
    begin
      url = "https://vdict.com/#{URI::encode(vocabulary)},1,0,0.html"
      response = Faraday.get url
      html = response.body.force_encoding('UTF-8')

      data  = Nokogiri::HTML(html)

      data.css("ul.list1").css("li").css("b").map do |node|
        mean_arr_all.push(node.text)
      end

      data.css("ul.list1").css(".list2").css("li").css("b").map do |node|
        mean_arr_except.push(node.text)
      end

      mean_arr_temp =  mean_arr_all - mean_arr_except
      #remove commment
      mean_arr_temp.each_with_index do |item, index|
        str_remove = remove_multi_comment(item)
        mean_arr_temp[index] = str_remove.gsub(/;/,",")
      end

      #split word
      mean_arr_split = []
      mean_arr_temp.each_with_index do |item, index|
        arr_temp = item.split(",").reject { |s| s.empty? }
        mean_arr_split.concat(arr_temp)
      end

      #strip word
      mean_arr_split.each_with_index do |item, index|
        item_strip = item.split.join(" ")
        mean_arr_split[index] = item_strip
      end

      mean_arr = mean_arr_split.uniq
    rescue Exception => e
      puts "NokogiriGetMeans.from_vdict ERROR: #{e}"
    end

    return mean_arr
  end

  def self.update_mean_from_internet(vocabulary)
    mean_arr = []
    mean_arr.concat(from_google(vocabulary))
    mean_arr.concat(from_vi2en(vocabulary))
    mean_arr.concat(from_vdict(vocabulary))

    return mean_arr.uniq
  end
end

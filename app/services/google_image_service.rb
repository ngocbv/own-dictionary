class GoogleImageService
  def self.get_img_src(keyword)
    img_arr = []

    begin
      # urls = ["https://www.google.com/search?q=#{keyword}&source=lnms&tbm=isch", "https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=0&tbs=iar:s", "https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=20&tbs=iar:s", "https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=40&tbs=iar:s","https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=60&tbs=iar:s","https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=80&tbs=iar:s","https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=100&tbs=iar:s", "https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=120&tbs=iar:s", "https://www.google.com.vn/search?q=#{keyword}&tbm=isch&start=140&tbs=iar:s"]
      urls = ["https://www.google.com/search?q=#{keyword}&source=lnms&tbm=isch"]
      urls.each  do |item|
        response = Faraday.get item
        html = response.body.force_encoding('UTF-8')

        data  = Nokogiri::HTML(html)
        data.css("img").each do |node|
          image_link = node.attr("src")
          begin
            uri = URI.parse(image_link)
            if (uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)) && uri.host.present?
              img_arr.push(image_link)
            end
          rescue URI::InvalidURIError
          end
        end
      end
    rescue Exception => e
      puts "GoogleSearchImage.get_img_src ERROR: #{e}"
    end

    return img_arr
  end

  def self.download_file(url)
    begin
      file_name = SecureRandom.uuid + ".jpeg"
      path_download = File.join(Rails.root,"public", "download")
      FileUtils::mkdir_p path_download

      path_temp = File.join(path_download, file_name)

      if !File.file?(path_temp)
        download = open(url)
        IO.copy_stream(download, path_temp)
        return {"path_temp" => path_temp, "file_name" => file_name}
      end
    rescue Exception => e
      puts "GoogleSearchImage.download_file ERROR: #{e}"
      return ""
    end
    return ""
  end
end

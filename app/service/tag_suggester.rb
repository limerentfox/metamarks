# TextAnalzyer is a text analyzer tool that finds out words that are
# characteristic for a given input file. It is independent from any
# language, and even seems to work well with HTML files.
#
# Author:: Martin Ankerl (mailto:martin.ankerl@gmail.com)
# Copyright:: Copyright (c) 2006, 2007 Martin Ankerl
# Date:: 2007-02-25
# License:: public domain
#
# Homepage:: http://martin.ankerl.com/2007/01/09/textanalyzer-automatically-extract-characteristic-words/

class TagSuggester
  def initialize(url)
    @url = url
    @keywords = get_keywords
  end

  def to_s
    @keywords.join(', ')
  end

  def get_keywords
    text_to_parse = Nokogiri::HTML(open(@url, :allow_redirections => :all)).css('h1, h2, h3, h4, h5, h6, p, span').inner_text.gsub!(/[^A-Za-z]/, ' ')
    keywords = compareIndex(text_to_parse)
    if keywords.nil?
      keywords = [""]
    else
      keywords
    end
  end

  def msg2count(msg)
    if msg #only if there is an input
      words = msg.split(' ')
      words.each_with_object(parole ||= {}) do |w|
        w.downcase!
        parole[w] ? parole[w] += 1 : parole[w] = 1
      end
    end
    parole
  end

  def compareIndex(msg)
    if msg
      allCount = nil
      File.open("#{Rails.root}/app/service/.wordcount", "r") do |f|
        allCount = Marshal.load(f.read)
      end

      allWords = 0
      allCount.each do |key, val|
        allWords += val
      end

      while true
        count = nil
        count = msg2count(msg)
        result = Array.new
        count.each do |key, val|
          result.push [key, val, allCount[key], 0]
        end

        # get total word count
        currWords = 0
        result.each do |key, val, all|
          currWords += val
        end

        # calculate score
        result.each do |r|
          r[3] = score(1.0*r[1], 1.0*currWords, 1.0*r[2], 1.0*allWords)
        end
        result.sort! do |a, b|
          a[3] <=> b[3]
        end
        result.reverse!
        count = 20
        result.each do |key, val, allVal|
          count -= 1
          break if count == 0
          lastVal = val
        end
        r = result[0..4]
        a = r.map do |a|
          a[0]
        end
        return a
      end
    end
  end

  def score(curVal, curWords, allVal, allWords)
    Math.tanh(curVal/curWords*200) - 5*Math.tanh((allVal-curVal)/(allWords-curWords)*200)
  end
end

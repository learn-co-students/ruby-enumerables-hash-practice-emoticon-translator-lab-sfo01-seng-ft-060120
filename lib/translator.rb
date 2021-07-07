require 'pry'
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  result = {}
 
 emoticons.each do |key, value|
   result[key] = {}
   result[key][:english] = value[0]
   result[key][:japanese] = value[1]
# binding.pry
  end
  result
end


def get_japanese_emoticon(file_path, emoticons)
    emoticon_hash = load_library(file_path)
    
    test = emoticon_hash.keys.find do |key|
    emoticon_hash[key][:english] == emoticons
    # binding.pry
  end
  if test
    return emoticon_hash[test][:japanese]
  else 
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticons)
  emoticon_hash = load_library(file_path)
  
  test = emoticon_hash.keys.find do |key|
    emoticon_hash[key][:japanese] == emoticons
  end
  if test 
    return test
  else 
    "Sorry, that emoticon was not found"
  end
  # binding.pry
end



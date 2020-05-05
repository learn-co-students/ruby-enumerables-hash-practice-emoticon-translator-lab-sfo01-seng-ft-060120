# require modules here
require "yaml"
require 'pry'

def load_library(path)
    emoticon_lib = YAML.load_file(path)
  emoticon_lib
  
  emoticon_lib_2 = {}
  emoticon_lib.map do |key, value|
    emoticon_lib_2[key] = {:english => value[0], :japanese => value[1]}
  end
  emoticon_lib_2
end

def get_japanese_emoticon(path, emoticon)
  emoticon_lib = load_library(path)
  emoticon_lib.each do |key, value|
    if emoticon_lib[key][:english] == emoticon
      return emoticon_lib[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  emoticon_lib = load_library(path)
  emoticon_lib.each do |key, value|
    if emoticon_lib[key][:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end
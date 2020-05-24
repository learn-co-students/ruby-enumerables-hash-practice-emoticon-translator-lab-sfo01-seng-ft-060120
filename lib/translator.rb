# require modules here
require "yaml"
require 'pry' 


def load_library(yaml_file)
  response = {} 
  
  # {"get_meaning" => {}, "get_emoticon" => {}}
  library = YAML.load_file(yaml_file)
  library.each do |trans, emos| 
    response[trans] = {} 
    response[trans][:english] = emos[0]
    response[trans][:japanese] = emos[1]
  end
  response
end 

def get_japanese_emoticon(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
  response = library.keys.find do |key|
    library[key][:english] == emoticon 
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return library[response][:japanese]
  end
end


def get_english_meaning(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
  response = library.keys.find do |key|
    library[key][:japanese] == emoticon 
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end
#Anotomy of Analyzers
    Character filter
    Tokenizers
    Token Filters

    #Character Filters
        receives the orignal text as streams of characters and Filters the contents
    #tokenizers
        stream of characters to individual tokens , "You are good!" to [you, are ,good!]
        also responsible of ordering, postions, start, end and offsets
    #token Filters
        lowercase token filters - converts all to lower case
        stop word filters - removes all stop words

#Analyzers
    Standard Analyzers - divide text into word boundaries, removes punctualtions
    Simple Analyzers - lowercase all term and looks for letters
    Whitespace Analyzers - looks for white space
    Stop Analyzers - stop words analyzers
    keyword Analyzers - looks for the keywords
    pattern Analyzers - regular expressions
    language Analyzers - for language analysis
    Fingerprint Analyzers - for duplicate detection
    Custom Analyzers - allows to create analyzers combining the above analyzers

PUT my_index
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_english_analyzer": {
          "type": "standard",
          "max_token_length": 5,
          "stopwords": "_english_"
        }
      }
    }
  }
}

POST my_index/_analyze
{
  "analyzer": "my_english_analyzer",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}
#[ 2, quick, brown, foxes, jumpe, d, over, lazy, dog's, bone ]
#removed 'the'
#lowercase everything

POST my_index/_analyze
{
  "analyzer": "simple",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}
#[ the, quick, brown, foxes, jumped, over, the, lazy, dog, s, bone ]
#keeps everything but removes puntuations
#lowercase everything

POST my_index/_analyze
{
  "analyzer": "whitespace",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}
#[ The, 2, QUICK, Brown-Foxes, jumped, over, the, lazy, dog's, bone. ]
#as it is


POST my_index/_analyze
{
  "analyzer": "stop",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}
#[ quick, brown, foxes, jumped, over, lazy, dog, s, bone ]
#removes stop words
#lower cased

PUT my_index
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_stop_analyzer": {
          "type": "stop",
          "stopwords": ["the", "over"]
        }
      }
    }
  }
}
#configure the list of stop words

POST my_index/_analyze
{
  "analyzer": "keyword",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}
#[ The 2 QUICK Brown-Foxes jumped over the lazy dog's bone. ]
#keeps completele text

PUT my_index
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_email_analyzer": {
          "type":      "pattern",
          "pattern":   "\\W|_", 
          "lowercase": true
        }
      }
    }
  }
}

POST my_index/_analyze
{
  "analyzer": "pattern",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}

#Normalizers
#Tokenizers
POST _analyze
{
  "tokenizer": "standard",
  "text": "The 2 QUICK Brown-Foxes jumped over the lazy dog's bone."
}
#[ The, 2, QUICK, Brown, Foxes, jumped, over, the, lazy, dog's, bone ]

#Char Filters
PUT my_index
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_analyzer": {
          "tokenizer": "keyword",
          "char_filter": ["my_char_filter"]
        }
      },
      "char_filter": {
        "my_char_filter": {
          "type": "html_strip",
          "escaped_tags": ["b"]
        }
      }
    }
  }
}
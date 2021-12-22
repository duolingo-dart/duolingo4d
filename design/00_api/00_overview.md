# Duolingo API

| Name            | URL                                                         | Query Parameter                                        | Body                             | Required Auth |
| --------------- | ----------------------------------------------------------- | ------------------------------------------------------ | -------------------------------- | ------------- |
| Manifest        | <https://www.duolingo.com/manifest.json>                    | -                                                      | -                                | NO            |
| Version Info    | <https://www.duolingo.com/api/1/version_info>               | -                                                      | -                                | NO            |
| Login           | <https://www.duolingo.com/login>                            | ?login={username or email}&password={password}         | -                                | NO            |
| Users           | <https://www.duolingo.com/2017-06-30/users>                 | /{userid}                                              | -                                | YES           |
| Overview        | <https://www.duolingo.com/vocabulary/overview>              | -                                                      | -                                | YES           |
| Hints           | <https://d2.duolingo.com/words/hints>                       | /{learningLanguage}/{formLanguage}?sentence={sentence} | -                                | YES           |
| Switch Language | <https://www.duolingo.com/switch_language>                  | -                                                      | from_language, learning_language | YES           |
| Leaderboard     | <https://www.duolingo.com/friendships/leaderboard_activity> | -                                                      | -                                | YES           |
| Dictionary      | <https://www.duolingo.com/api/1/dictionary_page>            | ?lexeme_id={lexemeId}                                  | -                                | YES           |
| Friends         | <https://www.duolingo.com/2017-06-30/users>                 | /{userId}/subscriptions                                | -                                | YES           |

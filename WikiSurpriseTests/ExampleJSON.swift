//
//  ExampleJSON.swift
//  WikiSurpriseTests
//
//  Created by koala panda on 2024/08/11.
//
@testable import WikiSurprise

extension Article {
    static var exampleJSON: String {
        return """
              {
                  "id": 2633600,
                  "ns": 0,
                  "title": "ビナシン"
                }
        """
    }
}

extension Query {
    static var exampleJSON: String {
        return """
            {
            "random": [
              {
                "id": 3216088,
                "ns": 0,
                "title": "ATMOS 2000"
              },
              {
                "id": 3934847,
                "ns": 0,
                "title": "土浦市立山ノ荘小学校"
              },
              {
                "id": 1435651,
                "ns": 0,
                "title": "戦略情報局"
              },
              {
                "id": 423890,
                "ns": 0,
                "title": "牙神幻十郎"
              },
              {
                "id": 3574625,
                "ns": 0,
                "title": "阿部浩士"
              },
              {
                "id": 1195842,
                "ns": 0,
                "title": "網走信用組合"
              },
              {
                "id": 1500600,
                "ns": 0,
                "title": "オスカー・ララウリ"
              },
              {
                "id": 4890228,
                "ns": 0,
                "title": "ビェルスコ＝ビャワ - チェシン線"
              },
              {
                "id": 3836315,
                "ns": 0,
                "title": "1968年メキシコシティーオリンピックのケニア選手団"
              },
              {
                "id": 2244446,
                "ns": 0,
                "title": "大阪自然環境保全協会"
              }
            ]
          }
    """
    }
}

extension WikiResponse {
    static var exampleJSON: String {
        return """
        {
            "query": {
                "random": [
                    {
                        "id": 3216088,
                        "ns": 0,
                        "title": "ATMOS 2000"
                    },
                    {
                        "id": 3934847,
                        "ns": 0,
                        "title": "土浦市立山ノ荘小学校"
                    },
                    {
                        "id": 1435651,
                        "ns": 0,
                        "title": "戦略情報局"
                    },
                    {
                        "id": 423890,
                        "ns": 0,
                        "title": "牙神幻十郎"
                    },
                    {
                        "id": 3574625,
                        "ns": 0,
                        "title": "阿部浩士"
                    },
                    {
                        "id": 1195842,
                        "ns": 0,
                        "title": "網走信用組合"
                    },
                    {
                        "id": 1500600,
                        "ns": 0,
                        "title": "オスカー・ララウリ"
                    },
                    {
                        "id": 4890228,
                        "ns": 0,
                        "title": "ビェルスコ＝ビャワ - チェシン線"
                    },
                    {
                        "id": 3836315,
                        "ns": 0,
                        "title": "1968年メキシコシティーオリンピックのケニア選手団"
                    },
                    {
                        "id": 2244446,
                        "ns": 0,
                        "title": "大阪自然環境保全協会"
                    }
                ]
            }
        }
        """
    }
}

extension WikiAPIError {
    static var exampleJSON: String {
        return """
        {
            "code": "badvalue",
            "info": "Unrecognized value for parameter \\"action\\": .",
            "*": "See https://ja.wikipedia.org/w/api.php for API usage. Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/> for notice of API deprecations and breaking changes."
        }
        """
    }
}

Feature: Step then the response json contains
    Validates the functionality of the step 
    "the response json at <path> constains <value"

    Background: We use a response double from where the JSON payload is retrieved.
        Given a test response
            And the response contains a json body like
                """
                { 
                    "store": {
                        "book": [ 
                        { 
                            "category": "reference",
                            "author": "Nigel Rees",
                            "title": "Sayings of the Century",
                            "price": 8.95,
                            "edition": 2
                        },
                        { 
                            "category": "fiction",
                            "author": "Evelyn Waugh",
                            "title": "Sword of Honour",
                            "price": 12.99,
                            "edition": 6
                        },
                        { 
                            "category": "fiction",
                            "author": "Herman Melville",
                            "title": "Moby Dick",
                            "isbn": "0-553-21311-3",
                            "price": 8.99,
                            "edition": 5
                        },
                        { 
                            "category": "fiction",
                            "author": "J. R. R. Tolkien",
                            "title": "The Lord of the Rings",
                            "isbn": "0-395-19395-8",
                            "price": 22.99,
                            "edition": 1
                        }
                        ],
                        "bicycle": {
                        "color": "red",
                        "price": 19.95
                        }
                    }
                }
                """
    
    Scenario: The retrieved value with the specified value
        Then the response json at $.store.book[3].author contains "R. R"


    Scenario: Validates all values in a specified range
        Then the response json at $.store.book[1:4].category contains "ctio"


    Scenario: Variables can be used in json path
        Then the response json at ${TITLE_PATH} contains "of the"


    Scenario: Variables can be used in expected value
        Then the response json at $.store.book[1].category contains "${CATEGORY_FICTION}"


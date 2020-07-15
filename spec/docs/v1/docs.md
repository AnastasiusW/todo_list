

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request return all list of projects of current user
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "20",
                  "type": "project",
                  "attributes": {
                    "name": "repellendus",
                    "created_at": "2020-07-15T11:46:38.621Z",
                    "updated_at": "2020-07-15T11:46:38.621Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "34",
                        "type": "user"
                      }
                    }
                  }
                },
                {
                  "id": "21",
                  "type": "project",
                  "attributes": {
                    "name": "qui",
                    "created_at": "2020-07-15T11:46:38.643Z",
                    "updated_at": "2020-07-15T11:46:38.643Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "34",
                        "type": "user"
                      }
                    }
                  }
                },
                {
                  "id": "22",
                  "type": "project",
                  "attributes": {
                    "name": "doloribus",
                    "created_at": "2020-07-15T11:46:38.649Z",
                    "updated_at": "2020-07-15T11:46:38.649Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "34",
                        "type": "user"
                      }
                    }
                  }
                }
              ]
            }

###  [GET /api/v1/projects/{id}]

+ Parameters
    + id: `23` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/23?project[id]=23`

    + Headers

            Accept: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "23",
                "type": "project",
                "attributes": {
                  "name": "aliquid",
                  "created_at": "2020-07-15T11:46:38.748Z",
                  "updated_at": "2020-07-15T11:46:38.748Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "35",
                      "type": "user"
                    }
                  }
                }
              }
            }



# Group Authentication


## Authentication [/sign_in]


### Sign in user [POST /api/v1/sign_in]


+ Request sign in with success
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=warner_friesen&password=1ODLLmqQryo23a

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzc0LCJleHAiOjE1OTUzNDkwNTh9.eh5ls9aI5TJbwcmu7TFnHraU82MsyqqDe70R5eAvKHM"
            }

+ Request sign in with fail
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=invalid&password=invalid

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Invalid login"
            }

# Group Comments


## Comments [/projects/:id/tasks/:id/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `1333` (number, required)
    + task_id: `1156` (number, required)

+ Request show list of comments and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/1333/tasks/1156/comments?task_id=1156`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzc1LCJleHAiOjE1OTUzNDkwNTh9.5kLg9yAUQ22g6Z76bI2NOQxHtho8-EluMkHb_z-KnlU

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "354",
                  "type": "comment",
                  "attributes": {
                    "body": "Sed sed quia fuga doloremque et nihil minus. Autem est fugit sint consequatur in vero.",
                    "file": {
                      "url": "/test/uploads/comment/file/354/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/354/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-07-20T16:30:58.738Z",
                    "updated_at": "2020-07-20T16:30:58.738Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "1156",
                        "type": "task"
                      }
                    }
                  }
                },
                {
                  "id": "355",
                  "type": "comment",
                  "attributes": {
                    "body": "Expedita quaerat eum dolore tempore laudantium. Qui rerum quam ipsam quo reprehenderit eos quis quisquam.",
                    "file": {
                      "url": "/test/uploads/comment/file/355/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/355/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-07-20T16:30:58.849Z",
                    "updated_at": "2020-07-20T16:30:58.849Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "1156",
                        "type": "task"
                      }
                    }
                  }
                }
              ]
            }

+ Request show list of comments and return status code 404
**GET**&nbsp;&nbsp;`/api/v1/projects/1334/tasks/0/comments?task_id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzc2LCJleHAiOjE1OTUzNDkwNTl9.6e667MtrWtkxTzEhQbRI8B4kM3BP5HgRy3BCXuG6GcU

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

### Create comments [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `1335` (number, required)
    + task_id: `1158` (number, required)

+ Request creates new comment and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/1335/tasks/1158/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzc3LCJleHAiOjE1OTUzNDkwNTl9.ygYiJ9SvOKscb9gp9Uv9j3lCUL8-in4bGV0_bOs-gMs
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {
              "body": "Adipisci libero qui maiores voluptates unde veritatis provident. Nemo voluptatem velit unde eius eveniet eos neque magnam.",
              "file": {
                "filename": "test.jpg",
                "type": "image/jpg",
                "name": "file",
                "tempfile": "#<File:0x000000000481a610>",
                "head": "Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 225366\r\n"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "358",
                "type": "comment",
                "attributes": {
                  "body": "Adipisci libero qui maiores voluptates unde veritatis provident. Nemo voluptatem velit unde eius eveniet eos neque magnam.",
                  "file": {
                    "url": "/test/uploads/comment/file/358/test.jpg",
                    "medium_img": {
                      "url": "/test/uploads/comment/file/358/medium_img_test.jpg"
                    }
                  },
                  "created_at": "2020-07-20T16:30:59.484Z",
                  "updated_at": "2020-07-20T16:30:59.484Z"
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "1158",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request do not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/1336/tasks/1159/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzc4LCJleHAiOjE1OTUzNDkwNTl9.RQNf2uUvvgBOEfbRHYiuKamrVg8Gmw_KKFVdvVxAKtM
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=1336&task_id=1159&body=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Body can't be blank",
                "Body is too short (minimum is 10 characters)"
              ]
            }

### Delete comment [DELETE /api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `1337` (number, required)
    + task_id: `1160` (number, required)
    + id: `359` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1337/tasks/1160/comments/359`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzc5LCJleHAiOjE1OTUzNDkwNTl9.d3QWlS431eHI54ZvHE15DY0dltbR-Wr5AysiX9tn9SI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=359

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1338/tasks/1161/comments/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzgwLCJleHAiOjE1OTUzNDkwNTl9.oKRxb_-FnbKtYsmuXgyO0oFwHcDxy7o67uukpZ0r3tk
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request return all list of projects of current user
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzgxLCJleHAiOjE1OTUzNDkwNTl9.cri8iGAgHw5xNOEgEtgzfDtLKXIhYYrMZF7usBaPTT0

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1339",
                  "type": "project",
                  "attributes": {
                    "name": "et",
                    "created_at": "2020-07-20T16:30:59.942Z",
                    "updated_at": "2020-07-20T16:30:59.942Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1381",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "1340",
                  "type": "project",
                  "attributes": {
                    "name": "eos",
                    "created_at": "2020-07-20T16:30:59.949Z",
                    "updated_at": "2020-07-20T16:30:59.949Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1381",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "1341",
                  "type": "project",
                  "attributes": {
                    "name": "aliquam",
                    "created_at": "2020-07-20T16:30:59.955Z",
                    "updated_at": "2020-07-20T16:30:59.955Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1381",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `1342` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/1342?id=1342`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzgyLCJleHAiOjE1OTUzNDkwNjB9.TKCwiTKATDlKXBgrt56iS61c7NYDf5XhMHwwtApvk3Y

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1342",
                "type": "project",
                "attributes": {
                  "name": "est",
                  "created_at": "2020-07-20T16:31:00.072Z",
                  "updated_at": "2020-07-20T16:31:00.072Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1382",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

### Create projects [POST /api/v1/projects]


+ Request create project and return status 201
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzgzLCJleHAiOjE1OTUzNDkwNjB9.ZE44AoY3RJob4nzdS3tma0w8jrI2c9QG3acRV5GLW6g
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=alias

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1343",
                "type": "project",
                "attributes": {
                  "name": "alias",
                  "created_at": "2020-07-20T16:31:00.207Z",
                  "updated_at": "2020-07-20T16:31:00.207Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1383",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request test fail, because inputs exist`s project name, return status 422
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzg0LCJleHAiOjE1OTUzNDkwNjB9.2PiY_p86MXz9E9mK1lltdtsYAiCVX7QBT_JgktKP8Uo
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=dolor

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name The project with such name does already exist"
              ]
            }

### Update project [PATCH /api/v1/projects/{id}]

+ Parameters
    + id: `1345` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1345`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzg1LCJleHAiOjE1OTUzNDkwNjB9.PTi5Kcvv7UWeANqAtuoONDggGt-3ur2AelPLQmp1v8I
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1345&name=officia

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1345",
                "type": "project",
                "attributes": {
                  "name": "officia",
                  "created_at": "2020-07-20T16:31:00.392Z",
                  "updated_at": "2020-07-20T16:31:00.412Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1385",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request with fails, because name is empty, return status 422
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1346`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzg2LCJleHAiOjE1OTUzNDkwNjB9.qLbcApbF3BBZyaxVqghgaVvnERRSGt0L1tWFaFhOEf8
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1346&name=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name can't be blank"
              ]
            }

+ Request with fails, because name is empty and project_id is nil with not_found, return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzg3LCJleHAiOjE1OTUzNDkwNjB9.KAfGUgVilWMjmNVvwY_hYlzFEK6KW1zM4R0azXilEMQ
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0&name=

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

### Delete project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `1347` (number, required)

+ Request project will be destroyed with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1347`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzg4LCJleHAiOjE1OTUzNDkwNjB9.bD7rFFpEDgGmpU8OJsxhKhk_9CJ9AizBcuFBOJlOtQk
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1347

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

+ Request with fails, because id is invalid
**DELETE**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzg5LCJleHAiOjE1OTUzNDkwNjB9.2mRjS8SJAS_7v6OneCJk0WLOZLz6MSaRNYqX--1R3ew
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

# Group Tasks


## Tasks [/projects/:id/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `1349` (number, required)

+ Request show list of tasks and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/1349/tasks?project_id=1349`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzkwLCJleHAiOjE1OTUzNDkwNjB9.u03pYjM8AqrdkBYdIIj6ohh3liWbbTCjrk92QYM_a0s

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1162",
                  "type": "task",
                  "attributes": {
                    "name": "dignissimos",
                    "position": 1,
                    "deadline": "2020-07-22T16:31:00.785Z",
                    "done": false,
                    "created_at": "2020-07-20T16:31:00.786Z",
                    "updated_at": "2020-07-20T16:31:00.786Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "1349",
                        "type": "project"
                      }
                    },
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                },
                {
                  "id": "1163",
                  "type": "task",
                  "attributes": {
                    "name": "non",
                    "position": 2,
                    "deadline": "2020-07-22T16:31:00.793Z",
                    "done": false,
                    "created_at": "2020-07-20T16:31:00.794Z",
                    "updated_at": "2020-07-20T16:31:00.794Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "1349",
                        "type": "project"
                      }
                    },
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show task [GET /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `1350` (number, required)
    + id: `1164` (number, required)

+ Request return tasks of project
**GET**&nbsp;&nbsp;`/api/v1/projects/1350/tasks/1164?id=1164&project_id=1350`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzkxLCJleHAiOjE1OTUzNDkwNjB9.TsXmdKYkgsUI-EZ9jgn8LFV3dvJKh4hSrLKw8qc1oNM

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1164",
                "type": "task",
                "attributes": {
                  "name": "nisi",
                  "position": 1,
                  "deadline": "2020-07-22T16:31:00.937Z",
                  "done": false,
                  "created_at": "2020-07-20T16:31:00.938Z",
                  "updated_at": "2020-07-20T16:31:00.938Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1350",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request do not show task
**GET**&nbsp;&nbsp;`/api/v1/projects/1351/tasks/0?id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzkyLCJleHAiOjE1OTUzNDkwNjF9.LFPar1Ne1oSEvjcoOMJ56H9hLyRmCBV-q4p9ZQawMCI

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

### Create tasks [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `1352` (number, required)

+ Request create new task and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/1352/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzkzLCJleHAiOjE1OTUzNDkwNjF9.Wor2uWNw_Il3hm4J78NY978Rqb6aP_RF2o0MIbvO48Y
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=1352&name=qui&deadline=2020-07-22T19%3A31%3A01%2B03%3A00

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1165",
                "type": "task",
                "attributes": {
                  "name": "qui",
                  "position": 1,
                  "deadline": "2020-07-22T16:31:01.000Z",
                  "done": false,
                  "created_at": "2020-07-20T16:31:01.163Z",
                  "updated_at": "2020-07-20T16:31:01.163Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1352",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request do not create task, because inputs empty task name
**POST**&nbsp;&nbsp;`/api/v1/projects/1353/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzk0LCJleHAiOjE1OTUzNDkwNjF9.2IUdZtEsWh_Ka599ZLv9ZSOUF0HHnbLS_AZP5aL2O1c
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=1353&name=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Name can't be blank"
              ]
            }

### Update task [PUT /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `1354` (number, required)
    + id: `1166` (number, required)

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/1354/tasks/1166`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzk1LCJleHAiOjE1OTUzNDkwNjF9.CAxc1qX-6MOpv3PjewH2-zOuJ1BbyW0dRp8NV5Y8IGE
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1166&name=harum

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1166",
                "type": "task",
                "attributes": {
                  "name": "harum",
                  "position": 1,
                  "deadline": "2020-07-22T16:31:01.359Z",
                  "done": false,
                  "created_at": "2020-07-20T16:31:01.360Z",
                  "updated_at": "2020-07-20T16:31:01.382Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1354",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/1355/tasks/1167`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzk2LCJleHAiOjE1OTUzNDkwNjF9.SXTgQu1I-X9LLnu3vj6Epn8OEko4u3XpZQzRnv9LONY
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1167&deadline=2020-07-22T19%3A31%3A01%2B03%3A00

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1167",
                "type": "task",
                "attributes": {
                  "name": "aut",
                  "position": 1,
                  "deadline": "2020-07-22T16:31:01.000Z",
                  "done": false,
                  "created_at": "2020-07-20T16:31:01.493Z",
                  "updated_at": "2020-07-20T16:31:01.514Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1355",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

### Update position [PATCH /api/v1/projects/{project_id}/tasks/{id}/position]

+ Parameters
    + project_id: `1356` (number, required)
    + id: `1169` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1356/tasks/1169/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzk3LCJleHAiOjE1OTUzNDkwNjF9.beIZqDwFJ5-rogrfJSEZ2PLZPgMMihrTFBTTA5a9RR0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1169&position=move_up

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1169",
                "type": "task",
                "attributes": {
                  "name": "rem",
                  "position": 1,
                  "deadline": "2020-07-22T16:31:01.661Z",
                  "done": false,
                  "created_at": "2020-07-20T16:31:01.664Z",
                  "updated_at": "2020-07-20T16:31:01.754Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1356",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1357/tasks/1172/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzk4LCJleHAiOjE1OTUzNDkwNjJ9.G7i3L5OYveb2V-cE6-B8RsFtTUMblAT3FI0YgyXA2Ow
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1172&position=move_down

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1172",
                "type": "task",
                "attributes": {
                  "name": "neque",
                  "position": 3,
                  "deadline": "2020-07-22T16:31:01.993Z",
                  "done": false,
                  "created_at": "2020-07-20T16:31:01.994Z",
                  "updated_at": "2020-07-20T16:31:02.057Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1357",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request do not update position
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1358/tasks/1175/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzk5LCJleHAiOjE1OTUzNDkwNjJ9.AIVnu-67PKGIEkWiOjxrDqgyKHidRB1TBX3yycx2FWM
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1175&position=eius

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
            
              ]
            }

+ Request do not update position
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1359/tasks/0/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDAwLCJleHAiOjE1OTUzNDkwNjJ9.ZMR6JoMtEMqJ79iWxMxHOgZPtqrjx-4TYfPZ_u2nzWI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id&position=move_down

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

### Update complete [PATCH /api/v1/projects/{project_id}/tasks/{id}/complete]

+ Parameters
    + project_id: `1360` (number, required)
    + id: `1180` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1360/tasks/1180/complete`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDAxLCJleHAiOjE1OTUzNDkwNjJ9.1wESbD0AN1PVOGf3HlwVjXe2b0cmPgwth7xh8LuYHLg
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1180&done=true

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1180",
                "type": "task",
                "attributes": {
                  "name": "alias",
                  "position": 1,
                  "deadline": "2020-07-22T16:31:02.384Z",
                  "done": true,
                  "created_at": "2020-07-20T16:31:02.385Z",
                  "updated_at": "2020-07-20T16:31:02.410Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1360",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request do not update complete
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1361/tasks/0/complete`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDAyLCJleHAiOjE1OTUzNDkwNjJ9.IMBgzMlbNjc1Yb5uNHg_yaVHpeipt2cZI1ovHDyRfQM
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1181&done=

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

### Delete task [DELETE /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `1362` (number, required)
    + id: `1182` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1362/tasks/1182`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDAzLCJleHAiOjE1OTUzNDkwNjJ9.2886827q1Vtb50LwiTGBS8oRGGUTk1Mmhgc5L9HN9hQ
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1182

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1363/tasks/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDA0LCJleHAiOjE1OTUzNDkwNjJ9.W6MntypDU2cM8nD0qB2OCQMK2Z1-9zQFWNo-HVL8dI0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Authorize was failed"
              ]
            }

# Group Users


## Users [/users]


### Sign up user [POST /api/v1/users]


+ Request sign up user with success
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=dorothy_lesch&password=S_J0d7TogUYd&password_confirmation=S_J0d7TogUYd

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1405",
                "type": "user",
                "attributes": {
                  "user_name": "dorothy_lesch",
                  "password_digest": "$2a$04$c.bAQv.4CfPafYRe4ggLwOsyCsosZtxnEmA2eUjBY6QQBvt9fNwlK",
                  "created_at": "2020-07-20T16:31:02.666Z",
                  "updated_at": "2020-07-20T16:31:02.666Z"
                },
                "relationships": {
                  "projects": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request sign up user with empty user_name and wrong password_confirmation
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=&password=password&password_confirmation=wrong

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                "Password confirmation doesn't match Password",
                "User name can't be blank",
                "User name is too short (minimum is 3 characters)"
              ]
            }

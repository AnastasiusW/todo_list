

# Group Comments


## Comments [/projects/:id/tasks/:id/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `9986` (number, required)
    + task_id: `7791` (number, required)

+ Request show list of comments and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/9986/tasks/7791/comments?task_id=7791`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3MywiZXhwIjoxNTk2Mzk0MDgyfQ.z5x7bCRqqcd4jJxrnP-k_UCaawxa6IYhYIoQyYdvAhE

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1596",
                  "type": "comment",
                  "attributes": {
                    "body": "Occaecati soluta cupiditate dicta eum autem ea nobis. Doloremque odio error perspiciatis delectus sunt laboriosam totam. Numquam qui adipisci architecto eius fugiat libero.",
                    "file": {
                      "url": "/test/uploads/comment/file/1596/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/1596/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-08-01T18:48:02.884Z",
                    "updated_at": "2020-08-01T18:48:02.884Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "7791",
                        "type": "task"
                      }
                    }
                  }
                },
                {
                  "id": "1597",
                  "type": "comment",
                  "attributes": {
                    "body": "Ipsum labore ut nisi aut totam eligendi quae. Quis iste et non laudantium iusto. Perspiciatis nulla molestias officia iste ut. Est recusandae quia velit ad quas aliquam aut.",
                    "file": {
                      "url": "/test/uploads/comment/file/1597/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/1597/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-08-01T18:48:02.969Z",
                    "updated_at": "2020-08-01T18:48:02.969Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "7791",
                        "type": "task"
                      }
                    }
                  }
                }
              ]
            }

+ Request show list of comments and return status code 404
**GET**&nbsp;&nbsp;`/api/v1/projects/9987/tasks/0/comments?task_id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3NCwiZXhwIjoxNTk2Mzk0MDgzfQ.K34qEHEf_aqZ6DAHJWVPjPvHdKTw3Tnm_fMd0-42Soo

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/9987/tasks/0/comments"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create comments [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `9988` (number, required)
    + task_id: `7793` (number, required)

+ Request creates new comment and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/9988/tasks/7793/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3NSwiZXhwIjoxNTk2Mzk0MDgzfQ.7IR4FAA1xswR8mFJzav_c5zNa7oSnyzEppFFwRk9B98
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {
              "body": "Totam id in commodi vel. Odit esse repellendus nulla et blanditiis quis at.",
              "file": {
                "filename": "test.jpg",
                "type": "image/jpg",
                "name": "file",
                "tempfile": "#<File:0x000000000507e4c8>",
                "head": "Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 225366\r\n"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1600",
                "type": "comment",
                "attributes": {
                  "body": "Totam id in commodi vel. Odit esse repellendus nulla et blanditiis quis at.",
                  "file": {
                    "url": "/test/uploads/comment/file/1600/test.jpg",
                    "medium_img": {
                      "url": "/test/uploads/comment/file/1600/medium_img_test.jpg"
                    }
                  },
                  "created_at": "2020-08-01T18:48:03.745Z",
                  "updated_at": "2020-08-01T18:48:03.745Z"
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "7793",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request do not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/9989/tasks/7794/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3NiwiZXhwIjoxNTk2Mzk0MDgzfQ.-Hq29tdnGthiQKy58B5wxaNBObZCqibwZym1a1w4N08
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=9989&task_id=7794&body=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes/body"
                  },
                  "detail": [
                    "is too short (minimum is 10 characters)",
                    "can't be blank"
                  ],
                  "status": "unprocessable_entity"
                }
              ]
            }

### Delete comment [DELETE /api/v1/projects/{project_id}/tasks/{task_id}/comments/{id}]

+ Parameters
    + project_id: `9990` (number, required)
    + task_id: `7795` (number, required)
    + id: `1601` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/9990/tasks/7795/comments/1601`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3NywiZXhwIjoxNTk2Mzk0MDg0fQ.r9AU4v9WE1Lk91sFHONzlDavsyQhZ8bYMcF7Zo7hUEw
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1601

+ Response 200

    + Headers

            Content-Type: application/json

+ Request task will be not deleted
**DELETE**&nbsp;&nbsp;`/api/v1/projects/9991/tasks/7796/comments/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3OCwiZXhwIjoxNTk2Mzk0MDg0fQ.4Ek6fgJcD4_vFDMRmSLsal4DkrSOo3YLK4re3snYGUo
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/9991/tasks/7796/comments/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request return all list of projects of current user
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4NCwiZXhwIjoxNTk2Mzk0MDg1fQ.VnLa_CCqeD1tkpUBnQJ10rNifPUEGuMBF217npLYzsc

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "9997",
                  "type": "project",
                  "attributes": {
                    "name": "quia",
                    "created_at": "2020-08-01T18:48:05.097Z",
                    "updated_at": "2020-08-01T18:48:05.097Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "10284",
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
                  "id": "9998",
                  "type": "project",
                  "attributes": {
                    "name": "nihil",
                    "created_at": "2020-08-01T18:48:05.104Z",
                    "updated_at": "2020-08-01T18:48:05.104Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "10284",
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
                  "id": "9999",
                  "type": "project",
                  "attributes": {
                    "name": "cumque",
                    "created_at": "2020-08-01T18:48:05.111Z",
                    "updated_at": "2020-08-01T18:48:05.111Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "10284",
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
    + id: `10000` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/10000?id=10000`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4NSwiZXhwIjoxNTk2Mzk0MDg1fQ.XnUGkFkbi0DpZmJL36UlTQHda1E9Xr2QnCQebdAI44k

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10000",
                "type": "project",
                "attributes": {
                  "name": "expedita",
                  "created_at": "2020-08-01T18:48:05.235Z",
                  "updated_at": "2020-08-01T18:48:05.235Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10285",
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

+ Request return 403 status
**GET**&nbsp;&nbsp;`/api/v1/projects/10001?id=10001`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4NywiZXhwIjoxNTk2Mzk0MDg1fQ.290dp6B6m6pNd2L6u4PRo0Z97Vg37bUEDCVam4L_Vt4

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10001"
                  },
                  "detail": "You are not authorized to perform this action.",
                  "status": "forbidden"
                }
              ]
            }

### Create projects [POST /api/v1/projects]


+ Request create project and return status 201
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4OCwiZXhwIjoxNTk2Mzk0MDg1fQ.29suUpm4KcSOsrQmbCgMfXWKqIntXi0R99InSKvKa3k
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=reiciendis

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10002",
                "type": "project",
                "attributes": {
                  "name": "reiciendis",
                  "created_at": "2020-08-01T18:48:05.472Z",
                  "updated_at": "2020-08-01T18:48:05.472Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10288",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4OSwiZXhwIjoxNTk2Mzk0MDg1fQ.E-HbnrLe2OMf3SS9Q5Y68wCVNhfdaOfqJqM69hPWFfw
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=veritatis

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "translation missing: en.project_exist"
                  ],
                  "status": "unprocessable_entity"
                }
              ]
            }

### Update project [PATCH /api/v1/projects/{id}]

+ Parameters
    + id: `10004` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10004`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5MCwiZXhwIjoxNTk2Mzk0MDg1fQ.j19rKpjF8gdUBTf80prsMkPxTUFas_VZix7PTSY10oU
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10004&name=cumque

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10004",
                "type": "project",
                "attributes": {
                  "name": "cumque",
                  "created_at": "2020-08-01T18:48:05.682Z",
                  "updated_at": "2020-08-01T18:48:05.699Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10290",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10005`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5MSwiZXhwIjoxNTk2Mzk0MDg1fQ.d2r-OvP0aq8QOsz_xaATGGihDB1zCScPgUOvTM0zF40
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10005&name=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ],
                  "status": "unprocessable_entity"
                }
              ]
            }

+ Request with fails, because name is empty and project_id is nil with not_found, return status 404
**PATCH**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5MiwiZXhwIjoxNTk2Mzk0MDg1fQ.kpp0f6BzkpQFwZto4ahyEe9CdHwRax3oZfNKF2si7w0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0&name=

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Delete project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `10006` (number, required)

+ Request project will be destroyed with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10006`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5MywiZXhwIjoxNTk2Mzk0MDg2fQ.-_7Zqf3eNBvtRJj0gTnrU4VLyQpJz9IcA7Y52zrkQuI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10006

+ Response 200

    + Headers

            Content-Type: application/json

+ Request with fails, because id is invalid
**DELETE**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5NCwiZXhwIjoxNTk2Mzk0MDg2fQ.9aTGBQsVm736-OQzf6WXhbDKN92MBmanCQ_mJ_WqMu0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

# Group Session


## Session [/sign_in]


### Sign in user [POST /api/v1/sign_in]


+ Request sign in with success
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=Estella+Kunde&password=nT3EhCbezOO

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5NSwiZXhwIjoxNTk2Mzk0MDg2fQ.jsjyhSaHcpCb61T4RRaRvGoPDT6RTeBWrFXWle0qyF4"
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
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/sign_in"
                  },
                  "detail": "translation missing: en.login",
                  "status": "unauthorized"
                }
              ]
            }

# Group Tasks


## Tasks [/projects/:id/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `10008` (number, required)

+ Request show list of tasks and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/10008/tasks?project_id=10008`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5NiwiZXhwIjoxNTk2Mzk0MDg2fQ.CVMCnBVOwqMkoPXPhi6mogDI-c16cR5NdzZSIdLW4w4

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "7810",
                  "type": "task",
                  "attributes": {
                    "name": "aut",
                    "position": 1,
                    "deadline": "2020-08-03T18:48:06.260Z",
                    "done": false,
                    "created_at": "2020-08-01T18:48:06.261Z",
                    "updated_at": "2020-08-01T18:48:06.261Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "10008",
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
                  "id": "7811",
                  "type": "task",
                  "attributes": {
                    "name": "ex",
                    "position": 2,
                    "deadline": "2020-08-03T18:48:06.269Z",
                    "done": false,
                    "created_at": "2020-08-01T18:48:06.270Z",
                    "updated_at": "2020-08-01T18:48:06.270Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "10008",
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

+ Request show list of tasks and return status code 401
**GET**&nbsp;&nbsp;`/api/v1/projects/10009/tasks?project_id=10009`

    + Headers

            Accept: application/json

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10009/tasks"
                  },
                  "detail": "Authenticate is fail",
                  "status": "unauthorized"
                }
              ]
            }

+ Request show list of comments and return status code 404
**GET**&nbsp;&nbsp;`/api/v1/projects/0/tasks?project_id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5OCwiZXhwIjoxNTk2Mzk0MDg2fQ.mpfg4nZqzMP-7LKskwh7x5dnvWLvQDlqRLC3Rdj-5q0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/0/tasks"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Show task [GET /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `10011` (number, required)
    + id: `7816` (number, required)

+ Request return tasks of project
**GET**&nbsp;&nbsp;`/api/v1/projects/10011/tasks/7816?id=7816&project_id=10011`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI5OSwiZXhwIjoxNTk2Mzk0MDg2fQ.d-LYlfqsV-FLF1fbS2H1dOEUIqUIc9oWHpPIkFexWY4

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7816",
                "type": "task",
                "attributes": {
                  "name": "dicta",
                  "position": 1,
                  "deadline": "2020-08-03T18:48:06.645Z",
                  "done": false,
                  "created_at": "2020-08-01T18:48:06.646Z",
                  "updated_at": "2020-08-01T18:48:06.646Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10011",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/10012/tasks/0?id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwMCwiZXhwIjoxNTk2Mzk0MDg2fQ.RX4-QlMaqOtQWW2fah1UQ43sIQSX4wr0z7ql-QKFB4s

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10012/tasks/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create tasks [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `10013` (number, required)

+ Request create new task and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/10013/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwMSwiZXhwIjoxNTk2Mzk0MDg2fQ.xyOqWzWCuGOSzn3bzdM6s0D4p_r0xSRf-IyZ2cz4HEs
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=10013&name=deleniti&deadline=2020-08-03T21%3A48%3A06%2B03%3A00

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7817",
                "type": "task",
                "attributes": {
                  "name": "deleniti",
                  "position": 1,
                  "deadline": "2020-08-03T18:48:06.000Z",
                  "done": false,
                  "created_at": "2020-08-01T18:48:06.965Z",
                  "updated_at": "2020-08-01T18:48:06.965Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10013",
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
**POST**&nbsp;&nbsp;`/api/v1/projects/10014/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwMiwiZXhwIjoxNTk2Mzk0MDg3fQ.d364BY7oh9gSCxBoFXG7o0p06c18-4ciYJtahN26tVI
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=10014&name=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ],
                  "status": "unprocessable_entity"
                }
              ]
            }

### Update task [PUT /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `10015` (number, required)
    + id: `7818` (number, required)

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/10015/tasks/7818`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwMywiZXhwIjoxNTk2Mzk0MDg3fQ.-w0EI6-VlVzB9Uv5taNOA5MRrjeXFXpzFldtOqkPLWc
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7818&name=rerum

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7818",
                "type": "task",
                "attributes": {
                  "name": "rerum",
                  "position": 1,
                  "deadline": "2020-08-03T18:48:07.168Z",
                  "done": false,
                  "created_at": "2020-08-01T18:48:07.169Z",
                  "updated_at": "2020-08-01T18:48:07.190Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10015",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/10016/tasks/7819`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwNCwiZXhwIjoxNTk2Mzk0MDg3fQ.EkW4o0ZjqZ3dO1CLAGYmKZvp8kgcelkC7-K71HEPEsc
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7819&deadline=2020-08-03T21%3A48%3A07%2B03%3A00

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7819",
                "type": "task",
                "attributes": {
                  "name": "minus",
                  "position": 1,
                  "deadline": "2020-08-03T18:48:07.000Z",
                  "done": false,
                  "created_at": "2020-08-01T18:48:07.306Z",
                  "updated_at": "2020-08-01T18:48:07.328Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10016",
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

+ Request update task and return status 422
**PUT**&nbsp;&nbsp;`/api/v1/projects/10017/tasks/7820`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwNSwiZXhwIjoxNTk2Mzk0MDg3fQ.6cLm-XUBBxgISZTFMA8JScGW1TV9lE2NMN20v8Bvp1U
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7820&name=

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ],
                  "status": "unprocessable_entity"
                }
              ]
            }

### Delete task [DELETE /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `10018` (number, required)
    + id: `7821` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10018/tasks/7821`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwNiwiZXhwIjoxNTk2Mzk0MDg3fQ.R38J3UDWIJNiLl1qpfRefByXed_xXqDO34GU0KomENo
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7821

+ Response 200

    + Headers

            Content-Type: application/json

+ Request task will be deleted with fail
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10019/tasks/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDMwNywiZXhwIjoxNTk2Mzk0MDg3fQ.cAMZrf6BcBGQn4W1ov5T8fZcGmJ8uEePiMB7jfbTcFc
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=0

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10019/tasks/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

# Group Tasks/Complete


## Complete [/projects/:id/tasks/complete/:id]


### Update complete [PATCH /api/v1/projects/{project_id}/tasks/{task_id}/complete/{id}]

+ Parameters
    + project_id: `9992` (number, required)
    + task_id: `7797` (number, required)
    + id: `7797` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/9992/tasks/7797/complete/7797`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI3OSwiZXhwIjoxNTk2Mzk0MDg0fQ.eC7hQKdw-8uUrg9Oc9MVUCg6bsUvQEOIra8JXd9CmTI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7797&done=true

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7797",
                "type": "task",
                "attributes": {
                  "name": "veniam",
                  "position": 1,
                  "deadline": "2020-08-03T18:48:04.340Z",
                  "done": true,
                  "created_at": "2020-08-01T18:48:04.341Z",
                  "updated_at": "2020-08-01T18:48:04.366Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "9992",
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

# Group Tasks/Position


## Position [/projects/:id/tasks/position/:id]


### Update position [PATCH /api/v1/projects/{project_id}/tasks/{task_id}/position/{id}]

+ Parameters
    + project_id: `9993` (number, required)
    + task_id: `7799` (number, required)
    + id: `7799` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/9993/tasks/7799/position/7799`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4MCwiZXhwIjoxNTk2Mzk0MDg0fQ.FkMsrWRkC-asul6S_dl0_Xz-8EsxDsW4ahaegmrkP9A
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7799&position=move_up

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7799",
                "type": "task",
                "attributes": {
                  "name": "consequuntur",
                  "position": 1,
                  "deadline": "2020-08-03T18:48:04.515Z",
                  "done": false,
                  "created_at": "2020-08-01T18:48:04.516Z",
                  "updated_at": "2020-08-01T18:48:04.583Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "9993",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/9994/tasks/7802/position/7802`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4MSwiZXhwIjoxNTk2Mzk0MDg0fQ.-2rCREhN4ar_0Ese_-f_3bZ_BagPxy8hJS2KsKpzIts
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7802&position=move_down

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7802",
                "type": "task",
                "attributes": {
                  "name": "est",
                  "position": 3,
                  "deadline": "2020-08-03T18:48:04.700Z",
                  "done": false,
                  "created_at": "2020-08-01T18:48:04.701Z",
                  "updated_at": "2020-08-01T18:48:04.763Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "9994",
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

+ Request do not update position, invalid position
**PATCH**&nbsp;&nbsp;`/api/v1/projects/9995/tasks/7805/position/7805`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4MiwiZXhwIjoxNTk2Mzk0MDg0fQ.6-xtVd5P8ioQeILHoIuZerWaTpacnla2_bKfk27-g5Y
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=7805&position=similique

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/9995/tasks/7805/position/7805"
                  },
                  "detail": "Wrong postion parameter",
                  "status": "unprocessable_entity"
                }
              ]
            }

+ Request do not update position, invalid id task
**PATCH**&nbsp;&nbsp;`/api/v1/projects/9996/tasks/0/position/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDI4MywiZXhwIjoxNTk2Mzk0MDg1fQ.7val3Z_KZz3r2A5dF_JBpmnBmIBXwFxkC1g6GeLm13s
            Content-Type: application/x-www-form-urlencoded

    + Body

            id&position=move_down

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/9996/tasks/0/position/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
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

            user_name=Jolanda+Hettinger&password=E0k2iYV97O3Tu&password_confirmation=E0k2iYV97O3Tu

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10308",
                "type": "user",
                "attributes": {
                  "user_name": "Jolanda Hettinger",
                  "password_digest": "$2a$04$e6ZfFAXyTDA5YOy3cam8wu2KBcM5gaESgyGhspe5bbqkQRuYmja/O",
                  "created_at": "2020-08-01T18:48:07.571Z",
                  "updated_at": "2020-08-01T18:48:07.571Z"
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
                {
                  "source": {
                    "pointer": "data/attributes/password_confirmation"
                  },
                  "detail": [
                    "doesn't match Password"
                  ],
                  "status": "unprocessable_entity"
                },
                {
                  "source": {
                    "pointer": "data/attributes/user_name"
                  },
                  "detail": [
                    "can't be blank",
                    "is too short (minimum is 3 characters)"
                  ],
                  "status": "unprocessable_entity"
                }
              ]
            }



# Group Authentication


## Authentication [/sign_in]


### Sign in user [POST /api/v1/sign_in]


+ Request sign in with success
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=Johana+Schowalter&password=NtOOwJXfaOZbo

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODY2LCJleHAiOjE1OTYxMjM2OTV9.TL4IviVJgBzGggXPs_ZdsITB0iZMdNIvVj-iztLBKGU"
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

# Group Comments


## Comments [/projects/:id/tasks/:id/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `6676` (number, required)
    + task_id: `5268` (number, required)

+ Request show list of comments and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/6676/tasks/5268/comments?task_id=5268`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODY3LCJleHAiOjE1OTYxMjM2OTZ9.gzfZFbRXzmCe1ircXhFcGfZhOKHiPd50Wj_fiND5vbE

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1007",
                  "type": "comment",
                  "attributes": {
                    "body": "Architecto voluptatem perspiciatis ut voluptate alias iste omnis aut. Tenetur laborum itaque soluta distinctio dolores eveniet mollitia nulla. Error sequi eos odit sapiente tenetur fugiat.",
                    "file": {
                      "url": "/test/uploads/comment/file/1007/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/1007/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-07-29T15:41:36.042Z",
                    "updated_at": "2020-07-29T15:41:36.042Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "5268",
                        "type": "task"
                      }
                    }
                  }
                },
                {
                  "id": "1008",
                  "type": "comment",
                  "attributes": {
                    "body": "Quisquam et cum et alias numquam dolor quis et. Fugit voluptatem qui tenetur est non quis. Vel voluptatibus ut ad consectetur perferendis minus accusamus incidunt.",
                    "file": {
                      "url": "/test/uploads/comment/file/1008/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/1008/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-07-29T15:41:36.135Z",
                    "updated_at": "2020-07-29T15:41:36.135Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "5268",
                        "type": "task"
                      }
                    }
                  }
                }
              ]
            }

+ Request show list of comments and return status code 404
**GET**&nbsp;&nbsp;`/api/v1/projects/6677/tasks/0/comments?task_id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODY4LCJleHAiOjE1OTYxMjM2OTZ9.o5nCDvcLEwKZk63YTrU1OI-rrHgABn5Fg7QCajeMtp4

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/6677/tasks/0/comments"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create comments [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `6678` (number, required)
    + task_id: `5270` (number, required)

+ Request creates new comment and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/6678/tasks/5270/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODY5LCJleHAiOjE1OTYxMjM2OTZ9.W62a1trhv4szurGHi1Qs1PMqJX-v6sXqc5YwNOEpbrU
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {
              "body": "Recusandae nulla sed autem ipsum distinctio sit ullam. Nisi esse repudiandae qui omnis sapiente.",
              "file": {
                "filename": "test.jpg",
                "type": "image/jpg",
                "name": "file",
                "tempfile": "#<File:0x00000000052f5440>",
                "head": "Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 225366\r\n"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1011",
                "type": "comment",
                "attributes": {
                  "body": "Recusandae nulla sed autem ipsum distinctio sit ullam. Nisi esse repudiandae qui omnis sapiente.",
                  "file": {
                    "url": "/test/uploads/comment/file/1011/test.jpg",
                    "medium_img": {
                      "url": "/test/uploads/comment/file/1011/medium_img_test.jpg"
                    }
                  },
                  "created_at": "2020-07-29T15:41:36.685Z",
                  "updated_at": "2020-07-29T15:41:36.685Z"
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "5270",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request do not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/6679/tasks/5271/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODcwLCJleHAiOjE1OTYxMjM2OTZ9.ILCGtlxWMvcd3BUOQY2wPSHv0ZDQ3zXCRqv6mYL5SJo
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=6679&task_id=5271&body=

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
    + project_id: `6680` (number, required)
    + task_id: `5272` (number, required)
    + id: `1012` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6680/tasks/5272/comments/1012`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODcxLCJleHAiOjE1OTYxMjM2OTd9.I2eoGexoJt8JFLVZJynzro6pNbYm2Qh4foA6CDYDDAQ
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1012

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

+ Request task will be not deleted
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6681/tasks/5273/comments/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODcyLCJleHAiOjE1OTYxMjM2OTd9.DNyhRpiakSiRosXrGXlR7CeIGFmE0_9Td1kzpl408S8
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
                    "pointer": "/api/v1/projects/6681/tasks/5273/comments/0"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODczLCJleHAiOjE1OTYxMjM2OTd9.hwJ312ixAA5JqiYFqsnQW5aCTlj22wkzkEDybTaS3kI

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "6682",
                  "type": "project",
                  "attributes": {
                    "name": "qui",
                    "created_at": "2020-07-29T15:41:37.331Z",
                    "updated_at": "2020-07-29T15:41:37.331Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6873",
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
                  "id": "6683",
                  "type": "project",
                  "attributes": {
                    "name": "voluptatem",
                    "created_at": "2020-07-29T15:41:37.338Z",
                    "updated_at": "2020-07-29T15:41:37.338Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6873",
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
                  "id": "6684",
                  "type": "project",
                  "attributes": {
                    "name": "aliquid",
                    "created_at": "2020-07-29T15:41:37.344Z",
                    "updated_at": "2020-07-29T15:41:37.344Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6873",
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
    + id: `6685` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/6685?id=6685`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODc0LCJleHAiOjE1OTYxMjM2OTd9.ni5HnHcC3iiZxbaiLBOTisK4osPMGHCD5RDaWy0z6uo

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6685",
                "type": "project",
                "attributes": {
                  "name": "rerum",
                  "created_at": "2020-07-29T15:41:37.466Z",
                  "updated_at": "2020-07-29T15:41:37.466Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "6874",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/6686?id=6686`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODc2LCJleHAiOjE1OTYxMjM2OTd9.AOzcX963tE-G7KEOB5jABeHPuNUM5LiDVLL-9rEtf4c

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/6686"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODc3LCJleHAiOjE1OTYxMjM2OTd9.K8vdvUhCr-eOrRCyJvTox0Tjukqn7ZFET5xPnDbaSW8
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=architecto

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6687",
                "type": "project",
                "attributes": {
                  "name": "architecto",
                  "created_at": "2020-07-29T15:41:37.709Z",
                  "updated_at": "2020-07-29T15:41:37.709Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "6877",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODc4LCJleHAiOjE1OTYxMjM2OTd9.yTrUJlCc2o4wO4lPDnohlKZe2POaGOL39mBJjlxbZ5w
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=aut

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
    + id: `6689` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6689`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODc5LCJleHAiOjE1OTYxMjM2OTd9.Pagx_kmnC4ta6OtTxo7kxNmzOe7D4yjgNchPCOzSqyw
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=6689&name=molestias

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6689",
                "type": "project",
                "attributes": {
                  "name": "molestias",
                  "created_at": "2020-07-29T15:41:37.922Z",
                  "updated_at": "2020-07-29T15:41:37.940Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "6879",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6690`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODgwLCJleHAiOjE1OTYxMjM2OTh9.WIXVxsc6ARCD0D_UEPwPmvwidL_HHo_R81ULIyGcgRQ
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=6690&name=

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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODgxLCJleHAiOjE1OTYxMjM2OTh9.ItJ8u2UF5Mr_dHhsWPRd_zBgI0umZuNFJePN00pB8vY
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
    + id: `6691` (number, required)

+ Request project will be destroyed with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6691`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODgyLCJleHAiOjE1OTYxMjM2OTh9.-b8J__cy5YEIdjB9hWF8SGl6ugCPzLikc3SxcfuECKk
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=6691

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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODgzLCJleHAiOjE1OTYxMjM2OTh9.vbwwz2__9DYeGMMHSPlJ5HObtNGmPaFvxG0Hsp_6G5A
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

# Group Tasks


## Tasks [/projects/:id/tasks]


### Get tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `6693` (number, required)

+ Request show list of tasks and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/6693/tasks?project_id=6693`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODg0LCJleHAiOjE1OTYxMjM2OTh9.esj299SdoeR_Wydr_3l5lGwasV4RWo1Hpc-HEjUMJ-U

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "5274",
                  "type": "task",
                  "attributes": {
                    "name": "quis",
                    "position": 1,
                    "deadline": "2020-07-31T15:41:38.315Z",
                    "done": false,
                    "created_at": "2020-07-29T15:41:38.316Z",
                    "updated_at": "2020-07-29T15:41:38.316Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "6693",
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
                  "id": "5275",
                  "type": "task",
                  "attributes": {
                    "name": "quo",
                    "position": 2,
                    "deadline": "2020-07-31T15:41:38.323Z",
                    "done": false,
                    "created_at": "2020-07-29T15:41:38.324Z",
                    "updated_at": "2020-07-29T15:41:38.324Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "6693",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/6694/tasks?project_id=6694`

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
                    "pointer": "/api/v1/projects/6694/tasks"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODg2LCJleHAiOjE1OTYxMjM2OTh9.jw4BczQ43K3wrANXWO5pcqghGvwqfgO5THWQoh6_xD0

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
    + project_id: `6696` (number, required)
    + id: `5280` (number, required)

+ Request return tasks of project
**GET**&nbsp;&nbsp;`/api/v1/projects/6696/tasks/5280?id=5280&project_id=6696`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODg3LCJleHAiOjE1OTYxMjM2OTh9.pGe4QpIgfYiTkLPilhDdPSdsfxpvkGDcY9AV3hscwDk

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5280",
                "type": "task",
                "attributes": {
                  "name": "ut",
                  "position": 1,
                  "deadline": "2020-07-31T15:41:38.687Z",
                  "done": false,
                  "created_at": "2020-07-29T15:41:38.688Z",
                  "updated_at": "2020-07-29T15:41:38.688Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6696",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/6697/tasks/0?id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODg4LCJleHAiOjE1OTYxMjM2OTh9.llmRqNGmUhMf22LjMHPaKiYTAiYFMtdx5NnCukxhpt4

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/6697/tasks/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create tasks [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `6698` (number, required)

+ Request create new task and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/6698/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODg5LCJleHAiOjE1OTYxMjM2OTh9.XsEODmH518amk-NOCUtGZ1LPtCmXq9hM2SYNYeU2BzI
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=6698&name=commodi&deadline=2020-07-31T18%3A41%3A38%2B03%3A00

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5281",
                "type": "task",
                "attributes": {
                  "name": "commodi",
                  "position": 1,
                  "deadline": "2020-07-31T15:41:38.000Z",
                  "done": false,
                  "created_at": "2020-07-29T15:41:38.841Z",
                  "updated_at": "2020-07-29T15:41:38.841Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6698",
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
**POST**&nbsp;&nbsp;`/api/v1/projects/6699/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODkwLCJleHAiOjE1OTYxMjM2OTh9.KEAOWfthLwawDsBcyo4iW88VhEDXQ8GJbhx6jk2d6No
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=6699&name=

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
    + project_id: `6700` (number, required)
    + id: `5282` (number, required)

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/6700/tasks/5282`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODkxLCJleHAiOjE1OTYxMjM2OTl9.oBsAEbQhgDjmJq2Pm2bZZraKC8v9QNmOIf4voslJTqA
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5282&name=quidem

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5282",
                "type": "task",
                "attributes": {
                  "name": "quidem",
                  "position": 1,
                  "deadline": "2020-07-31T15:41:39.056Z",
                  "done": false,
                  "created_at": "2020-07-29T15:41:39.056Z",
                  "updated_at": "2020-07-29T15:41:39.078Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6700",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/6701/tasks/5283`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODkyLCJleHAiOjE1OTYxMjM2OTl9.H9bMZsKV54OlEi4rL1ogFeLEjTudvsBccuKJFs67ta0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5283&deadline=2020-07-31T18%3A41%3A39%2B03%3A00

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5283",
                "type": "task",
                "attributes": {
                  "name": "vel",
                  "position": 1,
                  "deadline": "2020-07-31T15:41:39.000Z",
                  "done": false,
                  "created_at": "2020-07-29T15:41:39.191Z",
                  "updated_at": "2020-07-29T15:41:39.212Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6701",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/6702/tasks/5284`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODkzLCJleHAiOjE1OTYxMjM2OTl9.ZMklRtE0srWZEbx-to8dhCX2fVW66ibLZDUeXZpkt3M
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5284&name=

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

### Update position [PATCH /api/v1/projects/{project_id}/tasks/{id}/position]

+ Parameters
    + project_id: `6703` (number, required)
    + id: `5286` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6703/tasks/5286/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODk0LCJleHAiOjE1OTYxMjM2OTl9.EXM5kTxNXqvXZ3eqwEbVOKgfSxx64Z5nKmCZs5XFU7Y
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5286&position=move_up

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5286",
                "type": "task",
                "attributes": {
                  "name": "fuga",
                  "position": 1,
                  "deadline": "2020-07-31T15:41:39.379Z",
                  "done": false,
                  "created_at": "2020-07-29T15:41:39.382Z",
                  "updated_at": "2020-07-29T15:41:39.477Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6703",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6704/tasks/5289/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODk1LCJleHAiOjE1OTYxMjM2OTl9.-H0pj4qvyTZ0NTPdBQX-b8aa9k7Qyy2Y7CL2euSd2nw
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5289&position=move_down

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5289",
                "type": "task",
                "attributes": {
                  "name": "autem",
                  "position": 3,
                  "deadline": "2020-07-31T15:41:39.724Z",
                  "done": false,
                  "created_at": "2020-07-29T15:41:39.725Z",
                  "updated_at": "2020-07-29T15:41:39.786Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6704",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6705/tasks/5292/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODk2LCJleHAiOjE1OTYxMjM2OTl9.xDDHqtSSmrBw2bwJe0Js1pt8AlYyv6ZVNqItPQb6D3Y
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5292&position=omnis

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/6705/tasks/5292/position"
                  },
                  "detail": "Wrong postion parameter",
                  "status": "unprocessable_entity"
                }
              ]
            }

+ Request do not update position, invalid id task
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6706/tasks/0/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODk3LCJleHAiOjE1OTYxMjM3MDB9.IzCriSfcudjCh68_1HcBj4U9tzSu4hD0JojOIBayagU
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
                    "pointer": "/api/v1/projects/6706/tasks/0/position"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Update complete [PATCH /api/v1/projects/{project_id}/tasks/{id}/complete]

+ Parameters
    + project_id: `6707` (number, required)
    + id: `5297` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/6707/tasks/5297/complete`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODk4LCJleHAiOjE1OTYxMjM3MDB9.PxznUlBPOeiQGBGHlDwko-T-aCm-qkxR81G_KBDoM8M
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5297&done=true

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5297",
                "type": "task",
                "attributes": {
                  "name": "veniam",
                  "position": 1,
                  "deadline": "2020-07-31T15:41:40.102Z",
                  "done": true,
                  "created_at": "2020-07-29T15:41:40.103Z",
                  "updated_at": "2020-07-29T15:41:40.125Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "6707",
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

### Delete task [DELETE /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `6708` (number, required)
    + id: `5298` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6708/tasks/5298`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2ODk5LCJleHAiOjE1OTYxMjM3MDB9.jhZOrYEqHVews0b9bIhDvLCj2N6E4DL8f4Nm-DOiWuA
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=5298

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

+ Request task will be deleted with fail
**DELETE**&nbsp;&nbsp;`/api/v1/projects/6709/tasks/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2OTAwLCJleHAiOjE1OTYxMjM3MDB9.VXgqljyjQ6000QDgbwVYVFh6n3V0ZKqfLbwXxh6XKaQ
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
                    "pointer": "/api/v1/projects/6709/tasks/0"
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

            user_name=Terica+Davis&password=Oei5krjJO_&password_confirmation=Oei5krjJO_

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "6901",
                "type": "user",
                "attributes": {
                  "user_name": "Terica Davis",
                  "password_digest": "$2a$04$.Zjw6wgN0Hiy7yfDETM.LufRmjypmmYe6GSFHvAere.Ctyn3h7R.e",
                  "created_at": "2020-07-29T15:41:40.342Z",
                  "updated_at": "2020-07-29T15:41:40.342Z"
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

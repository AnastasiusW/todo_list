

# Group Comments


## Comments [/projects/:id/tasks/:id/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `10580` (number, required)
    + task_id: `8249` (number, required)

+ Request show list of comments and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/10580/tasks/8249/comments?task_id=8249`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4MSwiZXhwIjoxNTk2Mzk3ODE5fQ.BdPm_bz6o5h-EA-dWBYi3HQEMXRLSc2tqcTk4zWrmig

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1717",
                  "type": "comment",
                  "attributes": {
                    "body": "Optio sint dicta qui totam voluptatum voluptatem. Corporis facilis porro et animi. Suscipit sit libero ut alias aliquam blanditiis vero.",
                    "file": {
                      "url": "/test/uploads/comment/file/1717/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/1717/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-08-01T19:50:18.943Z",
                    "updated_at": "2020-08-01T19:50:18.943Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "8249",
                        "type": "task"
                      }
                    }
                  }
                },
                {
                  "id": "1718",
                  "type": "comment",
                  "attributes": {
                    "body": "Veritatis dolores velit dolorem aliquam fuga et ratione fugiat. Dolorem beatae qui vitae voluptatem.",
                    "file": {
                      "url": "/test/uploads/comment/file/1718/test.jpg",
                      "medium_img": {
                        "url": "/test/uploads/comment/file/1718/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-08-01T19:50:19.037Z",
                    "updated_at": "2020-08-01T19:50:19.037Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "8249",
                        "type": "task"
                      }
                    }
                  }
                }
              ]
            }

+ Request show list of comments and return status code 404
**GET**&nbsp;&nbsp;`/api/v1/projects/10581/tasks/0/comments?task_id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4MiwiZXhwIjoxNTk2Mzk3ODE5fQ.4Q63Ji2kXpxZmaR9WK7JfuxRPMa75cWTGmsDIoE64Zk

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10581/tasks/0/comments"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create comments [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `10582` (number, required)
    + task_id: `8251` (number, required)

+ Request creates new comment and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/10582/tasks/8251/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4MywiZXhwIjoxNTk2Mzk3ODE5fQ.4IiRM99YLZHHqQ2-n75SeQrrwYI8frue4fxBKvlZaCM
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {
              "body": "Expedita quo similique qui itaque repudiandae aut molestias natus.",
              "file": {
                "filename": "test.jpg",
                "type": "image/jpg",
                "name": "file",
                "tempfile": "#<File:0x00000000046987b0>",
                "head": "Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 225366\r\n"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1721",
                "type": "comment",
                "attributes": {
                  "body": "Expedita quo similique qui itaque repudiandae aut molestias natus.",
                  "file": {
                    "url": "/test/uploads/comment/file/1721/test.jpg",
                    "medium_img": {
                      "url": "/test/uploads/comment/file/1721/medium_img_test.jpg"
                    }
                  },
                  "created_at": "2020-08-01T19:50:19.670Z",
                  "updated_at": "2020-08-01T19:50:19.670Z"
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "8251",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request do not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/10583/tasks/8252/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4NCwiZXhwIjoxNTk2Mzk3ODE5fQ.eBbIbqpRnFc46y7mAvQfGMeLpt9fUMlIHeGpJo2zDQQ
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=10583&task_id=8252&body=

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
    + project_id: `10584` (number, required)
    + task_id: `8253` (number, required)
    + id: `1722` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10584/tasks/8253/comments/1722`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4NSwiZXhwIjoxNTk2Mzk3ODIwfQ.OIG8lELd80UR_SkUItEe2OGvg9I60n2lSXoLA_nd8qU
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1722

+ Response 200

    + Headers

            Content-Type: application/json

+ Request task will be not deleted
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10585/tasks/8254/comments/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4NiwiZXhwIjoxNTk2Mzk3ODIwfQ.LfYA_3NxVZu_ABqiFlUJHnbBI3MzknOYSnH3VtaJNjg
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
                    "pointer": "/api/v1/projects/10585/tasks/8254/comments/0"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5MiwiZXhwIjoxNTk2Mzk3ODIxfQ.Rdaw-wfvnAQsgtOBh3TcUirVkHCqATo-evhjKFwNFhI

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "10591",
                  "type": "project",
                  "attributes": {
                    "name": "animi",
                    "created_at": "2020-08-01T19:50:21.125Z",
                    "updated_at": "2020-08-01T19:50:21.125Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "10892",
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
                  "id": "10592",
                  "type": "project",
                  "attributes": {
                    "name": "autem",
                    "created_at": "2020-08-01T19:50:21.132Z",
                    "updated_at": "2020-08-01T19:50:21.132Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "10892",
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
                  "id": "10593",
                  "type": "project",
                  "attributes": {
                    "name": "non",
                    "created_at": "2020-08-01T19:50:21.140Z",
                    "updated_at": "2020-08-01T19:50:21.140Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "10892",
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
    + id: `10594` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/10594?id=10594`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5MywiZXhwIjoxNTk2Mzk3ODIxfQ.2fEQuel3yiBK-Oh3Yc5THdJgvtqR7WLh9vemq70IX8w

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10594",
                "type": "project",
                "attributes": {
                  "name": "in",
                  "created_at": "2020-08-01T19:50:21.265Z",
                  "updated_at": "2020-08-01T19:50:21.265Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10893",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/10595?id=10595`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5NSwiZXhwIjoxNTk2Mzk3ODIxfQ.uMneqVOp7W-5FiWvnrVtHlmi7tIbqHNaqXh50rSvpVA

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10595"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5NiwiZXhwIjoxNTk2Mzk3ODIxfQ.qHsXfDHxBarEWlZq3ZoJrHis90ccQLF16e98jVQL4So
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=libero

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10596",
                "type": "project",
                "attributes": {
                  "name": "libero",
                  "created_at": "2020-08-01T19:50:21.511Z",
                  "updated_at": "2020-08-01T19:50:21.511Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10896",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5NywiZXhwIjoxNTk2Mzk3ODIxfQ.nW4PN4yQiF0ZrrvSIjs9iw_Xuqw2Zuv_NsCibKlSMYU
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=voluptatibus

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
    + id: `10598` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10598`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5OCwiZXhwIjoxNTk2Mzk3ODIxfQ.q8t-RAI-vZrdwgWbOD0-4SuM-rXQlM9t8NzlOkpvbAw
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10598&name=eos

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10598",
                "type": "project",
                "attributes": {
                  "name": "eos",
                  "created_at": "2020-08-01T19:50:21.726Z",
                  "updated_at": "2020-08-01T19:50:21.745Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "10898",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10599`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5OSwiZXhwIjoxNTk2Mzk3ODIxfQ.PlaONf_k_c6b9w_gwuEUn2Jv-xeqvqeiNhHewvqxJO0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10599&name=

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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwMCwiZXhwIjoxNTk2Mzk3ODIxfQ.IdXFh3l57rpcvCM_T3ueOZWrXf7wedorQ_1ItcPQ0Tw
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
    + id: `10600` (number, required)

+ Request project will be destroyed with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10600`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwMSwiZXhwIjoxNTk2Mzk3ODIyfQ.pA_4JqtaBJN9A1VxquSxeY66XXA7Mp7V3aSFudtcHiY
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10600

+ Response 200

    + Headers

            Content-Type: application/json

+ Request with fails, because id is invalid
**DELETE**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwMiwiZXhwIjoxNTk2Mzk3ODIyfQ.esPD5ToX5NPxwgukKCuKDsLXeBdokzBck49ydlrJEEI
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

            user_name=Naomi+Waelchi&password=0jJRIpNkYPtiq

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwMywiZXhwIjoxNTk2Mzk3ODIyfQ.NBvaGxq0mEB3fTJah_vNBfB92YfikqVlGNvId5V9OyA"
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
    + project_id: `10602` (number, required)

+ Request show list of tasks and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/10602/tasks?project_id=10602`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwNCwiZXhwIjoxNTk2Mzk3ODIyfQ.gZytXJL2pXOOBfZj5eriHhNXsHl3gDzg5Wj7f-qrsDA

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "8268",
                  "type": "task",
                  "attributes": {
                    "name": "illo",
                    "position": 1,
                    "deadline": "2020-08-03T19:50:22.316Z",
                    "done": false,
                    "created_at": "2020-08-01T19:50:22.317Z",
                    "updated_at": "2020-08-01T19:50:22.317Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "10602",
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
                  "id": "8269",
                  "type": "task",
                  "attributes": {
                    "name": "aliquid",
                    "position": 2,
                    "deadline": "2020-08-03T19:50:22.324Z",
                    "done": false,
                    "created_at": "2020-08-01T19:50:22.325Z",
                    "updated_at": "2020-08-01T19:50:22.325Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "10602",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/10603/tasks?project_id=10603`

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
                    "pointer": "/api/v1/projects/10603/tasks"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwNiwiZXhwIjoxNTk2Mzk3ODIyfQ.gteJLtf7PFfIfzbWsw8BgzjglsIDz4PJaI2B9aiLtlo

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
    + project_id: `10605` (number, required)
    + id: `8274` (number, required)

+ Request return tasks of project
**GET**&nbsp;&nbsp;`/api/v1/projects/10605/tasks/8274?id=8274&project_id=10605`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwNywiZXhwIjoxNTk2Mzk3ODIyfQ.zAQfQTi6UJC-6u4peue-XskdEgEXrwBt32jV3n9G42c

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8274",
                "type": "task",
                "attributes": {
                  "name": "et",
                  "position": 1,
                  "deadline": "2020-08-03T19:50:22.701Z",
                  "done": false,
                  "created_at": "2020-08-01T19:50:22.701Z",
                  "updated_at": "2020-08-01T19:50:22.701Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10605",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/10606/tasks/0?id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwOCwiZXhwIjoxNTk2Mzk3ODIyfQ.5hnTECNYYIPhU49Mt38NhlT580j_-Db6kJaTDvtbtNc

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10606/tasks/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create tasks [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `10607` (number, required)

+ Request create new task and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/10607/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkwOSwiZXhwIjoxNTk2Mzk3ODIyfQ.rDwaXiKcdpBoyDYHcX8HwPDWmsacQXtC_zv8ExCu7lw
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=10607&name=sint&deadline=2020-08-03T22%3A50%3A22%2B03%3A00

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8275",
                "type": "task",
                "attributes": {
                  "name": "sint",
                  "position": 1,
                  "deadline": "2020-08-03T19:50:22.000Z",
                  "done": false,
                  "created_at": "2020-08-01T19:50:22.984Z",
                  "updated_at": "2020-08-01T19:50:22.984Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10607",
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
**POST**&nbsp;&nbsp;`/api/v1/projects/10608/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkxMCwiZXhwIjoxNTk2Mzk3ODIzfQ.iQMM8ta4ou0NSgjyOxBwpJOb2iK93_NvuMEpYCIcyyU
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=10608&name=

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
    + project_id: `10609` (number, required)
    + id: `8276` (number, required)

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/10609/tasks/8276`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkxMSwiZXhwIjoxNTk2Mzk3ODIzfQ.ebRIu_l6q0vCP87qQhiiUzDXpGc0eQVWicVLuW17ud8
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8276&name=expedita

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8276",
                "type": "task",
                "attributes": {
                  "name": "expedita",
                  "position": 1,
                  "deadline": "2020-08-03T19:50:23.214Z",
                  "done": false,
                  "created_at": "2020-08-01T19:50:23.215Z",
                  "updated_at": "2020-08-01T19:50:23.236Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10609",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/10610/tasks/8277`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkxMiwiZXhwIjoxNTk2Mzk3ODIzfQ.zf3rgvybIF6C5mhMwmpzWH_7Ar5qWVyOm-l_9ENqGg8
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8277&deadline=2020-08-03T22%3A50%3A23%2B03%3A00

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8277",
                "type": "task",
                "attributes": {
                  "name": "unde",
                  "position": 1,
                  "deadline": "2020-08-03T19:50:23.000Z",
                  "done": false,
                  "created_at": "2020-08-01T19:50:23.350Z",
                  "updated_at": "2020-08-01T19:50:23.371Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10610",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/10611/tasks/8278`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkxMywiZXhwIjoxNTk2Mzk3ODIzfQ.AHv1S-1fNL95KhDNeLomZIcebhg0yiEu_ZAgPO1Hl3Y
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8278&name=

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
    + project_id: `10612` (number, required)
    + id: `8279` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10612/tasks/8279`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkxNCwiZXhwIjoxNTk2Mzk3ODIzfQ.QIU1vRd-UjePtQiBsYz7wHtxdhdHgoKDC94ASx4-vE8
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8279

+ Response 200

    + Headers

            Content-Type: application/json

+ Request task will be deleted with fail
**DELETE**&nbsp;&nbsp;`/api/v1/projects/10613/tasks/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDkxNSwiZXhwIjoxNTk2Mzk3ODIzfQ.CAwLXRJVZwQRCsgKZ82oEk_agpBYHh1vokR_1HrwaUo
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
                    "pointer": "/api/v1/projects/10613/tasks/0"
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
    + project_id: `10586` (number, required)
    + task_id: `8255` (number, required)
    + id: `8255` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10586/tasks/8255/complete/8255`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4NywiZXhwIjoxNTk2Mzk3ODIwfQ.RC47eYX1G0E-duUBwr_e-nuTywLttLyeSCg5sxx8_Uo
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8255&done=true

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8255",
                "type": "task",
                "attributes": {
                  "name": "illo",
                  "position": 1,
                  "deadline": "2020-08-03T19:50:20.189Z",
                  "done": true,
                  "created_at": "2020-08-01T19:50:20.190Z",
                  "updated_at": "2020-08-01T19:50:20.215Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10586",
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
    + project_id: `10587` (number, required)
    + task_id: `8257` (number, required)
    + id: `8257` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10587/tasks/8257/position/8257`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4OCwiZXhwIjoxNTk2Mzk3ODIwfQ.sFKnJ-qaom_ZdZtonFwQGDEKyjIn8_8HWTZMoNNCdBU
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8257&position=move_up

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8257",
                "type": "task",
                "attributes": {
                  "name": "eligendi",
                  "position": 1,
                  "deadline": "2020-08-03T19:50:20.377Z",
                  "done": false,
                  "created_at": "2020-08-01T19:50:20.378Z",
                  "updated_at": "2020-08-01T19:50:20.446Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10587",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10588/tasks/8260/position/8260`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg4OSwiZXhwIjoxNTk2Mzk3ODIwfQ.7uOvkabe38GpkHGkALhNvBXNDkYcjNeEzy3OjHV9NOs
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8260&position=move_down

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8260",
                "type": "task",
                "attributes": {
                  "name": "numquam",
                  "position": 3,
                  "deadline": "2020-08-03T19:50:20.590Z",
                  "done": false,
                  "created_at": "2020-08-01T19:50:20.591Z",
                  "updated_at": "2020-08-01T19:50:20.677Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "10588",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10589/tasks/8263/position/8263`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5MCwiZXhwIjoxNTk2Mzk3ODIwfQ.-zZM11VB4pAdufqL7i5Hoy5MSKVcsanAPt-9QYqMXBw
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=8263&position=enim

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/10589/tasks/8263/position/8263"
                  },
                  "detail": "Wrong postion parameter",
                  "status": "unprocessable_entity"
                }
              ]
            }

+ Request do not update position, invalid id task
**PATCH**&nbsp;&nbsp;`/api/v1/projects/10590/tasks/0/position/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMDg5MSwiZXhwIjoxNTk2Mzk3ODIxfQ.zsueypt-Hs4HcvHEC9KkYKOXJFuihURwstmCm7VUT9Y
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
                    "pointer": "/api/v1/projects/10590/tasks/0/position/0"
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

            user_name=Meg+Koss&password=9VpIzSHFkggD_92V&password_confirmation=9VpIzSHFkggD_92V

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10916",
                "type": "user",
                "attributes": {
                  "user_name": "Meg Koss",
                  "password_digest": "$2a$04$xgK8KOBEZumzExkd65H0fuXQbFn2Bp/WkYRKriQfZreYdfl//yuRm",
                  "created_at": "2020-08-01T19:50:23.618Z",
                  "updated_at": "2020-08-01T19:50:23.618Z"
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

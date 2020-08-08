

# Group Comments


## Comments [/projects/:id/tasks/:id/comments]


### Get comments [GET /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `13135` (number, required)
    + task_id: `10177` (number, required)

+ Request show list of comments and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/13135/tasks/10177/comments?task_id=10177`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzUzOSwiZXhwIjoxNTk2OTc3MDM3fQ.r1LvF7I6F-UH_0UxEOPhIR-3e1xKXOJHLz-qD5XGqzw

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "2227",
                  "type": "comment",
                  "attributes": {
                    "body": "Quos non ducimus delectus nihil molestiae architecto. Magnam autem impedit sunt aut harum enim distinctio optio.",
                    "file": {
                      "url": "/comment/file/2227/test.jpg",
                      "medium_img": {
                        "url": "/comment/file/2227/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-08-08T12:43:56.994Z",
                    "updated_at": "2020-08-08T12:43:56.994Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "10177",
                        "type": "task"
                      }
                    }
                  }
                },
                {
                  "id": "2228",
                  "type": "comment",
                  "attributes": {
                    "body": "Veniam dignissimos voluptatem occaecati quia quia. Tempora totam molestiae qui qui dolor eum. Ea corporis aut sapiente corrupti autem. Ad mollitia molestiae eos nemo.",
                    "file": {
                      "url": "/comment/file/2228/test.jpg",
                      "medium_img": {
                        "url": "/comment/file/2228/medium_img_test.jpg"
                      }
                    },
                    "created_at": "2020-08-08T12:43:57.099Z",
                    "updated_at": "2020-08-08T12:43:57.099Z"
                  },
                  "relationships": {
                    "task": {
                      "data": {
                        "id": "10177",
                        "type": "task"
                      }
                    }
                  }
                }
              ]
            }

+ Request show list of comments and return status code 404
**GET**&nbsp;&nbsp;`/api/v1/projects/13136/tasks/0/comments?task_id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0MCwiZXhwIjoxNTk2OTc3MDM3fQ.E3hn8Sz0HiqmwXHKi6To1UWAD6pLPdNZ79GhyZRjcok

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/13136/tasks/0/comments"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create comments [POST /api/v1/projects/{project_id}/tasks/{task_id}/comments]

+ Parameters
    + project_id: `13137` (number, required)
    + task_id: `10179` (number, required)

+ Request creates new comment and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/13137/tasks/10179/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0MSwiZXhwIjoxNTk2OTc3MDM3fQ.9Fv-MrIGgH31qRMb_moAV0I-CNwM-FAOVDMBPiZTsec
            Content-Type: multipart/form-data; boundary=----------XnJLe9ZIbbGUYtzPQJ16u1

    + Body

            {
              "body": "Consequatur sed commodi eos sint in expedita nam. Consequatur ut occaecati aut odit repellat quia voluptatem. Inventore voluptatem quam numquam odit illo.",
              "file": {
                "filename": "test.jpg",
                "type": "image/jpg",
                "name": "file",
                "tempfile": "#<File:0x0000000003fca0f0>",
                "head": "Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\nContent-Type: image/jpg\r\nContent-Length: 225366\r\n"
              }
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2231",
                "type": "comment",
                "attributes": {
                  "body": "Consequatur sed commodi eos sint in expedita nam. Consequatur ut occaecati aut odit repellat quia voluptatem. Inventore voluptatem quam numquam odit illo.",
                  "file": {
                    "url": "/comment/file/2231/test.jpg",
                    "medium_img": {
                      "url": "/comment/file/2231/medium_img_test.jpg"
                    }
                  },
                  "created_at": "2020-08-08T12:43:57.831Z",
                  "updated_at": "2020-08-08T12:43:57.831Z"
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "10179",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request do not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/13138/tasks/10180/comments`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0MiwiZXhwIjoxNTk2OTc3MDM4fQ.TVKDESkgeMAb2OHSkIap2yAgRl3rFxAp9I-iO6G6rjo
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=13138&task_id=10180&body=

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
    + project_id: `13139` (number, required)
    + task_id: `10181` (number, required)
    + id: `2232` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/13139/tasks/10181/comments/2232`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0MywiZXhwIjoxNTk2OTc3MDM4fQ.iKb-RtUSKYqxtHqVYfDK-mNNssl2c74jin0cQmHbt9Y
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=2232

+ Response 200

    + Headers

            Content-Type: application/json

+ Request task will be not deleted
**DELETE**&nbsp;&nbsp;`/api/v1/projects/13140/tasks/10182/comments/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0NCwiZXhwIjoxNTk2OTc3MDM4fQ.DzFRjR8ZvapDDWneKtLICdCE-0gyOsbHtYESAcerqJg
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
                    "pointer": "/api/v1/projects/13140/tasks/10182/comments/0"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1MCwiZXhwIjoxNTk2OTc3MDM5fQ.s9OVFAltzKiL4rQJWQW14uvai69Fp6g20jL2jBaQUvI

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "13146",
                  "type": "project",
                  "attributes": {
                    "name": "consequatur",
                    "created_at": "2020-08-08T12:43:59.186Z",
                    "updated_at": "2020-08-08T12:43:59.186Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "13550",
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
                  "id": "13147",
                  "type": "project",
                  "attributes": {
                    "name": "exercitationem",
                    "created_at": "2020-08-08T12:43:59.193Z",
                    "updated_at": "2020-08-08T12:43:59.193Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "13550",
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
                  "id": "13148",
                  "type": "project",
                  "attributes": {
                    "name": "sit",
                    "created_at": "2020-08-08T12:43:59.199Z",
                    "updated_at": "2020-08-08T12:43:59.199Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "13550",
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
    + id: `13149` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/13149?id=13149`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1MSwiZXhwIjoxNTk2OTc3MDM5fQ.nVtzaz72j778JGt-Itaj24dT1LsJZdKB4ktx6Wm6URo

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "13149",
                "type": "project",
                "attributes": {
                  "name": "placeat",
                  "created_at": "2020-08-08T12:43:59.319Z",
                  "updated_at": "2020-08-08T12:43:59.319Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "13551",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/13150?id=13150`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1MywiZXhwIjoxNTk2OTc3MDM5fQ.t8qFIvbj-Ha1JJQos8Ok3xzBx1X1JY5nHRJYWuGBr8I

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/13150"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1NCwiZXhwIjoxNTk2OTc3MDM5fQ.vCc1bVz10uMH8WFRzLHVL_bAPxgyj0KZZFbJDXOczGk
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=pariatur

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "13151",
                "type": "project",
                "attributes": {
                  "name": "pariatur",
                  "created_at": "2020-08-08T12:43:59.557Z",
                  "updated_at": "2020-08-08T12:43:59.557Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "13554",
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1NSwiZXhwIjoxNTk2OTc3MDM5fQ.mC5OIBamI9V2DXVLQwjISAdemrMJCoFOQP5YZ5D1M7A
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=omnis

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
    + id: `13153` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13153`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1NiwiZXhwIjoxNTk2OTc3MDM5fQ.kX9LOEUnv8yzplIN960ptzJGo98gqEd1O4b9ld5dfYY
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=13153&name=veritatis

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "13153",
                "type": "project",
                "attributes": {
                  "name": "veritatis",
                  "created_at": "2020-08-08T12:43:59.765Z",
                  "updated_at": "2020-08-08T12:43:59.782Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "13556",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13154`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1NywiZXhwIjoxNTk2OTc3MDM5fQ.oEee_nTVNeX4yQpLKGzTGL1cafdgGPTbVkNZqfk8lPE
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=13154&name=

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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1OCwiZXhwIjoxNTk2OTc3MDM5fQ.moq6TrxQLGDhndbjR7MUbyDMS5ZfYp3ZUR7Gs65D5SI
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
    + id: `13155` (number, required)

+ Request project will be destroyed with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/13155`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU1OSwiZXhwIjoxNTk2OTc3MDQwfQ.JFnTY9sppBhvrBSI3MgiN_fqUis4S_qveDeFyp1CUnk
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=13155

+ Response 200

    + Headers

            Content-Type: application/json

+ Request with fails, because id is invalid
**DELETE**&nbsp;&nbsp;`/api/v1/projects/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2MCwiZXhwIjoxNTk2OTc3MDQwfQ.qS_gBF6VM6T4U4gq1aJWCcvGNnVAbYMBwqQjLhTIL8w
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

            user_name=Phyllis+Bahringer&password=lKEQ0tvHX3T0oZtf

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2MSwiZXhwIjoxNTk2OTc3MDQwfQ.SBnIHT3hkOv8Tn3_WwjwkzP7E5GYF4L-_m8ZaSQB1Ao"
            }

+ Request sign in with fail
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=invalid&password=invalid

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/sign_in"
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
    + project_id: `13157` (number, required)

+ Request show list of tasks and return status code 200
**GET**&nbsp;&nbsp;`/api/v1/projects/13157/tasks?project_id=13157`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2MiwiZXhwIjoxNTk2OTc3MDQwfQ.jj3NYCygtfVYn7orLtdBpfEAhVE5hNsOlSzo_06CryE

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "10196",
                  "type": "task",
                  "attributes": {
                    "name": "qui",
                    "position": 1,
                    "deadline": "2020-08-10T12:44:00.340Z",
                    "done": false,
                    "created_at": "2020-08-08T12:44:00.340Z",
                    "updated_at": "2020-08-08T12:44:00.340Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "13157",
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
                  "id": "10197",
                  "type": "task",
                  "attributes": {
                    "name": "earum",
                    "position": 2,
                    "deadline": "2020-08-10T12:44:00.348Z",
                    "done": false,
                    "created_at": "2020-08-08T12:44:00.348Z",
                    "updated_at": "2020-08-08T12:44:00.348Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "13157",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/13158/tasks?project_id=13158`

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
                    "pointer": "/api/v1/projects/13158/tasks"
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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2NCwiZXhwIjoxNTk2OTc3MDQwfQ.il9BiQZ-QnLYepX0X0D-1iWkWk0hokpEmxoTJWhqCgE

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
    + project_id: `13160` (number, required)
    + id: `10202` (number, required)

+ Request return tasks of project
**GET**&nbsp;&nbsp;`/api/v1/projects/13160/tasks/10202?id=10202&project_id=13160`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2NSwiZXhwIjoxNTk2OTc3MDQwfQ.e9I7sMVGsH-kWqjIFgH5zBmlkyI9ChGIi3UlbPE7xkg

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10202",
                "type": "task",
                "attributes": {
                  "name": "quis",
                  "position": 1,
                  "deadline": "2020-08-10T12:44:00.713Z",
                  "done": false,
                  "created_at": "2020-08-08T12:44:00.714Z",
                  "updated_at": "2020-08-08T12:44:00.714Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13160",
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
**GET**&nbsp;&nbsp;`/api/v1/projects/13161/tasks/0?id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2NiwiZXhwIjoxNTk2OTc3MDQwfQ.gsT8nppSNZXmRL332lLWHOngCXcy5l8evdOPncPWq4s

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/13161/tasks/0"
                  },
                  "detail": "Record not found",
                  "status": "not_found"
                }
              ]
            }

### Create tasks [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `13162` (number, required)

+ Request create new task and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/13162/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2NywiZXhwIjoxNTk2OTc3MDQwfQ.a7zwsmGx7Trj118nOvRZO-GkqjEAPdvUi5L0HmWIFVE
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=13162&name=dolores&deadline=2020-08-10T15%3A44%3A00%2B03%3A00

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10203",
                "type": "task",
                "attributes": {
                  "name": "dolores",
                  "position": 1,
                  "deadline": "2020-08-10T12:44:00.000Z",
                  "done": false,
                  "created_at": "2020-08-08T12:44:00.998Z",
                  "updated_at": "2020-08-08T12:44:00.998Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13162",
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
**POST**&nbsp;&nbsp;`/api/v1/projects/13163/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2OCwiZXhwIjoxNTk2OTc3MDQxfQ.dzpWcxBDvyGlW6MZQzh5mCu4QwkMMAK-lOhmRQoTW8g
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=13163&name=

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
    + project_id: `13164` (number, required)
    + id: `10204` (number, required)

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/13164/tasks/10204`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU2OSwiZXhwIjoxNTk2OTc3MDQxfQ.HQxNCKhiHWTELuDKpKbLwjjQSMCiaT3bN64M00g54NQ
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10204&name=voluptatem

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10204",
                "type": "task",
                "attributes": {
                  "name": "voluptatem",
                  "position": 1,
                  "deadline": "2020-08-10T12:44:01.229Z",
                  "done": false,
                  "created_at": "2020-08-08T12:44:01.230Z",
                  "updated_at": "2020-08-08T12:44:01.251Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13164",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/13165/tasks/10205`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU3MCwiZXhwIjoxNTk2OTc3MDQxfQ.F_5JDkvfQoDjGnIlNDrzqQfV9mwCE5xeYkRPGweFtVE
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10205&deadline=2020-08-10T15%3A44%3A01%2B03%3A00

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10205",
                "type": "task",
                "attributes": {
                  "name": "ut",
                  "position": 1,
                  "deadline": "2020-08-10T12:44:01.000Z",
                  "done": false,
                  "created_at": "2020-08-08T12:44:01.366Z",
                  "updated_at": "2020-08-08T12:44:01.387Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13165",
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
**PUT**&nbsp;&nbsp;`/api/v1/projects/13166/tasks/10206`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU3MSwiZXhwIjoxNTk2OTc3MDQxfQ.Zh8DUsGMA-A4UUeMWKKdfCQUXqPzmdloAP6wi_dH6yg
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10206&name=

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
    + project_id: `13167` (number, required)
    + id: `10207` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/13167/tasks/10207`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU3MiwiZXhwIjoxNTk2OTc3MDQxfQ.EBtCWQNMO8dSTLdMO7WeJnBtfLXV3m_O5HTWzA3iAu8
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10207

+ Response 200

    + Headers

            Content-Type: application/json

+ Request task will be deleted with fail
**DELETE**&nbsp;&nbsp;`/api/v1/projects/13168/tasks/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU3MywiZXhwIjoxNTk2OTc3MDQxfQ.VNJmDQSqwcNKH5SYPPt61S0IhW3bNZ1IkkzzYIeIY_w
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
                    "pointer": "/api/v1/projects/13168/tasks/0"
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
    + project_id: `13141` (number, required)
    + task_id: `10183` (number, required)
    + id: `10183` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13141/tasks/10183/complete/10183`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0NSwiZXhwIjoxNTk2OTc3MDM4fQ.Zm2_GVIH5qSw14RsUyHU6H8EcLj0Y67Nht6HDqoo6-E
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10183&done=true

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10183",
                "type": "task",
                "attributes": {
                  "name": "alias",
                  "position": 1,
                  "deadline": "2020-08-10T12:43:58.406Z",
                  "done": true,
                  "created_at": "2020-08-08T12:43:58.406Z",
                  "updated_at": "2020-08-08T12:43:58.431Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13141",
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
    + project_id: `13142` (number, required)
    + task_id: `10185` (number, required)
    + id: `10185` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13142/tasks/10185/position/10185`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0NiwiZXhwIjoxNTk2OTc3MDM4fQ.dipq7qjOtt5XsLxj5hfk-HSe63QG0RQ8t1Bmwxftlwo
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10185&position=move_up

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10185",
                "type": "task",
                "attributes": {
                  "name": "facilis",
                  "position": 1,
                  "deadline": "2020-08-10T12:43:58.595Z",
                  "done": false,
                  "created_at": "2020-08-08T12:43:58.596Z",
                  "updated_at": "2020-08-08T12:43:58.663Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13142",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13143/tasks/10188/position/10188`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0NywiZXhwIjoxNTk2OTc3MDM4fQ.MA48F5KNqOP6_mQ3ihwpjf1XOGnq_JORr5OQuBWnfMM
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10188&position=move_down

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "10188",
                "type": "task",
                "attributes": {
                  "name": "rerum",
                  "position": 3,
                  "deadline": "2020-08-10T12:43:58.789Z",
                  "done": false,
                  "created_at": "2020-08-08T12:43:58.789Z",
                  "updated_at": "2020-08-08T12:43:58.849Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "13143",
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
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13144/tasks/10191/position/10191`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0OCwiZXhwIjoxNTk2OTc3MDM4fQ.AebJpkXGz5dlPKxAy_NPBXYK1HHd12sJZD6HT_Gry3c
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=10191&position=sint

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/13144/tasks/10191/position/10191"
                  },
                  "detail": "Wrong postion parameter",
                  "status": "unprocessable_entity"
                }
              ]
            }

+ Request do not update position, invalid id task
**PATCH**&nbsp;&nbsp;`/api/v1/projects/13145/tasks/0/position/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxMzU0OSwiZXhwIjoxNTk2OTc3MDM5fQ.rgfxu966H6bFR3bP3JxOZIP3FbmSrAnbGExywE1-yXM
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
                    "pointer": "/api/v1/projects/13145/tasks/0/position/0"
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

            user_name=Melda+Purdy&password=WKcmTz0shR&password_confirmation=WKcmTz0shR

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "13574",
                "type": "user",
                "attributes": {
                  "user_name": "Melda Purdy",
                  "password_digest": "$2a$04$tNcrK0YejLbTDOp0Kp9EfOvoIc6rQIQxFv7y3LR0yp.IYEgBcmWWe",
                  "created_at": "2020-08-08T12:44:01.632Z",
                  "updated_at": "2020-08-08T12:44:01.632Z"
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

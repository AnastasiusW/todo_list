

# Group Authentication


## Authentication [/sign_in]


### Sign in user [POST /api/v1/sign_in]


+ Request sign in with success
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user_name=harold.weissnat&password=spXRerSCp

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDQ5LCJleHAiOjE1OTUwODQxMDZ9.rKzzYmUEzGAT295ItMmuuscLKakMyuUdmrWZqdgLY6k"
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

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request return all list of projects of current user
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDUwLCJleHAiOjE1OTUwODQxMDZ9.Zye1chvoFxzUDtUwOOvrcfsLOtvobrrWnwFNcKGocUo

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1422",
                  "type": "project",
                  "attributes": {
                    "name": "omnis",
                    "created_at": "2020-07-17T14:55:06.520Z",
                    "updated_at": "2020-07-17T14:55:06.520Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1450",
                        "type": "user"
                      }
                    }
                  }
                },
                {
                  "id": "1423",
                  "type": "project",
                  "attributes": {
                    "name": "praesentium",
                    "created_at": "2020-07-17T14:55:06.529Z",
                    "updated_at": "2020-07-17T14:55:06.529Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1450",
                        "type": "user"
                      }
                    }
                  }
                },
                {
                  "id": "1424",
                  "type": "project",
                  "attributes": {
                    "name": "aut",
                    "created_at": "2020-07-17T14:55:06.537Z",
                    "updated_at": "2020-07-17T14:55:06.537Z"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "1450",
                        "type": "user"
                      }
                    }
                  }
                }
              ]
            }

### Show project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `1425` (number, required)

+ Request return project of current user
**GET**&nbsp;&nbsp;`/api/v1/projects/1425?id=1425`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDUxLCJleHAiOjE1OTUwODQxMDZ9.O6LUkYczrm1hWyQs6Q1LQoXl18lnOcLyxSQ4v_zTEC8

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1425",
                "type": "project",
                "attributes": {
                  "name": "aperiam",
                  "created_at": "2020-07-17T14:55:06.661Z",
                  "updated_at": "2020-07-17T14:55:06.661Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1451",
                      "type": "user"
                    }
                  }
                }
              }
            }

### Create projects [POST /api/v1/projects]


+ Request create project and return status 201
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDUyLCJleHAiOjE1OTUwODQxMDZ9.nH2g7k-LKXWP0scpYnsug3DRsZeAqkaVwOD6kamWlhA
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=ipsa

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1426",
                "type": "project",
                "attributes": {
                  "name": "ipsa",
                  "created_at": "2020-07-17T14:55:06.751Z",
                  "updated_at": "2020-07-17T14:55:06.751Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1452",
                      "type": "user"
                    }
                  }
                }
              }
            }

+ Request test fail, because inputs exist`s project name, return status 422
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDUzLCJleHAiOjE1OTUwODQxMDZ9.-0sOjAlyZkjDKRA1tis9M9toR2HWl8X-PpUdoxzjtXc
            Content-Type: application/x-www-form-urlencoded

    + Body

            name=voluptatem

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
    + id: `1428` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1428`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDU0LCJleHAiOjE1OTUwODQxMDZ9.UHAwEKyEHPcm3oK5CmSByfRsNxg4ePhkn2yQYIrb-vY
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1428&name=dignissimos

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1428",
                "type": "project",
                "attributes": {
                  "name": "dignissimos",
                  "created_at": "2020-07-17T14:55:06.889Z",
                  "updated_at": "2020-07-17T14:55:06.907Z"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1454",
                      "type": "user"
                    }
                  }
                }
              }
            }

+ Request with fails, because name is empty, return status 422
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1429`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDU1LCJleHAiOjE1OTUwODQxMDZ9.83m_j_CNZxg7SU-izzAelZ7K_yjhe1tp0iCLCscIcZ4
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1429&name=

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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDU2LCJleHAiOjE1OTUwODQxMDd9.TNiuY915WkpfUhXigVwhR7ItUT-BqXlgDWB-25IjJCQ
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
    + id: `1430` (number, required)

+ Request project will be destroyed with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1430`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDU3LCJleHAiOjE1OTUwODQxMDd9.3Ae_FndUv5U0nUpV2oE6gTYSnh5iVFcqGh9Zt3O2tsE
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1430

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
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDU4LCJleHAiOjE1OTUwODQxMDd9.QMt25AZMYeZ8O31zDZhbmsA_UavufBHLF9kvivwF1jA
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
    + project_id: `1432` (number, required)

+ Request show list of tasks and return status code 201
**GET**&nbsp;&nbsp;`/api/v1/projects/1432/tasks?project_id=1432`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDU5LCJleHAiOjE1OTUwODQxMDd9.5euoMvLptZICU7WcRzYLmnUSCSkD3G4DZJXcpSN1DFY

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1693",
                  "type": "task",
                  "attributes": {
                    "name": "unde",
                    "position": 1,
                    "deadline": "2020-07-19T14:55:07.234Z",
                    "done": false,
                    "created_at": "2020-07-17T14:55:07.236Z",
                    "updated_at": "2020-07-17T14:55:07.236Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "1432",
                        "type": "project"
                      }
                    }
                  }
                },
                {
                  "id": "1694",
                  "type": "task",
                  "attributes": {
                    "name": "consectetur",
                    "position": 2,
                    "deadline": "2020-07-19T14:55:07.244Z",
                    "done": false,
                    "created_at": "2020-07-17T14:55:07.245Z",
                    "updated_at": "2020-07-17T14:55:07.245Z"
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "1432",
                        "type": "project"
                      }
                    }
                  }
                }
              ]
            }

### Show task [GET /api/v1/projects/{project_id}/tasks/{id}]

+ Parameters
    + project_id: `1433` (number, required)
    + id: `1695` (number, required)

+ Request return tasks of project
**GET**&nbsp;&nbsp;`/api/v1/projects/1433/tasks/1695?id=1695&project_id=1433`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDYwLCJleHAiOjE1OTUwODQxMDd9.BdwaiiOGsdUjyDCBHo3UEtnzej3Qm5LtpAtcBQ7ypWU

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1695",
                "type": "task",
                "attributes": {
                  "name": "ipsam",
                  "position": 1,
                  "deadline": "2020-07-19T14:55:07.357Z",
                  "done": false,
                  "created_at": "2020-07-17T14:55:07.358Z",
                  "updated_at": "2020-07-17T14:55:07.358Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1433",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request do not show task
**GET**&nbsp;&nbsp;`/api/v1/projects/1434/tasks/0?id=0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDYxLCJleHAiOjE1OTUwODQxMDd9.MTDjDJzcWLpE3ZRmaeoV03p5uTwj55oeWKfjkLMx47s

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
    + project_id: `1435` (number, required)

+ Request create new task and return status code 201
**POST**&nbsp;&nbsp;`/api/v1/projects/1435/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDYyLCJleHAiOjE1OTUwODQxMDd9.wY0wQHwMcDd8_Lhf5r1bo2N49f-DY5zFfp-F-jqyWMU
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=1435&name=vitae&deadline=2020-07-19T17%3A55%3A07%2B03%3A00

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1696",
                "type": "task",
                "attributes": {
                  "name": "vitae",
                  "position": 1,
                  "deadline": "2020-07-19T14:55:07.000Z",
                  "done": false,
                  "created_at": "2020-07-17T14:55:07.523Z",
                  "updated_at": "2020-07-17T14:55:07.523Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1435",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request do not create task, because inputs empty task name
**POST**&nbsp;&nbsp;`/api/v1/projects/1436/tasks`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDYzLCJleHAiOjE1OTUwODQxMDd9.MPPP-MSV_Tx_ECTd1YJVPVSwXcDyVeXX1GW6GCazOD8
            Content-Type: application/x-www-form-urlencoded

    + Body

            project_id=1436&name=

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
    + project_id: `1437` (number, required)
    + id: `1697` (number, required)

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/1437/tasks/1697`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDY0LCJleHAiOjE1OTUwODQxMDd9.-WtvDtIUIVpuu33Hs4_g6KrlBJrfkMQavYgI9mumGhI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1697&name=sunt

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1697",
                "type": "task",
                "attributes": {
                  "name": "sunt",
                  "position": 1,
                  "deadline": "2020-07-19T14:55:07.683Z",
                  "done": false,
                  "created_at": "2020-07-17T14:55:07.684Z",
                  "updated_at": "2020-07-17T14:55:07.705Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1437",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request update task and return status 200
**PUT**&nbsp;&nbsp;`/api/v1/projects/1438/tasks/1698`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDY1LCJleHAiOjE1OTUwODQxMDd9.td4rvZioCrHXLUEOOva3ggUNJ88qqNN6MsxeRphUTRE
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1698&deadline=2020-07-19T17%3A55%3A07%2B03%3A00

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1698",
                "type": "task",
                "attributes": {
                  "name": "eaque",
                  "position": 1,
                  "deadline": "2020-07-19T14:55:07.000Z",
                  "done": false,
                  "created_at": "2020-07-17T14:55:07.774Z",
                  "updated_at": "2020-07-17T14:55:07.795Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1438",
                      "type": "project"
                    }
                  }
                }
              }
            }

### Update position [PATCH /api/v1/projects/{project_id}/tasks/{id}/position]

+ Parameters
    + project_id: `1439` (number, required)
    + id: `1700` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1439/tasks/1700/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDY2LCJleHAiOjE1OTUwODQxMDd9.h_jPTvV_uFrPnBoRJOrLQqztqVNC5u6ngxQsGqcHjcs
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1700&position=move_up

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1700",
                "type": "task",
                "attributes": {
                  "name": "error",
                  "position": 1,
                  "deadline": "2020-07-19T14:55:07.894Z",
                  "done": false,
                  "created_at": "2020-07-17T14:55:07.895Z",
                  "updated_at": "2020-07-17T14:55:07.965Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1439",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1440/tasks/1703/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDY3LCJleHAiOjE1OTUwODQxMDh9.cclqlv6wm04ciP89wSKmlCndGYbWYc7mDGv7-xN5i3M
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1703&position=move_down

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1703",
                "type": "task",
                "attributes": {
                  "name": "sint",
                  "position": 3,
                  "deadline": "2020-07-19T14:55:08.050Z",
                  "done": false,
                  "created_at": "2020-07-17T14:55:08.051Z",
                  "updated_at": "2020-07-17T14:55:08.115Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1440",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request do not update position
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1441/tasks/1706/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDY4LCJleHAiOjE1OTUwODQxMDh9.BNRH3eMYsF1omkJMcYg8EgELveAQJK5H3Fu1dpFiJLI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1706&position=corrupti

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
            
              ]
            }

+ Request do not update position
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1442/tasks/0/position`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDY5LCJleHAiOjE1OTUwODQxMDh9.ukbEC5fXi0CsxoIM2TlUqM4uqXkVEIN9YN9Doj0V1lg
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
    + project_id: `1443` (number, required)
    + id: `1711` (number, required)

+ Request update task and return status 200
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1443/tasks/1711/complete`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDcwLCJleHAiOjE1OTUwODQxMDh9.TLGSMsjJu81dr2w7iRFfOL1PbFHb05PBVitCeIg5XYI
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1711&done=true

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1711",
                "type": "task",
                "attributes": {
                  "name": "quisquam",
                  "position": 1,
                  "deadline": "2020-07-19T14:55:08.404Z",
                  "done": true,
                  "created_at": "2020-07-17T14:55:08.405Z",
                  "updated_at": "2020-07-17T14:55:08.433Z"
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1443",
                      "type": "project"
                    }
                  }
                }
              }
            }

+ Request do not update complete
**PATCH**&nbsp;&nbsp;`/api/v1/projects/1444/tasks/0/complete`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDcxLCJleHAiOjE1OTUwODQxMDh9.7X-FMTHV4qNmoUkjAvtYZ9D3racaILmIvKyfjDMar-o
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1712&done=

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
    + project_id: `1445` (number, required)
    + id: `1713` (number, required)

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1445/tasks/1713`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDcyLCJleHAiOjE1OTUwODQxMDh9.3DDNfqHWkDkclEZf6zX7yFCcEh4VfE9l_vYnguaQVN0
            Content-Type: application/x-www-form-urlencoded

    + Body

            id=1713

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
            }

+ Request task will be deleted with success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/1446/tasks/0`

    + Headers

            Accept: application/json
            Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNDczLCJleHAiOjE1OTUwODQxMDh9.qDA5c416ah8aLwN0qItI_dgiTAw8bXieRbDEtgsPY4Q
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

            user_name=rory_yost&password=B5cpO74DoU_MkgX&password_confirmation=B5cpO74DoU_MkgX

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1474",
                "type": "user",
                "attributes": {
                  "user_name": "rory_yost",
                  "password_digest": "$2a$04$h2xC8gY77sFyOtv9If2kI.QOakQhgmucbe2OpWgSwlIlbxIru4SoS",
                  "created_at": "2020-07-17T14:55:08.787Z",
                  "updated_at": "2020-07-17T14:55:08.787Z"
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

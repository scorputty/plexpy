#!/usr/bin/env bats

@test "Opening PlexPy on port 8181" {
  skip
  curl -I -s -X GET http://localhost:8181 |grep 302
  [ "$status" -eq 0 ]
}

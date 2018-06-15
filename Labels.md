1. Create label

REQUEST:

POST https://api.github.com/repos/felvis/test/labels
HEADERS: Content-Type, Authorization
BODY:
{
  "name": "Approved for Merge",
  "description": "Houston, we accept this pull request",
  "color": "6cc644"
}

RESPONSE:
{
    "id": 958229061,
    "node_id": "MDU6TGFiZWw5NTgyMjkwNjE=",
    "url": "https://api.github.com/repos/felvis/test/labels/Approved%20for%20Merge",
    "name": "Approved for Merge",
    "color": "6cc644",
    "default": false
}

2. Get Pull-request as ISSUE (this is fckin important)

REQUEST:

GET https://api.github.com/repos/felvis/test/issues/1 // (<--- this is pull-request ID. Actually, Pull request is some kind of special issue)
HEADERS: Content-Type, Authorization

RESPONSE
{
    "url": "https://api.github.com/repos/felvis/test/issues/1",
    "repository_url": "https://api.github.com/repos/felvis/test",
    "labels_url": "https://api.github.com/repos/felvis/test/issues/1/labels{/name}",
    "comments_url": "https://api.github.com/repos/felvis/test/issues/1/comments",
    "events_url": "https://api.github.com/repos/felvis/test/issues/1/events",
    "html_url": "https://github.com/felvis/test/pull/1",
    "id": 322628265,
    "node_id": "MDExOlB1bGxSZXF1ZXN0MTg3NjkwOTQy",
    "number": 1,
    "title": "Update README.md",
    "user": {
        "login": "felvis",
        "id": 3450345,
        "node_id": "MDQ6VXNlcjM0NTAzNDU=",
        "avatar_url": "https://avatars0.githubusercontent.com/u/3450345?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/felvis",
        "html_url": "https://github.com/felvis",
        "followers_url": "https://api.github.com/users/felvis/followers",
        "following_url": "https://api.github.com/users/felvis/following{/other_user}",
        "gists_url": "https://api.github.com/users/felvis/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/felvis/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/felvis/subscriptions",
        "organizations_url": "https://api.github.com/users/felvis/orgs",
        "repos_url": "https://api.github.com/users/felvis/repos",
        "events_url": "https://api.github.com/users/felvis/events{/privacy}",
        "received_events_url": "https://api.github.com/users/felvis/received_events",
        "type": "User",
        "site_admin": false
    },
    "labels": [],
    "state": "open",
    "locked": false,
    "assignee": null,
    "assignees": [],
    "milestone": null,
    "comments": 0,
    "created_at": "2018-05-13T21:21:26Z",
    "updated_at": "2018-05-13T21:21:26Z",
    "closed_at": null,
    "author_association": "OWNER",
    "pull_request": {
        "url": "https://api.github.com/repos/felvis/test/pulls/1",
        "html_url": "https://github.com/felvis/test/pull/1",
        "diff_url": "https://github.com/felvis/test/pull/1.diff",
        "patch_url": "https://github.com/felvis/test/pull/1.patch"
    },
    "body": "",
    "closed_by": null
}

3. Add new label to pull-request

REQUEST:

POST https://api.github.com/repos/felvis/test/issues/1/labels
HEADERS: Content-Type, Authorization
BODY:
["Approved for Merge"]

RESPONSE:
```[
    {
        "id": 958229061,
        "node_id": "MDU6TGFiZWw5NTgyMjkwNjE=",
        "url": "https://api.github.com/repos/felvis/test/labels/Approved%20for%20Merge",
        "name": "Approved for Merge",
        "color": "6cc644",
        "default": false
    }
]

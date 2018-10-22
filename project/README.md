# DevTest Project

## Usage

Rails defaults

- setup: `bin/setup`
- running: `bin/rails s`
- tests: `bin/rails test`

## API access token

The API access token is static, located in encrypted Rails secrets.
To make API calls to protected endpoints please use the following token: `c2VjdXJlX2FjY2Vzc190b2tlbg`,
passed as `Authorization` header.

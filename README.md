# mastodon-saml

SAML-authenticating Mastodon Server Example

## Prerequisites

* [Docker](https://www.docker.com)

## Quick start

1. Start the services: `make serve`

2. Login to the Mastodon server at https://localhost

| SAML Username | SAML Password   | Name           | Role      |
| ------------- |---------------- | -------------- | --------- |
| oliviao       | oliviapass      | Olivia Owner   | Owner     |
| aliceo        | alicepass       | Alice Admin    | Admin     |
| mikem         | mikepass        | Mike Moderator | Moderator |
| niajn         | niajpass        | Niaj Newbie    | (None)    |

3. To log out of the SAML IdP (for example, to switch SAML users),
   go to <http://localhost:8080/simplesaml/module.php/core/authenticate.php?as=example-userpass&logout>

4. To stop and remove all of the containers and data volumes, run `make clean`.

## Notes

* Mastodon is confifgured by setting environment variables in `config/mastodon/.env`.
* SAML users are defined in `config/idp/authsources.php`. Users with roles are precreated in the `Makefile`, in the `setup`
  target.
* User accounts can be created in two ways:
  1. on-demand (at user signup, or on the user's first SSO login),
  2. or pre-created using the `tootctl` CLI
* If a user account is created on-demand, then it won't have any roles attached. (It appears there's no way to specify default
  roles for new accounts, and Mastodon doesn't consume roles from the SAML assertion.)
* If a user account is pre-created, then the account's display name will default to the account name, though the user
  can modify their display name later. (The `tootctl` CLI doesn't allow specifying the display name when creating or modifying
  user accounts. Maybe the API allows setting the display name.)
* If the use account is created on-demand, then the display name is initialized from an attribute in the SAML assertion, but
  the user can stil modify their display name later.

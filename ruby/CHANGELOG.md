# 0.6.0

- Update `media_types` to `0.6.0` so that the integrations become available downstream.
- Rename all `deleted_at` to `expires_at` (#1)
- Add `Types::HttpsUrl`, `Types::InfluxDbConnectionUrl`, `Types.makeFormattedUrl`, `Types.Iso8601` to check format of string attributes. (#2)
- Add documentation for `updated_at` fields (#4)
- Add expected type for `ProductLookup` `identifier` (#5)
- Remove optional nil for analytics and metrics url by changing the type (#3)

# 0.5.0

:baby: initial public release. Not considered stable until version 1.0.0.

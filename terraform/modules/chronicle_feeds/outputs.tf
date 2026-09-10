output "feed_names" {
  value       = { for k, v in google_chronicle_feed.feeds : k => v.name }
  description = "Map of managed feed keys to their Google Cloud Chronicle resource names."
}

output "feed_count" {
  value       = length(google_chronicle_feed.feeds)
  description = "Total number of feeds managed by this module."
}

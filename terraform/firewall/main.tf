resource "google_compute_firewall" "haproxy" {
  name        = "haproxy-image"
  description = "Allow Connection to haproxy"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["1936"]
  }

  target_tags   = ["haproxy-image"]
}

resource "google_compute_firewall" "postgres" {
  name        = "postgres-db"
  description = "Allow Connection to postgres"
  network     = "default"

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  target_tags   = ["postgres-db"]
}

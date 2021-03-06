import os

# Define releases and variants
latest_civicrm_release = os.popen(
    "curl -s https://latest.civicrm.org/stable.php"
).read()
civi_releases = [latest_civicrm_release]
cms_variants = [
    "drupal",
    "wordpress",
]  # Skip backdrop for now since Dockerfile is broken
php_releases = ["7.3", "7.4"]
defaults = {"civi": latest_civicrm_release, "cms": "drupal", "php": "7.3"}

#!/bin/sh
# Generate one static HTML file per persona clean-path from persona.html.
#
# Why: Cloudflare Pages rewrites (_redirects "200") to a .html target get turned
# into 308 redirects to the clean URL, so /commercial-bank-general lands on
# /persona and the path-based copy swap loses the persona. Serving a real file at
# each clean URL sidesteps that entirely — persona.html reads location.pathname,
# which is now the real persona slug.
#
# Run this after editing persona.html, then commit the regenerated files.
set -e
cd "$(dirname "$0")"

slugs="
commercial-bank-general
commercial-bank-product-manager
commercial-bank-strategy-sales
commercial-bank-risk-compliance
retail-bank-general
retail-bank-treasury-management
retail-bank-product-management
retail-bank-risk-compliance
"

for slug in $slugs; do
  cp persona.html "$slug.html"
done

echo "Generated 8 persona pages from persona.html"

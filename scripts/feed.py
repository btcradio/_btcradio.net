#!/usr/bin/env python3
import feedparser

feed_rss_url = "http://feeds.feedburner.com/TheDailyBitcoinShow?format=xml"
feed = feedparser.parse( feed_rss_url )


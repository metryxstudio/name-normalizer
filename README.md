# Name Normalizer

A Google Tag Manager variable template for both web and server containers that normalizes first and last names for server-side tracking by removing spaces, punctuation, and numbers while preserving UTF-8 characters.

## Overview

This template prepares names for hashing and sending to advertising platforms like Facebook CAPI, Google Ads, and TikTok. It follows platform normalization requirements while preserving international characters.

## Installation

1. In your GTM container (web or server-side), go to **Templates** → **Variable Templates** → **Search Gallery**
2. Search for "Name Normalizer"
3. Click **Add to workspace**

## Configuration

| Field | Description |
|-------|-------------|
| **Raw Name** | First name or last name in its original form |

## Examples

| Input | Output |
|-------|--------|
| `John` | `john` |
| ` MARY JANE ` | `maryjane` |
| `O'Connor` | `oconnor` |
| `Müller-Schmidt` | `müllerschmidt` |
| `José-María` | `josémaría` |
| `Željko Šimić` | `željkošimić` |
| `Dr. Smith` | `drsmith` |
| `John123` | `john` |
| `12345` | `undefined` |

## Features

- Converts to lowercase
- Removes all spaces (leading, trailing, and internal)
- Removes punctuation (`' " - . , ; : ! ?` etc.)
- Removes numbers
- **Preserves UTF-8 characters** (accents, umlauts, diacritics)
- Returns `undefined` for empty or invalid input
- Compliant with Facebook, Google, and TikTok normalization requirements

## Supported Characters

The template preserves international characters including:
- French: é, è, ê, ë, à, â, ç, etc.
- German: ä, ö, ü, ß
- Spanish: ñ, á, é, í, ó, ú
- Croatian: č, ć, đ, š, ž
- Polish: ą, ę, ł, ń, ó, ś, ź, ż
- And many more...

## Usage Example

1. Create two variables using this template (one for first name, one for last name)
2. Set **Raw Name** to your data source (e.g., `{{Event Data - first_name}}`)
3. Use the normalized output in your tracking tags or hash it for CAPI

## Compatibility

This template works in both:
- **Web GTM** containers
- **Server-side GTM** containers

## Author

**Metryx Studio**  
Website: [metryx.studio](https://metryx.studio)  
Contact: filip@metryx.studio

## License

Apache License 2.0

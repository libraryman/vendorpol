# vendorpol

URLs for vendor privacy policies and terms of use, and whether creating an account is optional or mandatory.

## Data

* title: name of the product
* product_type: (Index/Database, E-Book Package, E-Journals, E-Video Collection)
* vendor: name of vendor
* account: is account required to use the product? ("", optional, mandatory)
* privacy_url: URL of privacy policy (or "")
* tc_url: URL of terms and conditions (or "")
* notes

Data collected by Stephanie Power, of York University Libraries, during 2018–2019.

## Usage

Requires Ruby.

To generate HTML:

    $ ./generate.rb > tmp.html

On a Unix-type copy the HTML into your clipboard with [xsel](https://github.com/kfish/xsel):

    $ xsel -b < tmp.html

Now you can easily paste the HTML into your content management system.

## To do

* Script to generate a list of products missing privacy or T&C URLs
* Normalize vendor names
* Generate Markdown version?
* Put explanatory text in a separate file and read it in
* Think about how to handle different institutions with different holdings using this

## License

[CC-0](https://creativecommons.org/publicdomain/zero/1.0/) (no copyright).

# FinanceAds - GTM Web Tag Template

Google Tag Manager web tag template for [FinanceAds](https://financeads.net) affiliate conversion tracking.

Fires a tracking pixel to `financeads.net/tl.php` on your conversion page to report leads and sales back to the FinanceAds affiliate network.

## Features

- Sale, lead, newsletter signup, and onboarding start conversion tracking
- Simple image pixel (no external JavaScript required)
- Optional sub ID for tracking segmentation
- Debug logging in GTM Preview mode

## Installation

### From the Community Template Gallery (recommended)

1. In your GTM container, go to **Templates** > **Search Gallery**
2. Search for **FinanceAds**
3. Click **Add to workspace**

### Manual installation

1. Download `template.tpl` from this repository
2. In GTM, go to **Templates** > **New**
3. Click the three-dot menu > **Import**
4. Select the downloaded file

## Setup

1. Create a new tag using the **FinanceAds** template
2. Configure the fields:

| Field | Required | Description |
|-------|----------|-------------|
| Program ID | Yes | Your FinanceAds program ID (`p` parameter) |
| Order ID | Yes | Unique order or transaction ID (`oid` parameter) |
| Order Category | Yes | Type of conversion: Sale, Lead, Newsletter signup, or Onboarding start (`ocategory` parameter) |
| Sub ID | No | Optional sub ID for segmentation (`s_id` parameter) |

3. Set the trigger to fire on your conversion/thank-you page
4. Enable **Debug logging** during testing (under the Debugging section)

## Pixel format

The tag fires the following image pixel:

```
https://www.financeads.net/tl.php?p={programId}&oid={orderId}&ocategory={orderCategory}&s_id={subId}
```

## Permissions

| Permission | Scope | Reason |
|------------|-------|--------|
| Send Pixel | `https://www.financeads.net/tl.php*` | Fires the conversion tracking pixel |
| Logging | Debug environment | Console logging in Preview mode |

## Resources

- [FinanceAds website](https://financeads.net)
- [FinanceAds International](https://financeads.com)

## Author

Created and maintained by [Freek Kampen](https://freekkampen.com) at [New North Digital](https://newnorth.digital?utm_source=github&utm_medium=referral&utm_campaign=gtm-templates).

## License

Apache License 2.0 - see [LICENSE](LICENSE).

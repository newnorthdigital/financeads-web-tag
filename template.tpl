___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "FinanceAds",
  "categories": ["AFFILIATE_MARKETING", "CONVERSIONS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "New North Digital",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADKElEQVR4nL2XW0gUURzGv5m9eMlZsXTxIZTcCtPC8pKmIfRQgpkRBAWSpRi99JIQ9RBI5EMFRS8WuayZgZJhhr1phCla7mqr2QUVK7VWMY1WTfeiO3EGWj3ubWZ1/Z52vzPM75tz/nPmfxie53lsoF61vEZHRyeO5uUiNTUZ8o2Ed3UZ0NDQKPx+XP0EDMOA2agZIPDqRzWUp1arPcwAz8NqGsevunpYvo3AYbGIBjEKBeLu3IRsU6hXOFHWwQOuAf5++Iih8xcx19sHqWJDQrCnuUkU/FxRIdLT0+gAUw0vMHCmBPzSkt9wbn+qaDiRswbMb9rRn3NcmH6/4C0vwaWlOL1uQw90umqvcGcAfnER+th42KemqYuDYmMQnp0FWUiIRzjJH11ciLDkvU7PaOyFtrJKGPMGJxKWYLqxyQW+veIuoovPAiwrZhJWwPtEw4UASzMzMD3QUubm3BxElxRJAi/DdaLhRKx96jcsQ8OUue1WuR/wXlFwx/w8HYC32+GwWClTHq6SBn/fi8qHvuGzhh4Ml16lA4AhpbjqjgwjCa7VVrn47uD9h4+BPDAdYA0Spl3ru+Bm9d0C3LGw4HIP1n+4uGqf6zGi/0i+W7jfAaRU+0RVjUc4keTPsZRNhojxsY/IJVd7pc7F9/ae+xK73tUekABGkdUekABjYz8krfm6B/j86UvA4KICZGZmQKlUBgROJBf24VVbr8O2vF1yKg43ysvQ2tqGxMQEaDRxkgAOm82lZ1wpVqbioFCrKZN0RyulUqmQn58nGU66q9m3esoKjo2hAyjVUVBlZVDm19IrsI6OYa2arH2K+YFBylMXnKL+M6Qjs/40waDZTfWD8ogIaO7dRvihbLDBweRxxFF5YNFsxmhZOSbrnlFDobvikWzspJac+d+UDhZdwGRtPQImhkFSewvVuBI534Id2gqEpewLGH+n7r4LnArAyOVIamtG5MkT6wqWcRwSntdBXXDa7Tjj7mxo+T6KkWvXMfNOD9vEBOCQdlZgg5QI1sQJze3Wy5cg48I8XuvxcEpORzbTOBb/mCUfVshsKqIioYjc4rO9+wcpCY8gXQcH5QAAAABJRU5ErkJggg=="
  },
  "description": "FinanceAds affiliate conversion tracking. Fires a tracking pixel to financeads.net on the conversion page to report leads and sales back to the affiliate network.",
  "containerContexts": ["WEB"]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "programId",
    "displayName": "Program ID",
    "simpleValueType": true,
    "help": "Your FinanceAds program ID (the 'p' parameter). Provided by your FinanceAds account manager.",
    "alwaysInSummary": true,
    "valueValidators": [{"type": "NON_EMPTY"}]
  },
  {
    "type": "TEXT",
    "name": "orderId",
    "displayName": "Order ID",
    "simpleValueType": true,
    "help": "Unique order or transaction ID (maps to the 'oid' parameter).",
    "alwaysInSummary": true,
    "valueValidators": [{"type": "NON_EMPTY"}]
  },
  {
    "type": "SELECT",
    "name": "orderCategory",
    "displayName": "Order Category",
    "macrosInSelect": true,
    "selectItems": [
      {"value": "sale", "displayValue": "Sale"},
      {"value": "lead", "displayValue": "Lead"},
      {"value": "newsletter", "displayValue": "Newsletter signup"},
      {"value": "onboardingStart", "displayValue": "Onboarding start"}
    ],
    "simpleValueType": true,
    "help": "The type of conversion event (maps to the 'ocategory' parameter). Select the category that matches your FinanceAds program configuration.",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "subId",
    "displayName": "Sub ID (optional)",
    "simpleValueType": true,
    "help": "Optional sub ID for additional tracking segmentation (maps to the 's_id' parameter). Leave empty if not used."
  },
  {
    "type": "GROUP",
    "name": "debugging",
    "displayName": "Debugging",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {"type": "CHECKBOX", "name": "debug", "checkboxText": "Log debug messages to console", "simpleValueType": true}
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var log = require('logToConsole');
var sendPixel = require('sendPixel');
var encodeUriComponent = require('encodeUriComponent');
var makeString = require('makeString');

var enableDebug = data.debug;
var debugLog = function(msg) {
  if (enableDebug) log('FinanceAds GTM - ' + msg);
};

var programId = makeString(data.programId);
var orderId = makeString(data.orderId);
var orderCategory = makeString(data.orderCategory || 'sale');

var pixelUrl = 'https://www.financeads.net/tl.php' +
  '?p=' + encodeUriComponent(programId) +
  '&oid=' + encodeUriComponent(orderId) +
  '&ocategory=' + encodeUriComponent(orderCategory);

if (data.subId) {
  pixelUrl = pixelUrl + '&s_id=' + encodeUriComponent(makeString(data.subId));
}

debugLog('Firing pixel for order: ' + makeString(data.orderId) + ', category: ' + makeString(data.orderCategory));

sendPixel(pixelUrl, function() {
  debugLog('Pixel sent successfully');
  data.gtmOnSuccess();
}, function() {
  debugLog('Pixel failed to send');
  data.gtmOnFailure();
});


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "vpiVersion": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.financeads.net/tl.php*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "vpiVersion": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: "Sale conversion pixel fires successfully"
  code: |-
    var mockData = {
      programId: '1428',
      orderId: 'ORD-12345',
      orderCategory: 'sale',
      subId: '',
      debug: false
    };

    mock('sendPixel', function(url, success, failure) {
      success();
    });

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();

- name: "Newsletter lead with sub ID"
  code: |-
    var mockData = {
      programId: '1428',
      orderId: 'NL-99001',
      orderCategory: 'newsletter',
      subId: 'homepage-form',
      debug: true
    };

    mock('sendPixel', function(url, success, failure) {
      success();
    });

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();

- name: "Pixel failure calls gtmOnFailure"
  code: |-
    var mockData = {
      programId: '1428',
      orderId: 'ORD-FAIL',
      orderCategory: 'sale',
      subId: '',
      debug: false
    };

    mock('sendPixel', function(url, success, failure) {
      failure();
    });

    runCode(mockData);

    assertApi('gtmOnFailure').wasCalled();

- name: "Onboarding start conversion without sub ID"
  code: |-
    var mockData = {
      programId: '5500',
      orderId: 'OB-2026-001',
      orderCategory: 'onboardingStart',
      debug: false
    };

    mock('sendPixel', function(url, success, failure) {
      success();
    });

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 2026-04-04 by New North Digital (newnorth.digital).

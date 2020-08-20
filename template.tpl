___INFO___

{
  "displayName": "dataLayer Builder w-Standard eCommerce",
  "description": "This is a simple dataLayer builder that allows you to add any custom parameters you want with the dropdown functionality to build Google's Standard Ecommerce dataLayer.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "data:text/html;base64,PHNjcmlwdD5hbGVydCgiWFNTIik7PC9zY3JpcHQ+Cg==",
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Event Name",
    "simpleValueType": true,
    "name": "event",
    "type": "TEXT",
    "valueHint": "Event name fired into dataLayer"
  },
  {
    "displayName": "Transaction Parameters",
    "name": "transactionParameters",
    "simpleTableColumns": [
      {
        "selectItems": [
          {
            "displayValue": "transactionId",
            "value": "transactionId"
          },
          {
            "displayValue": "transactionAffiliation",
            "value": "transactionAffiliation"
          },
          {
            "displayValue": "transactionTotal",
            "value": "transactionTotal"
          },
          {
            "displayValue": "transactionTax",
            "value": "transactionTax"
          },
          {
            "displayValue": "transactionShipping",
            "value": "transactionShipping"
          },
          {
            "displayValue": "transactionProducts",
            "value": "transactionProducts"
          }
        ],
        "defaultValue": "",
        "displayName": "key",
        "name": "name",
        "isUnique": true,
        "type": "SELECT"
      },
      {
        "defaultValue": "",
        "displayName": "value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "type": "SIMPLE_TABLE"
  },
  {
    "displayName": "Custom Parameters",
    "name": "customParameters",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "key",
        "name": "name",
        "isUnique": true,
        "type": "TEXT",
        "valueHint": "ie: email, coupon, userId, etc..."
      },
      {
        "defaultValue": "",
        "displayName": "value",
        "name": "value",
        "type": "TEXT",
        "valueHint": ""
      }
    ],
    "type": "SIMPLE_TABLE"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
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
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
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
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const makeTableMap = require('makeTableMap');
const query = require('queryPermission');
const createQueue = require('createQueue');
const dataLayerPush = createQueue('dataLayer');
const log = require('logToConsole');
const event = {'event': data.event};
const customParameters = data.customParameters ? makeTableMap(data.customParameters, 'name', 'value') : {};
const transactionParameters = data.transactionParameters ? makeTableMap(data.transactionParameters, 'name', 'value') : {};
const merge = function() {
  const obj = {},
        il = arguments.length;
  let i = 0,
      key;
  for (; i < il; i++) {
    for (key in arguments[i]) {
      if (arguments[i].hasOwnProperty(key)) {
        obj[key] = arguments[i][key];
      }
    }
  }
  return obj;
};
const dataLayer = merge(event, customParameters, transactionParameters);
if (query('access_globals', 'readwrite', 'dataLayer')) {
  dataLayerPush(dataLayer);
  log("data:", dataLayer);
}
data.gtmOnSuccess();


___NOTES___

Created on 7/2/2019, 9:34:14 AM

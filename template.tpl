___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "MACRO",
  "id": "name_normalizer",
  "version": 1,
  "securityGroups": [],
  "displayName": "Name Normalizer",
  "description": "Normalizes first and last names for server-side tracking by removing spaces, punctuation, and numbers while preserving UTF-8 characters.",
  "containerContexts": [
    "SERVER",
    "WEB"
  ],
  "categories": ["UTILITY"],
  "brand": {
    "id": "metryxstudio",
    "displayName": "Metryx Studio"
  }
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "rawName",
    "displayName": "Raw Name",
    "simpleValueType": true,
    "help": "First name or last name in its original form."
  }
]

___SANDBOXED_JS_FOR_SERVER___

var makeString = require('makeString');

var normalizeName = function(data) {
  var rawName = data.rawName;

  if (!rawName) {
    return undefined;
  }

  var nameString = makeString(rawName).trim().toLowerCase();
  
  if (nameString.length === 0) {
    return undefined;
  }
  
  var normalizedName = '';
  var charsToRemove = ' \'"-.,;:!?()[]{}/@#$%^&*+=_|\\<>~`0123456789';
  
  for (var i = 0; i < nameString.length; i++) {
    var char = nameString.charAt(i);
    
    if (charsToRemove.indexOf(char) === -1) {
      normalizedName = normalizedName + char;
    }
  }
  
  if (normalizedName.length === 0) {
    return undefined;
  }
  
  return normalizedName;
};

return normalizeName(data);


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var makeString = require('makeString');

var normalizeName = function(data) {
  var rawName = data.rawName;

  if (!rawName) {
    return undefined;
  }

  var nameString = makeString(rawName).trim().toLowerCase();
  
  if (nameString.length === 0) {
    return undefined;
  }
  
  var normalizedName = '';
  var charsToRemove = ' \'"-.,;:!?()[]{}/@#$%^&*+=_|\\<>~`0123456789';
  
  for (var i = 0; i < nameString.length; i++) {
    var char = nameString.charAt(i);
    
    if (charsToRemove.indexOf(char) === -1) {
      normalizedName = normalizedName + char;
    }
  }
  
  if (normalizedName.length === 0) {
    return undefined;
  }
  
  return normalizedName;
};

return normalizeName(data);



___WEB_PERMISSIONS___

[]


___SERVER_PERMISSIONS___

[]


___TESTS___

scenarios:
- name: Basic normalization
  code: |-
    const mockData = {
      rawName: 'John'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('john');
- name: Uppercase and whitespace
  code: |-
    const mockData = {
      rawName: ' MARY JANE '
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('maryjane');
- name: Apostrophe removal
  code: |-
    const mockData = {
      rawName: "O'Connor"
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('oconnor');
- name: Hyphen removal
  code: |-
    const mockData = {
      rawName: 'Müller-Schmidt'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('müllerschmidt');
- name: UTF-8 characters preserved
  code: |-
    const mockData = {
      rawName: 'Valéry'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('valéry');
- name: UTF-8 with punctuation
  code: |-
    const mockData = {
      rawName: 'José-María'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('josémaría');
- name: Croatian characters
  code: |-
    const mockData = {
      rawName: 'Željko Šimić'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('željkošimić');
- name: German umlaut
  code: |-
    const mockData = {
      rawName: 'Müller'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('müller');
- name: Spanish characters
  code: |-
    const mockData = {
      rawName: 'Nuñez'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('nuñez');
- name: Empty input returns undefined
  code: |-
    const mockData = {
      rawName: ''
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Only whitespace returns undefined
  code: |-
    const mockData = {
      rawName: '   '
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Numbers removed
  code: |-
    const mockData = {
      rawName: 'John123'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('john');
- name: Multiple spaces removed
  code: |-
    const mockData = {
      rawName: 'Mary    Jane'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('maryjane');
- name: Period removal
  code: |-
    const mockData = {
      rawName: 'Dr. Smith'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('drsmith');
- name: Undefined input returns undefined
  code: |-
    const mockData = {};
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Only numbers returns undefined
  code: |-
    const mockData = {
      rawName: '12345'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);

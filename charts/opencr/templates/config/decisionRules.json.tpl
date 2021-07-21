{{- define "config.decisionRules.json" }}
{
  "__comments": {
    "path": "Its a fhir path, for syntax refer to https://www.hl7.org/fhir/fhirpath.html",
    "matchingType": "Must be specified, it can either",
    "threshold": {
      "levenshtein": "Lower the number, the closer the match, 0 being exact match, max threshold is 2",
      "jaro-winkler": "number between 0 and 1, where 0 for no match and 1 for exact match"
    },
    "supported_algorithms": {
      "elasticsearch": ["https://github.com/intrahealth/similarity-scoring"]
    },
    "nullHandling": {
      "nullHandling": "by itself means it is used with either one value or both are null.",
      "nullHandlingBothFields": "it means both values are null",
      "descriptions": "if you have nullHandling and nullHandlingBothFields, then nullHandling is for when only 1 value is null and nullHandlingBothFields is for when both are null.",
      "possible_values_for_nullHandling": {
        "conservative": "means it's not a match",
        "moderate": "means it doesn't affect the score",
        "greedy": "means it is a match"
      },
      "example": [
        "if you have nullHandling = 'conservative' and that's it, and one or both are null, then it won't be considered a match.",
        "if you have nullHandling = 'conservative' and nullHandlingBothFields = 'greedy' then if only 1 is null, then it won't be a match, but if both are null then it will be."
      ]
    }
  },
  "rules": [{
    "matchingType": "deterministic",
    "fields": {
      "given": {
        "algorithm": "jaro-winkler-similarity",
        "threshold": 0.8,
        "fhirpath": "name.where(use='official').given",
        "espath": "given",
        "nullHandling": "moderate",
        "nullHandlingBothFields": "moderate"
      },
      "family": {
        "algorithm": "damerau-levenshtein",
        "threshold": 3,
        "fhirpath": "name.where(use='official').family",
        "espath": "family",
        "nullHandling": "moderate",
        "nullHandlingBothFields": "moderate"
      },
      "phone": {
        "algorithm": "exact",
        "fhirpath": "telecom.where(system='phone').value",
        "espath": "phone",
        "nullHandling": "moderate",
        "nullHandlingBothFields": "moderate"
      }
    },
    "potentialMatchThreshold": 2,
    "autoMatchThreshold": 3,
    "filters": {
      "gender": {
        "fhirpath": "gender",
        "espath": "gender"
      }
    }
  }]
}
{{- end }}
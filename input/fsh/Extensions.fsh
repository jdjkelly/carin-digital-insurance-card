
Extension: PlanBeneficiaries
Id: C4DIC-PlanBeneficiaries-extension
Title: "Plan Beneficiaries"
Description: "This extension allows for the representation of all of the members on the plan with corresponding Names and MemberIDs. This enables health plans to pass this information along with the Coverage resources to align with how this content is printed on physical insurance cards."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* extension contains
	memberId 1..1 MS and
    name 1..1 MS
* extension[memberId] ^short = "Member Id"
* extension[memberId].value[x] 1..1
* extension[memberId].value[x] only string
* extension[name] ^short = "Member Name"
* extension[name].value[x] 1..1
* extension[name].value[x] only HumanName
* extension[name].valueHumanName.family 1..1 MS
* extension[name].valueHumanName.given 0..* MS

Extension: BeneficiaryCosts
Id: C4DIC-BeneficiaryCosts-extension
Title: "Beneficiary Costs"
Description: "This extension allows for the representation of copay details as strings. This can be passed as part of the Coverage resource where payors need to communicate costToBeneficiary details that cannot be expressed as SimpleQuantity or Money data types."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* extension contains
	costToBeneficiary 0..* MS
* extension[costToBeneficiary].extension contains
	type 1..1 MS and
    cost 1..1 MS
* extension[costToBeneficiary] ^short = "Cost to beneficiary"
* extension[costToBeneficiary].extension[type] ^short = "Type of cost"
* extension[costToBeneficiary].extension[type].value[x] 1..1
* extension[costToBeneficiary].extension[type].value[x] only CodeableConcept
* extension[costToBeneficiary].extension[type].valueCodeableConcept from C4DICCopayTypeVS (required)
* extension[costToBeneficiary].extension[cost] ^short = "Cost description"
* extension[costToBeneficiary].extension[cost].value[x] 1..1
* extension[costToBeneficiary].extension[cost].value[x] only string

Extension: AdditionalCardInformation
Id: C4DIC-AdditionalCardInformation-extension
Title: "Additional Insurance Card Information"
Description: "This extension enables the passing of free text items often found on insurance cards. Health plans may provide this extension as part of the Coverage resource to communicate concepts such as TTY, disclaimers about eligibility or limits to coverage, notice of dental or vision coverage, etc."
* value[x] 1..1
* value[x] only Annotation
* ^context[0].type = #element
* ^context[0].expression = "Coverage"

Extension: CardIssueDate
Id: C4DIC-CardIssueDate-extension
Title: "Card Issue Date"
Description: "This extension allows for the expression of the date at which the insurance card was issued by the payer. The health plan may pass this along with the Coverage resource to indicate when the information became in force."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* value[x] 1..1
* value[x] only date

Extension: BackgroundColor
Id: C4DIC-BackgroundColor-extension
Title: "Background Color"
Description: "This extension enables an insurance company to provide a background color to be used by consuming applications when they render the information found on an insurance card for the insurance plan member."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* value[x] only CodeableConcept
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern 
* valueCodeableConcept.coding ^slicing.ordered = false   // can be omitted, since false is the default
* valueCodeableConcept.coding ^slicing.description = "Slice based on $this pattern"
* valueCodeableConcept.coding contains 
    isoColor 1..1
* valueCodeableConcept.coding[isoColor].system = "urn:iso:std:iso-iec:61966:2-1" 
* valueCodeableConcept.coding[isoColor].code 1..1


Extension: HighlightColor
Id: C4DIC-HighlightColor-extension
Title: "Highlight Color"
Description: "This extension enables an insurance company to provide a highlight color to be used by consuming applications when they render the information found on an insurance card for the insurance plan member"
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* value[x] only CodeableConcept
* valueCodeableConcept.coding ^slicing.discriminator.path = "system"
* valueCodeableConcept.coding ^slicing.rules = #open
* valueCodeableConcept.coding ^slicing.discriminator.type = #pattern 
* valueCodeableConcept.coding ^slicing.ordered = false   // can be omitted, since false is the default
* valueCodeableConcept.coding ^slicing.description = "Slice based on $this pattern"
* valueCodeableConcept.coding contains
    isoColor 1..1
* valueCodeableConcept.coding[isoColor].system = "urn:iso:std:iso-iec:61966:2-1" 
* valueCodeableConcept.coding[isoColor].code 1..1

Extension: Logo
Id: C4DIC-Logo-extension
Title: "Logo"
Description: "This extension enables payers to provide an image of their company or organization logo for use by consuming applications when rendering the coverage information for use by the health plan member. This may assist in making the information provided feel more relevant or recongizable by the member. The extension also allows for the health plan to provide a Label for the image which can be displayed in the consuming application as well as a Description of the content in the image file. Detailed descriptions are encouraged to assist with accessibility."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* extension contains
	description 1..1 and
	image 1..1 and
	label 1..1
* extension[description].value[x] only string
* extension[image].value[x] only Attachment
* extension[image].valueAttachment.contentType 1..1
* extension[image].valueAttachment.data 1..1
* extension[label].value[x] only string

Extension: QRCode
Id: C4DIC-QRCode-extension
Title: "QR Code"
Description: "This extension enables payers to provide an image of the QR code found on a member's physicial insurance card. This image may be displayed by consuming applications when rendering the coverage information for use by the health plan member. Often there are data elements relevant to the health plan coverage encoded in the QR code. The extension also allows for the health plan to provide a Label for the image which can be displayed in the consuming application as well as a Description of the content in the image file. Detailed descriptions are encouraged to assist with accessibility."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* extension contains
	description 1..1 and
	image 1..1 and
	label 1..1
* extension[description].value[x] only string
* extension[image].value[x] only Attachment
* extension[image].valueAttachment.contentType 1..1
* extension[image].valueAttachment.data 1..1
* extension[label].value[x] only string

Extension: Barcode
Id: C4DIC-Barcode-extension
Title: "Barcode"
Description: "This extension enables payers to provide an image of the barcode found on a member's physicial insurance card. This image may be displayed by consuming applications when rendering the coverage information for use by the health plan member. Often there are data elements relevant to the health plan coverage encoded in the barcode. The extension also allows for the health plan to provide a Label for the image which can be displayed in the consuming application as well as a Description of the content in the image file. Detailed descriptions are encouraged to assist with accessibility."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* extension contains
	description 1..1 and
	image 1..1 and
	label 1..1
* extension[description].value[x] only string
* extension[image].value[x] only Attachment
* extension[image].valueAttachment.contentType 1..1
* extension[image].valueAttachment.data 1..1
* extension[label].value[x] only string

Extension: SupportingImage
Id: C4DIC-SupportingImage-extension
Title: "Supporting image"
Description: "This extension enables payers to provide other supporting images found on a member's physicial insurance card. A supporting image may be displayed by consuming applications when rendering the coverage information for use by the health plan member. These images may communicate additional information to the member such as the type of coverage provided or partner logos. The extension also allows for the health plan to provide a Label for the image which can be displayed in the consuming application as well as a Description of the content in the image file. Detailed descriptions are encouraged to assist with accessibility."
* ^context[0].type = #element
* ^context[0].expression = "Coverage"
* extension contains
	description 1..1 and
	image 1..1 and
	label 1..1
* extension[description].value[x] only string
* extension[image].value[x] only Attachment
* extension[image].valueAttachment.contentType 1..1
* extension[image].valueAttachment.data 1..1
* extension[label].value[x] only string
